;; http://qiita.com/bussorenre/items/3e80e59d517db8aebf46
(add-hook 'go-mode-hook (lambda()
                          (add-hook 'before-save-hook' 'gofmt-before-save)
                          (local-set-key (kbd "M-.") 'godef-jump)
                          (setq indent-tabs-mode nil)    ; タブを利用
                          (setq c-basic-offset 4)        ; tabサイズを4にする
                          (setq tab-width 4)))
