use colored::*;
use futures_util::StreamExt;
use indicatif::{ProgressBar, ProgressStyle};
use reqwest;
use std::fs::{self, File};
use std::io::{self, Write};
use std::path::Path;
use zip::ZipArchive;

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    print_logo();

    println!("{}", "Starting update process...".yellow());

    let zip_url = "https://github.com/h-akatsuki/hitomi_search_plus/releases/latest/download/release-windows.zip";
    download_file(zip_url, "update.zip").await?;

    println!("{}", "Cleaning up old files...".cyan());
    clean_directory()?;

    println!("{}", "Extracting new files...".cyan());
    extract_zip("update.zip", ".")?;

    println!("{}", "Deleting update.zip...".cyan());
    delete_zip("update.zip")?;

    println!("{}", "Update completed successfully!".green().bold());
    println!(
        "{}",
        "Press Enter to exit and restart the application...".cyan()
    );
    let _ = io::stdin().read_line(&mut String::new());

    Ok(())
}

fn print_logo() {
    println!(
        "{}",
        r"
 _   _ _ _                 _   _____                     _     
| | | (_) |               (_) /  ___|                   | |    
| |_| |_| |_ ___  _ __ ___ _  \ `--.  ___  __ _ _ __ ___| |__  
|  _  | | __/ _ \| '_ ` _ \ |  `--. \/ _ \/ _` | '__/ __| '_ \ 
| | | | | || (_) | | | | | | | /\__/ /  __/ (_| | | | (__| | | |
\_| |_/_|\__\___/|_| |_| |_|_| \____/ \___|\__,_|_|  \___|_| |_|
                                                               
 _   _           _       _            
| | | |         | |     | |           
| | | |_ __   __| | __ _| |_ ___ _ __ 
| | | | '_ \ / _` |/ _` | __/ _ \ '__|
| |_| | |_) | (_| | (_| | ||  __/ |   
 \___/| .__/ \__,_|\__,_|\__\___|_|   
      | |                             
      |_|                             
    "
        .bright_cyan()
    );
}

async fn download_file(url: &str, path: &str) -> Result<(), Box<dyn std::error::Error>> {
    let resp = reqwest::get(url).await?;
    let total_size = resp.content_length().unwrap_or(0);

    let pb = ProgressBar::new(total_size);
    pb.set_style(ProgressStyle::default_bar()
        .template("{spinner:.green} [{elapsed_precise}] [{wide_bar:.cyan/blue}] {bytes}/{total_bytes} ({eta})").unwrap()
        .progress_chars("#>-"));

    let mut file = File::create(path)?;
    let mut downloaded: u64 = 0;
    let mut stream = resp.bytes_stream();

    while let Some(item) = stream.next().await {
        let chunk = item?;
        file.write_all(&chunk)?;
        let new = std::cmp::min(downloaded + (chunk.len() as u64), total_size);
        downloaded = new;
        pb.set_position(new);
    }

    pb.finish_with_message("Download completed");
    Ok(())
}

fn clean_directory() -> io::Result<()> {
    for entry in fs::read_dir(".")? {
        let entry = entry?;
        let path = entry.path();
        if path.is_file()
            && path.file_name().unwrap() != "updater.exe"
            && path.file_name().unwrap() != "update.zip"
            && path.file_name().unwrap() != "updater.bat"
        {
            fs::remove_file(path)?;
        } else if path.is_dir() && path.file_name().unwrap() != "save" {
            fs::remove_dir_all(path)?;
        }
    }
    Ok(())
}

fn extract_zip(zip_path: &str, extract_to: &str) -> Result<(), Box<dyn std::error::Error>> {
    let file = File::open(zip_path)?;
    let mut archive = ZipArchive::new(file)?;

    for i in 0..archive.len() {
        let mut file = archive.by_index(i)?;
        let outpath = Path::new(extract_to).join(file.mangled_name());

        if (&*file.name()).ends_with('/') {
            fs::create_dir_all(&outpath)?;
        } else {
            if let Some(p) = outpath.parent() {
                if !p.exists() {
                    fs::create_dir_all(p)?;
                }
            }
            let mut outfile = File::create(&outpath)?;
            io::copy(&mut file, &mut outfile)?;
        }
    }

    Ok(())
}

fn delete_zip(zip_path: &str) -> io::Result<()> {
    fs::remove_file(zip_path)
}
