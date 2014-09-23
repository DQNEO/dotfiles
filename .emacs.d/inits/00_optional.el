;; display time mode は画面が崩れるから無効にする
(display-time-mode 0)
(setq display-time-day-and-date nil)

;; 最終行に必ず一行挿入する
(setq require-final-newline t)


;; http://e-arrows.sakura.ne.jp/2010/02/vim-to-emacs.html
;; バッファリストの拡張機能。あんま便利じゃないのではずす。
;;(global-set-key "\C-x\C-b" 'bs-show)

;; colorize region  http://blog.livedoor.jp/t100life/archives/51680860.html
(transient-mark-mode 1)

;; set start up message off
;;(setq inhibit-startup-message t)

;; 1 回の delete-backward-char で複数の whitespace を消す
;; http://www.fan.gr.jp/~ring/Meadow/meadow.html#backward-delete-char-untabify-method
(setq backward-delete-char-untabify-method 'hungry)

;; display time mode
(setq display-time-day-and-date nil)

;; show line-number
(line-number-mode t)

;; 左端に行番号を表示
;; http://d.hatena.ne.jp/sandai/20120304/p2
;;(global-linum-mode nil)
;; (set-face-attribute 'linum nil
;;                     :foreground "#800"
;;                     :height 0.9)
;;(setq linum-format "%4d|")

;; hide menu bar
(menu-bar-mode nil)

;; hilight parenthes
(show-paren-mode t)

;; hilight current line
;; http://emacsblog.org/2007/04/09/highlight-the-current-line/
;; http://e-arrows.sakura.ne.jp/2010/02/vim-to-emacs.html
(global-hl-line-mode t)
