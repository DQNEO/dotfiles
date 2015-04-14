;; Emacsの小技集

;; bookmark
`C-x r l`    list-bookmarks
`C-x r b`    jump to the bookmark


;; Tramp

sudo でファイルを開く
C-x C-fしてから
/sudo::/etc/hosts


;; 矩形編集 くけい

C-x r k   rectangle kill
C-x r y   rectangle yank


;; describe系コマンド

f1 m  describe-mode
f1 f  describe-functino
f1 k  describe-key
f1 b  describe-bindings


;; 複数のシェルを開く

C-u M-x shell

既存の*shell*をリネーム
M-x rename-buffer

;; コード編集

C-M \ indent-region
C-M p begin of brancket
C-M n end   of brancket


;; VC mode

C-x v v commit
C-x v = diff
C-x v u update
C-x c c commit
C-x v l log

;; コマンドの作り方
;; コマンドとはinteractiveな関数である。
;; もっとも分かりやすい例が mark-whole-buffer

(defun mark-whole-buffer ()
  "Put point at beginning and mark at end of buffer.
You probably should not use this function in Lisp programs;
it is usually a mistake for a Lisp function to use any subroutine
that uses or sets the mark."
  (interactive)
  (push-mark (point))
  (push-mark (point-max) nil t)
  (goto-char (point-min)))



;; やりたいこと

メールを読み書きする -> RMAIL


* dired
  ファイルサイズ順にソートする -> dired-xでできる？

  emacsを終了しても、開いていたファイルを覚えておいて欲しい。 -> recent-f ?
  秀丸みたいに「前回修正した箇所」に飛べるようにしたい。
  WinMergeのように色つきのdiffを見たい  -> ediff ?
  テストファイルを保存したらテストが走るようにしたい。-> add-hook ?

  リファクタリングを支援してほしい。
  関数の定義箇所に飛びたい
  カーソル上の単語をgrep検索したい
  親クラスを一発で開きたい
  クラスファイルを一発で開きたい


-- 前回の編集場所を記憶する saveplace

GNU Emacsでファイル保存に、カーソル位置を記憶し、
次回にそのファイルを開いたときに、前回の編集していた位置(場所)から編集


- trunk内の.tファイルを開いたらPHPモードにする。


