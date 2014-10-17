## 移動関連
M-m 行の最初の文字に移動
M-a, M-e:文単位で移動


C-M-f, C-M-b:現在のインデントで，式単位で移動 
C-M-n, C-M-p:括弧単位で移動する
C-M-u, C-M-d:インデントを 1 つ上がる (下がる)
C-M-a, C-M-e:関数単位での移動
C-M-k:式を切り取る
C-M-\:リージョン内を再インデント


C-u 8 C-x $ 折り畳み
C-x $ 折り畳み解除

http://www.bookshelf.jp/soft/meadow_42.html#SEC643

## 空白削除系
M-space

## VC-mode
C-u C-x v g  リビジョンを指定してannotate
http://e-arrows.sakura.ne.jp/2010/02/vim-to-emacs.html

## .emacsに必ず書くこと

;; do not make backup files
(setq make-backup-files nil)

## 矩形編集

C-x r o 空白文字で埋まった矩形を挿入
C-x r d 矩形を削除
C-x r t 矩形を文字列で置き換え
C-x r c 矩形を空白文字で置き換え
C-x r k 矩形をキルリングに追加
C-x r y キルリングをヤンク