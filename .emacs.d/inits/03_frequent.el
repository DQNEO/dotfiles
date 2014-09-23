;; 頻繁に使うコマンド群

;; compare-window
(global-set-key "\C-cw" 'compare-windows)

;; goto-line
(global-set-key "\M-g" 'goto-line)

;; copy current word
;; http://sh1.2-d.jp/b/2006-07-16-00-44.html
(ffap-bindings)
(global-set-key "\C-cc" 'ffap-copy-string-as-kill)
