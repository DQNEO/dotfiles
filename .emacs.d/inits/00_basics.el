;;============ Global Keybind ====================
;; C-h as backspace
(global-set-key "\C-h" 'delete-backward-char)

;; M-h as backspace for word
;; http://d.hatena.ne.jp/akisute3/
(global-set-key (kbd "M-h") 'backward-kill-word)

;; C-M-%が使えないので、代替。
(global-set-key "\M-$" 'replace-regexp)

;; keybind for help
;; http://flex.ee.uec.ac.jp/texi/faq-jp/faq-jp_79.html
;; override mark-whole-buffer
(global-set-key "\C-ch" 'help-command)
;; disable toggle-input-method and replace it as help-command
(global-set-key "\C-\\" 'help-command)
(global-set-key (kbd "M-?") 'help-for-help)

;; iswitchb-mode on
(iswitchb-mode t)

; branch切り替えた時に開いてるBufferを自動更新
; http://yoshiori.github.io/blog/2013/01/31/file-update-emacs/
; 変更のあったファイルの自動再読み込み
(global-auto-revert-mode 1)

;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;; http://tech.kayac.com/archive/emacs.html
;; ~つきのバックアップファイルを作らない
(setq make-backup-files nil)

(setq backup-inhibited t)

;; http://www.cozmixng.org/~kou/emacs/dot_emacs
(setq kill-whole-line t)

;; add to load-path
(add-to-list 'load-path "~/.emacs.d/site-lisp" )

;; http://tatanaideyo.hatenablog.com/entry/2014/03/04/084901
;;タブではなくスペースを使う
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)
