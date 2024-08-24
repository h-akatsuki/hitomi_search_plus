// size:1 count:4 types:1 name:size-5

use std::sync::Arc;

use flutter_rust_bridge::frb;
use tokio::fs;

#[frb]
#[derive(Clone, PartialEq, Eq)]
pub enum TagType {
    Artist,
    Character,
    Group,
    Language,
    Parody,
    Type,
    Female,
    Male,
    Tag,
}

impl TagType {
    fn from_u8(v: u8) -> Self {
        if v > 8 {
            panic!("Invalid TagType: {}", v);
        }
        return unsafe { std::mem::transmute(v) };
    }

    pub fn from_text(s: &str) -> Option<Self> {
        Some(match s {
            "artist" => TagType::Artist,
            "character" => TagType::Character,
            "group" => TagType::Group,
            "language" => TagType::Language,
            "parody" => TagType::Parody,
            "type" => TagType::Type,
            "female" => TagType::Female,
            "male" => TagType::Male,
            "tag" => TagType::Tag,
            _ => return None,
        })
    }
}

struct ClientTag<'a> {
    data: &'a [u8],
}

impl<'a> ClientTag<'a> {
    fn new(data: &[u8]) -> ClientTag {
        ClientTag { data }
    }

    pub fn count(&self) -> u32 {
        let mut buf = [0u8; 4];
        unsafe {
            buf.copy_from_slice(self.data.get_unchecked(0..4));
        }
        u32::from_le_bytes(buf)
    }

    pub fn types(&self) -> TagType {
        TagType::from_u8(*unsafe { self.data.get_unchecked(4) })
    }

    pub fn name(&self) -> &str {
        unsafe { std::str::from_utf8_unchecked(self.data.get_unchecked(5..)) }
    }

    fn score(&self, query: &[char]) -> usize {
        let s = text_score(query, self.name());
        if s == 0 {
            return 0;
        }
        let s2 = match self.types() {
            TagType::Artist | TagType::Group => 1000,
            TagType::Character | TagType::Parody => {
                let count = self.count();
                if count < 10 {
                    10
                } else if count < 1000 {
                    1000
                } else {
                    (1000 * (1 + (count / 5000))) as usize
                }
            }
            TagType::Language | TagType::Type => {
                let count = self.count();
                (count / 3) as usize
            }
            TagType::Tag | TagType::Female | TagType::Male => {
                let count = self.count();
                if count < 50 {
                    10
                } else {
                    (count / 5) as usize
                }
            }
        };
        s * s2
    }
}

fn text_score(query: &[char], target: &str) -> usize {
    let mut gap = 0;
    let mut index = 0;
    let mut before = None;
    let mut next = *unsafe { query.get_unchecked(0) };
    for (i, c) in target.char_indices() {
        if c == next {
            index += 1;
            if let Some(b) = before {
                gap += i - b - 1;
            }
            if index == query.len() {
                if query.len() + 2 > target.len() {
                    if query.len() == target.len() {
                        return 20000;
                    }
                    return 1000;
                }
                return 100 - (gap * 100) / target.len() + 1;
            }
            before = Some(i);
            next = *unsafe { query.get_unchecked(index) };
        }
    }
    return 0;
}

#[frb(opaque)]
pub struct TagSuggest {
    data: Arc<Vec<u8>>,
}

#[frb]
pub struct Tag {
    pub tag_type: TagType,
    pub name: String,
    pub count: u32,
}

#[frb(opaque)]
#[allow(dead_code)]
pub struct TagsResult {
    pub len: i32,
    data: Arc<Vec<u8>>,
    result: Vec<ClientTag<'static>>,
}

impl TagsResult {
    pub fn empty() -> TagsResult {
        TagsResult {
            len: 0,
            data: Arc::new(Vec::new()),
            result: Vec::new(),
        }
    }

    pub fn get_tag(&self, index: i32) -> Tag {
        let tag = &self.result[index as usize];
        Tag {
            tag_type: tag.types(),
            name: tag.name().to_string(),
            count: tag.count(),
        }
    }
}

impl TagSuggest {
    pub async fn new(path: String) -> std::io::Result<TagSuggest> {
        let data = fs::read(path).await?;
        Ok(TagSuggest {
            data: Arc::new(data),
        })
    }

    pub async fn suggest(&self, query: &str) -> TagsResult {
        if query.is_empty() {
            return TagsResult {
                len: 0,
                data: self.data.clone(),
                result: Vec::new(),
            };
        }
        let query: Vec<char> = query.chars().collect();
        let mut socres = Vec::new();

        let mut i = 0;
        while i < self.data.len() {
            let size = unsafe { *self.data.get_unchecked(i) } as usize;
            i += 1;
            let tag: ClientTag<'static> = ClientTag::new(unsafe {
                let ptr = self.data.as_ptr().add(i);
                std::slice::from_raw_parts(ptr, size)
            });
            i += size;
            let score = tag.score(&query);
            if score > 0 {
                socres.push((score, tag));
            }
        }

        socres.sort_by(|a, b| b.0.cmp(&a.0));
        let res: Vec<ClientTag<'static>> = socres.into_iter().map(|(_, tag)| tag).collect();
        TagsResult {
            data: self.data.clone(),
            len: res.len() as i32,
            result: res,
        }
    }

    pub fn suggest_with_type(&self, query: &str, tag_type: TagType) -> TagsResult {
        if query.is_empty() {
            return TagsResult {
                len: 0,
                data: self.data.clone(),
                result: Vec::new(),
            };
        }
        let query: Vec<char> = query.chars().collect();
        let mut socres = Vec::new();

        let mut i = 0;
        while i < self.data.len() {
            let size = unsafe { *self.data.get_unchecked(i) } as usize;
            i += 1;
            let tag: ClientTag<'static> = ClientTag::new(unsafe {
                let ptr = self.data.as_ptr().add(i);
                std::slice::from_raw_parts(ptr, size)
            });
            i += size;
            if tag.types() != tag_type {
                continue;
            }
            let score = tag.score(&query);
            if score > 0 {
                socres.push((score, tag));
            }
        }

        socres.sort_by(|a, b| b.0.cmp(&a.0));
        let res: Vec<ClientTag<'static>> = socres.into_iter().map(|(_, tag)| tag).collect();
        TagsResult {
            data: self.data.clone(),
            len: res.len() as i32,
            result: res,
        }
    }
}
