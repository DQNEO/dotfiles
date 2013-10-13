;; Packages
;; http://d.hatena.ne.jp/naoya/20130107/1357553140
;; Emacs 24 の初期状態ではパッケージ提供元が elpa.gnu.org のみでやや数が少ないので
;; 下記のように設定して増やしてあげると良いでしょう。
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; Langeage
(set-language-environment 'Japanese)

;; Coding system.
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Theme 
;  http://d.hatena.ne.jp/aoe-tk/20130210/1360506829
(load-theme 'misterioso t)

;; Global Set Keys
;; C-h as backspace
(global-set-key "\C-h" 'delete-backward-char)

;; disable toggle-input-method and use it as help-command
(global-set-key "\C-\\" 'help-command)

;; compare-window
(global-set-key "\C-cw" 'compare-windows)

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

; run-file
(defun run-file()
  (interactive)
  (shell-command (concat "./" (file-name-nondirectory (buffer-file-name)))))

(global-set-key  "\C-cr" 'run-file)

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
