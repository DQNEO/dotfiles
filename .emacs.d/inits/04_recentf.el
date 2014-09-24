;; recentf
;; http://www23.atwiki.jp/selflearn/pages/41.html#id_4af821e2

;; http://shibayu36.hatenablog.com/entry/2012/12/29/001418
(recentf-mode 1)
;; http://www.clear-code.com/blog/2011/2/16.html
;;; 最近開いたファイルを保存する数を増やす
(setq recentf-max-saved-items 10000)

 (setq recentf-exclude '(".recentf"))

;; http://qiita.com/catatsuy/items/55d50d13ebc965e5f31e
;; idle timeに自動保存
(setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
;; open recent files
(global-set-key "\C-xf" 'recentf-open-files)

(require 'recentf-ext)
