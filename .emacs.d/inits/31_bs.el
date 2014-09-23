;;============== bs.el(バッファ切り替えモジュール) ===================
;; http://yak-shaver.blogspot.jp/2013/03/cycle-bufferel.html
;; cycle-buffer.el もう古いらしく、い
;; 今は bs.el というバッファ切替えモジュールが標準である。
(global-set-key [(f9)] 'bs-cycle-previous)
(global-set-key [(f10)] 'bs-cycle-next)
;; *scratch*バッファも表示候補に入れる
(setq bs-cycle-configuration-name "files-and-scratch")
