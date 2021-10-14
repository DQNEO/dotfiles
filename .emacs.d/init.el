;======= よく忘れがちな便利コマンド =========
;; \(tramp)/
;; /sudo::/etc/
;; /ssh:web1:/home/myuser
;;
;; \(空白削除系)/
;; M-^ delete-indentation
;; M-SPC  just-one-space
;; M-m
;; M-h


;; Cask
;; OSX(Homebrew)の場合

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;;(package-initialize)

(setq warning-suppress-log-types '((package reinitialization)))

(require 'cask)
;; Linux の場合はcask.elのパスを指定する必要がある。
;; (require 'cask "~/.cask/cask.el")
(cask-initialize)

;; 設定ファイルを分割管理する
;; https://github.com/emacs-jp/init-loader

;; syohexさんの設定ファイルが参考になるので
;; たまに読んでおくとよさそう。
;; https://github.com/syohex/dot_files/tree/master/emacs/init_loader
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

