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

;; A workaround suggested by chatgpt
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless (package-installed-p 'init-loader)
  (package-refresh-contents)
  (package-install 'init-loader))


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

