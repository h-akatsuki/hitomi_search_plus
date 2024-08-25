# Hitomi Search Plus

[Kr](README_kr.md) | [En](README.md) | [Cn](README_cn.md) | [Ja](README_ja.md)
---


<p align="center">
  <img src="icon/full.png" alt="Hitomi Search Plus Logo" width="200" height="200" style="border-radius: 50%;" />
</p>

<p align="center">
  <strong>A fast and efficient Hitomi.la search application</strong>
</p>

<p align="center">
  <a href="https://github.com/h-akatsuki/hitomi_search_plus/releases">
    <img src="https://img.shields.io/github/v/release/h-akatsuki/hitomi_search_plus" alt="Latest Release">
  </a>
  <a href="https://discord.gg/cVNvk6MG">
    <img src="https://img.shields.io/badge/Discord-Join%20Chat-7289da?logo=discord&logoColor=ffffff" alt="Join Discord">
  </a>
</p>

## Overview and Installation

Hitomi Search Plus is a lightweight and fast Flutter application that provides advanced search capabilities for Hitomi.la.  Using efficient algorithms and optimized data structures, it can search through massive amounts of data and display results instantly.

### Key Features

- Blazing fast search performance
- Advanced search operations including grouping, OR, and AND
- High-speed suggestion functionality powered by Rust
- Per-query bookmarking with automatic updates
- Modern UI design with Material Design
- Standard features including gallery view and favorites

### Installation

Hitomi Search Plus supports the following platforms:

- Android (Fully Supported)
- Windows (Partially Supported - Some layout optimizations missing)

For other platforms, please refer to the official Flutter documentation.

Download the latest version from the [Releases Page](https://github.com/your_username/hitomi_search_plus/releases).


## Key Features and Demo

### Lightweight

- No data download required on startup
- Custom-designed powerful downloader prioritizes images (6 parallel downloads)
- All operations are asynchronous, preventing application freezes
- Fast suggestion powered by a small 2MB index file and Rust

### Advanced Search Functionality

Hitomi Search Plus offers powerful search capabilities, allowing you to easily construct complex search queries.

- Flexible query creation with OR and AND operators
- Grouping for building complex search conditions
  - Example: `((tag:name | tag:name2) -tag:name3) | tag:name4`
- Fast suggestion (see real-time performance in the demo video)
- Add custom tags (e.g., `language:none`)
- Infinite scrolling search results
  - Jump to specific index
- Customized string search for exact matches
  - Search speed equivalent to tag search

| Mobile UI Demo | Desktop Screenshot |
|---|---|
| <video controls src="https://github.com/user-attachments/assets/0c542585-a6fd-4e0a-982d-9eb0ce19e15d" muted="false" autoplay loop></video> | <img src="https://github.com/user-attachments/assets/9b8c8746-744c-4bad-bd2a-a65dc549b49f" alt="Desktop Search Screen"> |


### Smart Bookmarks

- Bookmark queries directly, not just tags
  - Apply default queries individually
  - Manage bookmarks with custom titles
- Automatic background updates
  - Processed in bulk via a custom-built search server
  - Typically processes complex queries (including those with over 50 tags) within 500ms
- Automatic sorting by update order

| Bookmark List | Bookmark Editing |
|---|---|
| <img src="https://github.com/user-attachments/assets/9d028b04-3f4e-42e5-be30-a5dd6e618fc3" alt="Bookmark Overview Screen"> | <img src="https://github.com/user-attachments/assets/374d22a3-3111-4014-8072-d9e8cfd71e61" alt="Desktop Bookmark Editing Screen"> |


### Viewer

- Scroll Mode
  - Jump to specific index
  - Automatic image resizing
- Page Mode
  - Fullscreen functionality
  - Three display options:
    - Single Page
    - Double Page
    - Double Page (with Cover)
- Smart caching that prioritizes surrounding pages
- Zoom with `Ctrl + Wheel`


## License

Hitomi Search Plus is released under the Apache License 2.0.
