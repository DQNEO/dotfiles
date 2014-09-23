;; HTMLファイルを保存するさいに、
;; Emacsが<head>のcharsetを見て勝手に文字コード判定するのを防ぐ。
(setq auto-coding-functions nil)
