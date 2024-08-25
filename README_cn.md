# Hitomi Search Plus

**Translated by Google Translate**

---

<p align="center">
  <img src="icon/full.png" alt="Hitomi Search Plus Logo" width="200" height="200" style="border-radius: 50%;" />
</p>

<p align="center">
  <strong>快速高效的 Hitomi.la 搜索应用程序</strong>
</p>

<p align="center">
  <a href="https://github.com/h-akatsuki/hitomi_search_plus/releases">
    <img src="https://img.shields.io/github/v/release/h-akatsuki/hitomi_search_plus" alt="最新版本">
  </a>
  <a href="https://discord.gg/cVNvk6MG">
    <img src="https://img.shields.io/badge/Discord-加入聊天-7289da?logo=discord&logoColor=ffffff" alt="加入 Discord">
  </a>
</p>

## 概述和安装

Hitomi Search Plus 是一款轻量级且快速的 Flutter 应用程序，为 Hitomi.la 提供了高级搜索功能。它使用高效的算法和优化的数据结构，可以搜索海量数据并即时显示结果。

### 主要特点

- 极快的搜索性能
- 高级搜索操作，包括分组、OR 和 AND
- 由 Rust 驱动的快速建议功能
- 每个查询的书签功能，并自动更新
- 采用 Material Design 的现代 UI 设计
- 包括图库视图和收藏夹在内的标准功能

### 安装

Hitomi Search Plus 支持以下平台：

- Android (完全支持)
- Windows (部分支持 - 缺少一些布局优化)

对于其他平台，请参阅 Flutter 官方文档。

从 [发布页面](https://github.com/h-akatsuki/hitomi_search_plus/releases) 下载最新版本。


## 主要功能和演示

### 轻量级

- 启动时无需下载数据
- 自定义设计的强大下载器优先下载图像（6 个并行下载）
- 所有操作都是异步的，防止应用程序冻结
- 由一个小的 2MB 索引文件和 Rust 提供支持的快速建议功能

### 高级搜索功能

Hitomi Search Plus 提供强大的搜索功能，让您可以轻松构建复杂的搜索查询。

- 使用 OR 和 AND 运算符灵活创建查询
- 分组以构建复杂的搜索条件
  - 示例：`((tag:name | tag:name2) -tag:name3) | tag:name4`
- 快速建议（在演示视频中查看实时性能）
- 添加自定义标签（例如，`language:none`）
- 无限滚动搜索结果
  - 跳转到特定索引
- 自定义字符串搜索以进行精确匹配
  - 搜索速度等同于标签搜索

| 移动端 UI 演示 | 桌面端截图 |
|---|---|
| <video controls src="https://github.com/user-attachments/assets/0c542585-a6fd-4e0a-982d-9eb0ce19e15d" muted="false" autoplay loop></video> | <img src="https://github.com/user-attachments/assets/9b8c8746-744c-4bad-bd2a-a65dc549b49f" alt="桌面端搜索界面"> |


### 智能书签

- 直接为查询添加书签，而不仅仅是标签
  - 单独应用默认查询
  - 使用自定义标题管理书签
- 后台自动更新
  - 通过定制的搜索服务器批量处理
  - 通常在 500 毫秒内处理复杂的查询（包括包含超过 50 个标签的查询）
- 按更新顺序自动排序

| 书签列表 | 书签编辑 |
|---|---|
| <img src="https://github.com/user-attachments/assets/9d028b04-3f4e-42e5-be30-a5dd6e618fc3" alt="书签概览界面"> | <img src="https://github.com/user-attachments/assets/374d22a3-3111-4014-8072-d9e8cfd71e61" alt="桌面端书签编辑界面"> |


### 阅读器

- 滚动模式
  - 跳转到特定索引
  - 自动调整图像大小
- 页面模式
  - 全屏功能
  - 三种显示选项：
    - 单页
    - 双页
    - 双页（带封面）
- 优先缓存周围页面的智能缓存
- 使用 `Ctrl + Wheel` 进行缩放


## 许可证

Hitomi Search Plus 在 Apache License 2.0 下发布。