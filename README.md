# FMFuncTest — FM-7 / FM77AV 機能別サンプルプログラム集

FM-7 / FM77AV シリーズの個別機能 (マウス、FM 音源の CSM 音声合成、PSG による
音声再生など) を、実機およびエミュレータ上で実際に動かして確認するための
サンプルプログラム集です。1 デモ 1 テーマで「この機能をどう実装するか」を示します。

各デモは F-BASIC を使わない 2D ディスクイメージ (`.d77`) として単体で起動し、
実機・エミュレータで動作します。デモごとに README・ソース・Makefile・
起動用ディスクイメージが揃っており、フォルダ単位で完結しています。

## 前提: FM7BaseCode

本シリーズは [FM7BaseCode](https://github.com/7032JP/FM7BaseCode) を前提知識と
しています。FM7BaseCode は CMOC + LWASM で FM-7 / FM77AV 用プログラムを作る
ベーステンプレートで、ディスク直接ブート・メイン/サブ CPU の連携・VRAM・
PSG などの基礎を扱います。そこで基礎を学んだうえで、本リポジトリの各デモで
個別機能の実装例を参照してください。

## 収録デモ

| デモ | 内容 | 対象機種 | 必要ツール |
|------|------|---------|-----------|
| [mouse](mouse/) | マウスカーソルデモ。バスマウス / インテリジェントマウスの両対応、画面モード切替ボタン付き | FM-7 / FM77AV / FM77AV40 / FM77AV40EX | lwasm + Node.js |
| [psgvoice](psgvoice/) | PSG (AY-3-8910) だけで音声 WAV を再生するデモ。音量レジスタをサンプルごとに書き換えて PSG の音量 D/A 変換器を 4 ビット DAC として使うサンプリング再生 (11025Hz)。FM 音源は使わないので FM-7 本体のみで動作。ディスク起動に加え `make t77` で CMT (カセットテープ) ロードにも対応 | FM-7 / FM77AV (動作確認済み) | lwasm + Node.js (+ Python 3: 音声データと CMT イメージの再生成) |
| [ym2203csm](ym2203csm/) | YM2203 (OPN) の CSM モードによる音声合成デモ。サンプリングではなくピッチ + 4 フォルマントのパラメータ (14 バイト/10.1725ms) で人の声を鳴らす | FM77AV / FM77AV40 / FM77AV40EX (FM-7 は非対応メッセージを表示して停止) | lwasm + Node.js (+ Python 3 + NumPy + SciPy: CSM パラメータの再生成 / + Pillow: 画像データの再生成) |

各デモの `.d77` は同梱済みで、ツールがなくてもそのまま起動できます。
ソースを改変して作り直す場合は各フォルダで `make` を実行してください
(共通して [lwtools](http://www.lwtools.ca/) の `lwasm` と Node.js が必要です)。

## ディレクトリ構成

```
README.md        本ファイル (シリーズの索引)
LICENSE          MIT ライセンス
scripts/         デモ共通の補助ツール (D77 → T77 / WAV 変換など)
mouse/           マウスカーソルデモ
psgvoice/        PSG 音声再生デモ
ym2203csm/       YM2203 CSM 音声合成デモ
```

## デモの追加について

本リポジトリは「増えていくシリーズ」です。新しい機能デモは、次の形で追加します。

1. デモ名のフォルダを作り、README (操作方法・ビルド方法・仕組み)、ソース、
   Makefile、起動用の `.d77` を置く (フォルダ単位で完結させる)
2. 各ソースの冒頭に、独自実装である旨と参照した公式資料の章番号を記す
3. 上の「収録デモ」の表に 1 行追記する (デモ名 / 内容 / 対象機種 / 必要ツール)

## ライセンス

MIT License。詳細は [LICENSE](LICENSE) を参照してください。
`scripts/d77_to_t77_chunks.py` とそのトランポリン (`scripts/trampoline.asm` / `scripts/trampoline_*.bin`) は
D77TOT77WAV 由来のツールで、同じく MIT ライセンスです
([scripts/D77TOT77WAV.LICENSE.txt](scripts/D77TOT77WAV.LICENSE.txt))。

## 商標について

※「FM-7」「FM77AV」「FUJITSU MICRO 7」「F-BASIC」は富士通株式会社の商標または登録商標です。本プロジェクトは富士通株式会社とは一切関係ありません。
