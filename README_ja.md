# Hitomi Search Plus

**Translated by Google Translate**

---

<p align="center">
  <img src="icon/full.png" alt="Hitomi Search Plus ロゴ" width="200" height="200" style="border-radius: 50%;" />
</p>

<p align="center">
  <strong>高速で効率的な Hitomi.la 検索アプリケーション</strong>
</p>

<p align="center">
  <a href="https://github.com/h-akatsuki/hitomi_search_plus/releases">
    <img src="https://img.shields.io/github/v/release/h-akatsuki/hitomi_search_plus" alt="最新リリース">
  </a>
  <a href="https://discord.gg/cVNvk6MG">
    <img src="https://img.shields.io/badge/Discord-参加する-7289da?logo=discord&logoColor=ffffff" alt="Discordに参加">
  </a>
</p>

## 概要とインストール

Hitomi Search Plus は、Hitomi.la の高度な検索機能を提供する、軽量で高速な Flutter アプリケーションです。効率的なアルゴリズムと最適化されたデータ構造を使用することで、膨大な量のデータを検索し、瞬時に結果を表示できます。

### 主な機能

- 非常に高速な検索パフォーマンス
- グループ化、OR、AND を含む高度な検索操作
- Rust を利用した高速なサジェスト機能
- クエリごとのブックマークと自動更新
- マテリアルデザインを採用したモダンな UI デザイン
- ギャラリービューやブックマークなど、標準的な機能

### インストール

Hitomi Search Plus は以下のプラットフォームをサポートしています。

- Android (完全サポート)
- Windows (部分サポート - 一部のレイアウト最適化が不足)

その他のプラットフォームについては、Flutter の公式ドキュメントを参照してください。

最新バージョンは[リリースページ](https://github.com/h-akatsuki/hitomi_search_plus/releases)からダウンロードしてください。


## 主な機能とデモ

### 軽量設計

- 起動時にデータのダウンロードは不要
- 画像を優先する独自設計のパワフルなダウンローダー (6 つの並列ダウンロード)
- すべての操作は非同期で、アプリケーションのフリーズを防止
- 小さな 2MB のインデックスファイルと Rust を利用した高速なサジェスト

### 高度な検索機能

Hitomi Search Plus は強力な検索機能を提供し、複雑な検索クエリを簡単に作成できます。

- OR 演算子と AND 演算子を使用した柔軟なクエリ作成
- 複雑な検索条件を構築するためのグループ化
  - 例: `((tag:name | tag:name2) -tag:name3) | tag:name4`
- 高速なサジェスト (デモビデオでリアルタイムのパフォーマンスをご覧ください)
- カスタムタグの追加 (例: `language:none`)
- 無限スクロール検索結果
  - 特定のインデックスへのジャンプ
- 完全一致のためのカスタマイズされた文字列検索
  - タグ検索と同等の検索速度

| モバイル UI デモ | デスクトップスクリーンショット |
|---|---|
| <video controls src="https://github.com/user-attachments/assets/0c542585-a6fd-4e0a-982d-9eb0ce19e15d" muted="false" autoplay loop></video> | <img src="https://github.com/user-attachments/assets/9b8c8746-744c-4bad-bd2a-a65dc549b49f" alt="デスクトップ検索画面"> |


### スマートブックマーク

- タグだけでなく、クエリを直接ブックマーク
  - デフォルトクエリを個別に適用
  - カスタムタイトルでブックマークを管理
- 自動バックグラウンド更新
  - 独自に構築された検索サーバーを介して一括処理
  - 通常、複雑なクエリ (50 以上のタグを含むクエリを含む) を 500ms 以内に処理
- 更新順に自動ソート

| ブックマークリスト | ブックマーク編集 |
|---|---|
| <img src="https://github.com/user-attachments/assets/9d028b04-3f4e-42e5-be30-a5dd6e618fc3" alt="ブックマーク概要画面"> | <img src="https://github.com/user-attachments/assets/374d22a3-3111-4014-8072-d9e8cfd71e61" alt="デスクトップブックマーク編集画面"> |


### ビューア

- スクロールモード
  - 特定のインデックスへのジャンプ
  - 画像の自動リサイズ
- ページモード
  - フルスクリーン機能
  - 3 つの表示オプション:
    - 単ページ
    - 見開きページ
    - 見開きページ (表紙付き)
- 周囲のページを優先するスマートキャッシング
- `Ctrl + ホイール` でズーム


## ライセンス

Hitomi Search Plus は Apache License 2.0 の下でリリースされています。
