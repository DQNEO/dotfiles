;;=============== php-mode ===============
;; require php-mode
(load-library "php-mode")
(require 'php-mode)

(setq interpreter-mode-alist
      (cons '("php" . php-mode)
            interpreter-mode-alist))

;; http://www.phppro.jp/phptips/archives/vol5/
(add-hook 'php-mode-user-hook
          '(lambda ()
             (define-abbrev php-mode-abbrev-table "ex" "extends")
             (c-set-style "stroustrup")
             (c-set-offset 'comment-intro 0)
             (setq tab-width 4)
             (setq c-basic-offset 4)
             (setq c-hanging-comment-ender-p nil)
             (setq php-mode-force-pear t)
             (setq indent-tabs-mode nil)
             (setq php-search-url "http://php.net")
             (setq php-manual-url "http://www.phppro.jp/phpmanual")

      ;; (require 'php-completion)
      ;;       (php-completion-mode t)
      ;;       (define-key php-mode-map (kbd "C-o") 'phpcmp-complete) ;php-completionの補完実行キーバインドの設定
      ;;       (make-local-variable 'ac-sources)
      ;;       (setq ac-sources '(
      ;;                          ac-source-words-in-same-mode-buffers
      ;;                          ac-source-php-completion
      ;;                          ac-source-filename
      ;;                          ))
             )

          )


(add-hook 'php-mode-hook
  '(lambda ()
     (c-set-style "stroustrup")
     (setq indent-tabs-mode nil)
     (setq php-manual-path "/home/userdqn/php/doc/html")
     (setq php-search-url "http://www.phppro.jp/")
     (setq php-manual-url "http://www.phppro.jp/phpmanual")
     ))

(defun my-php-mode ()
  (c-toggle-hungry-state 1)
)
(add-hook 'php-mode-user-hook 'my-php-mode)
