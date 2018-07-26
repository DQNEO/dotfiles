;;============= c-mode ================
;;拡張子.cのファイルはc-modeで開く
(setq auto-mode-alist
      (cons (cons "\\.c$" 'c-mode) auto-mode-alist))

;; hook c c++ mode
(defun my-c-c++-mode-init ()
  (setq c-basic-offset 4)
  (make-local-variable 'c-tab-always-indent)
  (setq c-tab-always-indent nil)
  )
(add-hook 'c-mode-hook 'my-c-c++-mode-init)
(add-hook 'c++-mode-hook 'my-c-c++-mode-init)


;;c-modeのhook
(add-hook 'c-mode-hook
  '(lambda ()
     ;; Emacs で C 言語プログラミングを始める人へのイントロダクション
     ;; http://at-aka.blogspot.com/2006/12/emacs-c.html

     ;; センテンスの終了である ';' を入力したら、自動改行+インデント
     (c-toggle-auto-hungry-state nil)
     ;; RET キーで自動改行+インデント
     (define-key c-mode-base-map "\C-m" 'newline-and-indent)

     ;; (flyspell-prog-mode)

     ;; backspaceで空白を一気に削除
     (setq c-hungry-delete-key t)

     (setq tab-width 4)
     (setq c-basic-offset 4)
     (setq indent-tabs-mode nil)
     ))


