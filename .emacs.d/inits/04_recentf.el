;; recentf
;; http://www23.atwiki.jp/selflearn/pages/41.html#id_4af821e2
(require 'recentf)
(recentf-mode 1)
;; http://www.clear-code.com/blog/2011/2/16.html
;;; 最近開いたファイルを保存する数を増やす
(setq recentf-max-saved-items 10000)
;; open recent files
(global-set-key "\C-xf" 'recentf-open-files)

