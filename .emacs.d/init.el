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

;; http://tech.kayac.com/archive/emacs.html
(setq make-backup-files nil)

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

