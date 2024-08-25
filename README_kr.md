# Hitomi Search Plus

**Translated by Google Translate**

---

<p align="center">
  <img src="icon/full.png" alt="Hitomi Search Plus 로고" width="200" height="200" style="border-radius: 50%;" />
</p>

<p align="center">
  <strong>빠르고 효율적인 Hitomi.la 검색 애플리케이션</strong>
</p>

<p align="center">
  <a href="https://github.com/h-akatsuki/hitomi_search_plus/releases">
    <img src="https://img.shields.io/github/v/release/h-akatsuki/hitomi_search_plus" alt="최신 릴리스">
  </a>
  <a href="https://discord.gg/cVNvk6MG">
    <img src="https://img.shields.io/badge/Discord-채팅 참여-7289da?logo=discord&logoColor=ffffff" alt="Discord 참여">
  </a>
</p>

## 개요 및 설치

Hitomi Search Plus는 Hitomi.la에 대한 고급 검색 기능을 제공하는 가볍고 빠른 Flutter 애플리케이션입니다. 효율적인 알고리즘과 최적화된 데이터 구조를 사용하여 방대한 양의 데이터를 검색하고 결과를 즉시 표시할 수 있습니다.

### 주요 기능

- 매우 빠른 검색 성능
- 그룹화, OR, AND를 포함한 고급 검색 작업
- Rust 기반의 고속 제안 기능
- 자동 업데이트 기능이 있는 쿼리별 북마크
- Material Design을 사용한 현대적인 UI 디자인
- 갤러리 보기 및 즐겨찾기를 포함한 표준 기능

### 설치

Hitomi Search Plus는 다음 플랫폼을 지원합니다.

- Android (완벽 지원)
- Windows (부분 지원 - 일부 레이아웃 최적화 누락)

다른 플랫폼의 경우 공식 Flutter 문서를 참조하십시오.

[릴리스 페이지](https://github.com/h-akatuki/hitomi_search_plus/releases)에서 최신 버전을 다운로드하십시오.


## 주요 기능 및 데모

### 가벼움

- 시작 시 데이터 다운로드 필요 없음
- 이미지 우선 순위를 지정하는 맞춤형 고성능 다운로더 (6개 병렬 다운로드)
- 모든 작업은 비동기식으로 처리되어 애플리케이션 정지를 방지
- 작은 2MB 인덱스 파일과 Rust 기반의 빠른 제안

### 고급 검색 기능

Hitomi Search Plus는 강력한 검색 기능을 제공하여 복잡한 검색 쿼리를 쉽게 구성할 수 있습니다.

- OR 및 AND 연산자를 사용한 유연한 쿼리 생성
- 복잡한 검색 조건을 구축하기 위한 그룹화
  - 예: `((tag:name | tag:name2) -tag:name3) | tag:name4`
- 빠른 제안 (데모 비디오에서 실시간 성능 확인)
- 사용자 정의 태그 추가 (예: `language:none`)
- 무한 스크롤 검색 결과
  - 특정 인덱스로 이동
- 정확히 일치하는 항목을 위한 사용자 정의 문자열 검색
  - 태그 검색과 동일한 검색 속도

| 모바일 UI 데모 | 데스크톱 스크린샷 |
|---|---|
| <video controls src="https://github.com/user-attachments/assets/0c542585-a6fd-4e0a-982d-9eb0ce19e15d" muted="false" autoplay loop></video> | <img src="https://github.com/user-attachments/assets/9b8c8746-744c-4bad-bd2a-a65dc549b49f" alt="데스크톱 검색 화면"> |


### 스마트 북마크

- 태그뿐만 아니라 쿼리를 직접 북마크
  - 기본 쿼리를 개별적으로 적용
  - 사용자 정의 제목으로 북마크 관리
- 자동 백그라운드 업데이트
  - 맞춤형 검색 서버를 통해 일괄 처리
  - 일반적으로 500ms 이내에 복잡한 쿼리 (50개 이상의 태그 포함) 처리
- 업데이트 순서에 따라 자동 정렬

| 북마크 목록 | 북마크 편집 |
|---|---|
| <img src="https://github.com/user-attachments/assets/9d028b04-3f4e-42e5-be30-a5dd6e618fc3" alt="북마크 개요 화면"> | <img src="https://github.com/user-attachments/assets/374d22a3-3111-4014-8072-d9e8cfd71e61" alt="데스크톱 북마크 편집 화면"> |


### 뷰어

- 스크롤 모드
  - 특정 인덱스로 이동
  - 자동 이미지 크기 조정
- 페이지 모드
  - 전체 화면 기능
  - 세 가지 표시 옵션:
    - 단일 페이지
    - 두 페이지
    - 두 페이지 (표지 포함)
- 주변 페이지를 우선적으로 처리하는 스마트 캐싱
- `Ctrl + 휠`을 사용한 확대/축소


## 라이선스

Hitomi Search Plus는 Apache License 2.0에 따라 출시되었습니다.
