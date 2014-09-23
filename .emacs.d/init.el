;======= よく忘れがちな便利コマンド =========
;; \(tramp)/
;; /sudo::/etc/
;; /ssh:web1:/home/prj01hon

;;============= Startup scratch message =====================
;; http://d.hatena.ne.jp/sandai/20120304/p2
(setq initial-scratch-message ";;
;; \(空白削除系コマンドたち)/
;; M-^ delete-indentation
;; M-SPC  just-one-space
;; M-m
;; M-h
")

;; Cask
;; OSX(Homebrew)の場合
(require 'cask)
;; Linux の場合はcask.elのパスを指定する必要がある。
;; (require 'cask "~/.cask/cask.el")
(cask-initialize)

;; 設定ファイルを分割管理する
;; https://github.com/emacs-jp/init-loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

