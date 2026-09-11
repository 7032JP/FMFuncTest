; =============================================================================
; psgdata.asm — PSG 音声データを単体のバイナリにするためのラッパ
;   実体は assets/psgdata.s (wav2psg.py が生成)。
;   IPL がディスクから $1100 へ読み込む (psgvoice.asm の PSGDAT と一致)。
;
; 【クリーンルーム宣言】
;   本ファイルはデータのラッパであり、他のソフトウェアのコードは含まない。
;   音声データ (assets/psgdata.s) は本リポジトリ同梱の録音 (assets/fm7psg.wav) から
;   wav2psg.py で生成した独自のものである。
;
; ビルド: lwasm --6809 --format=raw -I assets -o psgdata.bin psgdata.asm
; =============================================================================

        org     $1100

        include "psgdata.s"

        end
