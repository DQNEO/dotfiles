;; http://d.hatena.ne.jp/naoya/20130107/1357553140
;; Emacs 24 の初期状態ではパッケージ提供元が elpa.gnu.org のみでやや数が少ないので
;; 下記のように設定して増やしてあげると良いでしょう。
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;;=========== Global Set Key ===========
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

;;=========== Buffer Handling ===========
;; iswitchb-mode on
(iswitchb-mode 1)
