;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

;; whitespace modeで可視化
;; http://qiita.com/itiut@github/items/4d74da2412a29ef59c3a
;;(require 'whitespace)
;; (setq whitespace-style '(face           ; faceで可視化
;;                          trailing       ; 行末
;;                          tabs           ; タブ
;;                          spaces         ; スペース
;;                          empty          ; 先頭/末尾の空行
;;                          space-mark     ; 表示のマッピング
;;                          tab-mark
;;                          ))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        ;; WARNING: the mapping below has a problem.
        ;; When a TAB occupies exactly one column, it will display the
        ;; character ?\xBB at that column followed by a TAB which goes to
        ;; the next TAB column.
        ;; If this is a problem for you, please, comment the line below.
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))
