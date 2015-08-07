;;=============== js2-mode ================
;; http://memememomo.hatenablog.com/entry/2013/03/23/125240
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.\\(js\\|json\\)$" . js2-mode))

;; http://blog.ainam.me/2011/12/13/emacs-js2-mode-indent/
;; インデントの関数の再設定
(add-hook 'js2-mode-hook
          #'(lambda ()
              (require 'js)
              (setq js-indent-level 4
                    js-expr-indent-offset 4
                    indent-tabs-mode nil)
              (set (make-local-variable 'indent-line-function) 'js-indent-line)))

