;;============= c-mode ================
;;拡張子.cのファイルはc-modeで開く
(setq auto-mode-alist
      (cons (cons "\\.c$" 'c-mode) auto-mode-alist))

;;c-modeのhook
(add-hook 'c-mode-hook
  '(lambda ()
     (c-set-style "stroustrup")

     ;; Emacs で C 言語プログラミングを始める人へのイントロダクション
     ;; http://at-aka.blogspot.com/2006/12/emacs-c.html

     ;; センテンスの終了である ';' を入力したら、自動改行+インデント
     (c-toggle-auto-hungry-state 1)
     ;; RET キーで自動改行+インデント
     (define-key c-mode-base-map "\C-m" 'newline-and-indent)

     ;; (flyspell-prog-mode)

     ;; backspaceで空白を一気に削除
     (setq c-hungry-delete-key t)

     (setq tab-width 4)
     (setq c-basic-offset 4)
     (setq indent-tabs-mode nil)
     ))


