;;=============== shell-mode ===============
;; http://www.namazu.org/~tsuchiya/elisp/index.html#script
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;=============== shell-pop ===============
;; http://d.hatena.ne.jp/kyagi/20090601/1243841415
;; http://d.hatena.ne.jp/kyagi/20121024/1351012197
(require 'shell-pop)
(global-set-key [f8] 'shell-pop)
