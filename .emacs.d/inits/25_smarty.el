;; 拡張子tplのファイルはhtml-modeで開く
;;http://blog.livedoor.jp/ubuntumini/archives/51253507.html
(setq auto-mode-alist
      (cons (cons "\\.tpl$" 'html-mode) auto-mode-alist))
