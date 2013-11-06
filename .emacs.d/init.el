;; Packages
;; http://d.hatena.ne.jp/naoya/20130107/1357553140
;; Emacs 24 のデフォルトではパッケージ提供元が
;; elpa.gnu.org のみなので
;; 下記のように設定して増やしてあげる
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; Language
(set-language-environment 'Japanese)

;; Coding system.
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

;; Theme 
;  http://d.hatena.ne.jp/aoe-tk/20130210/1360506829
(load-theme 'misterioso t)

;;============ Global Keybind ====================
;; C-h as backspace
(global-set-key "\C-h" 'delete-backward-char)

;; disable toggle-input-method and use it as help-command
(global-set-key "\C-\\" 'help-command)

;; compare-window
(global-set-key "\C-cw" 'compare-windows)

;; http://flex.ee.uec.ac.jp/texi/faq-jp/faq-jp_79.html
;; override mark-whole-buffer
(global-set-key "\C-ch" 'help-command)

;; カレントバッファのファイルパスを表示
(defun show-file-path()
  (interactive)
  (message (buffer-file-name))
  )
(global-set-key  "\C-cp" 'show-file-path)

;; revert-buffer-force
(defun revert-buffer-force()
  (interactive)
  (revert-buffer nil t)
  (message "revert-buffer-force done.")
)
(global-set-key "\C-cv" 'revert-buffer-force)

;; run-file
(defun run-file()
  (interactive)
  (shell-command (concat "./" (file-name-nondirectory (buffer-file-name)))))

(global-set-key  "\C-cr" 'run-file)

;; http://tech.kayac.com/archive/emacs.html
; ~つきのバックアップファイルを作らない
(setq make-backup-files nil)

;; http://www.cozmixng.org/~kou/emacs/dot_emacs
(setq kill-whole-line t)


;;============ Global Variables ====================

;; set start up message off
;;(setq inhibit-startup-message t)

;; 1 回の delete-backward-char で複数の whitespace を消す
;; http://www.fan.gr.jp/~ring/Meadow/meadow.html#backward-delete-char-untabify-method
(setq backward-delete-char-untabify-method 'hungry)

;; display time mode
(setq display-time-day-and-date nil)

(setq c-set-style "stroustrup")

;; iswitchb-mode on
(iswitchb-mode 1)

;; colorize region  http://blog.livedoor.jp/t100life/archives/51680860.html
(transient-mark-mode 1)

;; show line-number
(line-number-mode t)

;; hide menu bar
(menu-bar-mode nil)


;; hilight parenthes
(show-paren-mode t)

;; hilight current line
;; http://emacsblog.org/2007/04/09/highlight-the-current-line/
(global-hl-line-mode nil)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;=============== session.el ===============
;; http://openlab.dino.co.jp/2008/09/26/230919351.html
;;session.el + minibuf-isearchが便利すぎる — ディノオープンラボラトリ

;; ミニバッファ履歴リストの最大長：tなら無限
(setq history-length t)
;; session.el
;;   kill-ringやミニバッファで過去に開いたファイルなどの履歴を保存する
(when (require 'session nil t)
  (setq session-initialize '(de-saveplace session keys menus places)
        session-globals-include '((kill-ring 50)
                                  (session-file-alist 500 t)
                                  (file-name-history 10000)))
  (add-hook 'after-init-hook 'session-initialize)
  ;; 前回閉じたときの位置にカーソルを復帰
  (setq session-undo-check -1))
;; minibuf-isearch
;;   minibufでisearchを使えるようにする
(require 'minibuf-isearch nil t)

;;=============== Custom ===============
;; disable tab
(custom-set-variables
 '(indent-tabs-mode nil))

;; copy current word
;; http://sh1.2-d.jp/b/2006-07-16-00-44.html
(ffap-bindings)
(global-set-key "\C-cc" 'ffap-copy-string-as-kill)


;;=============== shell-mode ===============
;; http://www.namazu.org/~tsuchiya/elisp/index.html#script
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
          "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;; recentf
;; http://www23.atwiki.jp/selflearn/pages/41.html#id_4af821e2
(require 'recentf)
(recentf-mode 1)
(global-set-key "\C-xf" 'recentf-open-files)

;; Buffer Handling
; iswitchb-mode on
(iswitchb-mode 1)

;; Git
; EmacsのGitクライアント：Magit
; http://qiita.com/takc923/items/c7a11ff30caedc4c5ba7
(require 'magit)

; branch切り替えた時に開いてるBufferを自動更新
; http://yoshiori.github.io/blog/2013/01/31/file-update-emacs/
; 変更のあったファイルの自動再読み込み
(global-auto-revert-mode 1)


; ~つきのバックアップファイルを作らない
(setq make-backup-files nil)

;;=============== auto chmod ===============
;; ファイル保存時にchmodする
;; chmod +x when you save a file
;; http://www.namazu.org/~tsuchiya/elisp/index.html#chmod
(defun make-file-executable ()
  "Make the file of this buffer executable, when it is a script source."
  (save-restriction
    (widen)
    (if (string= "#!" (buffer-substring-no-properties 1 (min 3 (point-max))))
        (let ((name (buffer-file-name)))
          (or (equal ?. (string-to-char (file-name-nondirectory name)))
              (let ((mode (file-modes name)))
                (set-file-modes name (logior mode (logand (/ mode 4) 73)))
                (message (concat "Wrote " name " (+x)"))))))))
(add-hook 'after-save-hook 'make-file-executable)


;;=============== shell-pop ===============
;; http://d.hatena.ne.jp/kyagi/20090601/1243841415
(require 'shell-pop)
(global-set-key [f8] 'shell-pop)

;;=============== js2-mode ================
;; http://memememomo.hatenablog.com/entry/2013/03/23/125240
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.\\(js\\|json\\)$" . js2-mode))

;; http://blog.ainam.me/2011/12/13/emacs-js2-mode-indent/
;; インデントの関数の再設定
(add-hook 'js2-mode-hook
          #'(lambda ()
              (require 'js)
              (setq js-indent-level 2
                    js-expr-indent-offset 2
                    indent-tabs-mode nil)
              (set (make-local-variable 'indent-line-function) 'js-indent-line)))

;;=============== swap-screen ===============
;; これは超便利。
;; 
;; http://www.bookshelf.jp/soft/meadow_30.html#SEC405
;; exchange right <->left window
(defun swap-screen()
  "Swap two screen,leaving cursor at current window."
  (interactive)
  (let ((thiswin (selected-window))
        (nextbuf (window-buffer (next-window))))
    (set-window-buffer (next-window) (window-buffer))
    (set-window-buffer thiswin nextbuf)))
(defun swap-screen-with-cursor()
  "Swap two screen,with cursor in same buffer."
  (interactive)
  (let ((thiswin (selected-window))
        (thisbuf (window-buffer)))
    (other-window 1)
    (set-window-buffer thiswin (window-buffer))
    (set-window-buffer (selected-window) thisbuf)))
(global-set-key [f2] 'swap-screen)
(global-set-key [S-f2] 'swap-screen-with-cursor)

(global-set-key "\C-cx" 'swap-screen)
