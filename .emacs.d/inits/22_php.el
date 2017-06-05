;;=============== php-mode ===============
;; require php-mode
(load-library "php-mode")
(require 'php-mode)

(setq interpreter-mode-alist
      (cons '("php" . php-mode)
            interpreter-mode-alist))

(add-hook 'php-mode-hook 'php-enable-psr2-coding-style)
