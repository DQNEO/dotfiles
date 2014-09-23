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

(set-buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8)

;; Language
(set-language-environment 'Japanese)
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

;; Cask
;; OSX(Homebrew)の場合
(require 'cask)
;; Linux の場合はcask.elのパスを指定する必要がある。
;; (require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Packages
;; http://sheephead.homelinux.org/2011/06/17/6724/
;; http://d.hatena.ne.jp/naoya/20130107/1357553140
;; Emacs 24 のデフォルトではパッケージ提供元が
;; elpa.gnu.org のみなので
;; 下記のように設定して増やしてあげる
(require 'package)
;;リポジトリにmelpaを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;リポジトリにMarmaladeを追加
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;;インストールするディレクトリを指定
(setq package-user-dir (concat user-emacs-directory "vendor/elpa"))
;;インストールしたパッケージにロードパスを通してロードする
(package-initialize)

;; add to load-path
(add-to-list 'load-path "~/.emacs.d/site-lisp" )

;; 各種packageが入ってなければインストールする
;; https://gist.github.com/DQNEO/83445d953551f1ff3df4
(require 'cl)
(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    magit
    php-mode
    markdown-mode
    yaml-mode
    
    ;; 以下は便利か不明。要評価。
    js2-mode
    yasnippet
    helm
    auto-complete

    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))

;; Git
; ページャをEmacs用にカスタマイズする
(setenv "GIT_PAGER" "nkf -w|colordiff")
; branch切り替えた時に開いてるBufferを自動更新
; http://yoshiori.github.io/blog/2013/01/31/file-update-emacs/
; 変更のあったファイルの自動再読み込み
(global-auto-revert-mode 1)

;;============ Global Keybind ====================
;; C-h as backspace
(global-set-key "\C-h" 'delete-backward-char)

;; M-h as backspace for word
;; http://d.hatena.ne.jp/akisute3/
(global-set-key (kbd "M-h") 'backward-kill-word)

;; C-M-%が使えないので、代替。
(global-set-key "\M-$" 'replace-regexp)

;; keybind for help
;; http://flex.ee.uec.ac.jp/texi/faq-jp/faq-jp_79.html
;; override mark-whole-buffer
(global-set-key "\C-ch" 'help-command)
;; disable toggle-input-method and replace it as help-command
(global-set-key "\C-\\" 'help-command)
(global-set-key (kbd "M-?") 'help-for-help)

;; compare-window
(global-set-key "\C-cw" 'compare-windows)

;; カレントバッファのフルパスを表示
(defun show-buffer-file-path()
  (interactive)
  (message (buffer-file-name))
  )
(global-set-key  "\C-cp" 'show-buffer-file-path)

;; revert-buffer-force
(defun revert-buffer-force()
  (interactive)
  (revert-buffer nil t)
  (message "revert-buffer-force done.")
)
(global-set-key "\C-cv" 'revert-buffer-force)

;; run current file
(defun run-file()
  (interactive)
  (shell-command (concat "./" (file-name-nondirectory (buffer-file-name)))))
(global-set-key  "\C-cr" 'run-file)
(global-set-key [f5] 'run-file)

;; goto-line
(global-set-key "\M-g" 'goto-line)

;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;; http://tech.kayac.com/archive/emacs.html
;; ~つきのバックアップファイルを作らない
(setq make-backup-files nil)

;; http://www.cozmixng.org/~kou/emacs/dot_emacs
(setq kill-whole-line t)

;; display time mode は画面が崩れるから無効にする
(display-time-mode 0)
(setq display-time-day-and-date nil)

;; 最終行に必ず一行挿入する
(setq require-final-newline t)

(setq backup-inhibited t)

;; iswitchb-mode on
(iswitchb-mode t)

;; http://e-arrows.sakura.ne.jp/2010/02/vim-to-emacs.html
;; バッファリストの拡張機能。あんま便利じゃないのではずす。
;;(global-set-key "\C-x\C-b" 'bs-show)

;; colorize region  http://blog.livedoor.jp/t100life/archives/51680860.html
(transient-mark-mode 1)

;; set start up message off
;;(setq inhibit-startup-message t)

;; 1 回の delete-backward-char で複数の whitespace を消す
;; http://www.fan.gr.jp/~ring/Meadow/meadow.html#backward-delete-char-untabify-method
(setq backward-delete-char-untabify-method 'hungry)

;; display time mode
(setq display-time-day-and-date nil)

;; show line-number
(line-number-mode t)

;; 左端に行番号を表示
;; http://d.hatena.ne.jp/sandai/20120304/p2
;;(global-linum-mode nil)
;; (set-face-attribute 'linum nil
;;                     :foreground "#800"
;;                     :height 0.9)
;;(setq linum-format "%4d|")

;; hide menu bar
(menu-bar-mode nil)

;; hilight parenthes
(show-paren-mode t)

;; hilight current line
;; http://emacsblog.org/2007/04/09/highlight-the-current-line/
;; http://e-arrows.sakura.ne.jp/2010/02/vim-to-emacs.html
(global-hl-line-mode t)

;; http://www.geocities.co.jp/SiliconValley-Oakland/3992/emacs/use/abbrev.html
;; http://d.hatena.ne.jp/end0tknr/20090418/1240047494
(global-set-key "\C-o" 'expand-abbrev)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

;; perldocなどのためにPAGERを無効にする
(setenv "PAGER" "cat")

;;=============== session.el ===============
;; http://openlab.dino.co.jp/2008/09/26/230919351.html
;;session.el + minibuf-isearchが便利すぎる — ディノオープンラボラトリ

;; ミニバッファ履歴リストの最大長：tなら無限
(setq history-length t)
;; session.el
;;   kill-ringやミニバッファで過去に開いたファイルなどの履歴を保存する
(when (require 'session nil t)
  (setq session-initialize '(de-saveplace session keys menus places)
        session-globals-include '((kill-ring 50)
                                  (session-file-alist 500 t)
                                  (file-name-history 10000)))
  (add-hook 'after-init-hook 'session-initialize)
  ;; 前回閉じたときの位置にカーソルを復帰
  (setq session-undo-check -1))
;; minibuf-isearch
;;   minibufでisearchを使えるようにする
(require 'minibuf-isearch nil t)

;; copy current word
;; http://sh1.2-d.jp/b/2006-07-16-00-44.html
(ffap-bindings)
(global-set-key "\C-cc" 'ffap-copy-string-as-kill)


;;=============== shell-mode ===============
;; http://www.namazu.org/~tsuchiya/elisp/index.html#script
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color-for-comint-mode' to t." t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;; recentf
;; http://www23.atwiki.jp/selflearn/pages/41.html#id_4af821e2
(require 'recentf)
(recentf-mode 1)
;; http://www.clear-code.com/blog/2011/2/16.html
;;; 最近開いたファイルを保存する数を増やす
(setq recentf-max-saved-items 10000)
;; open recent files
(global-set-key "\C-xf" 'recentf-open-files)

(setq ansi-color-names-vector
      ["#000000"           ; black
       "#ff6565"           ; red
       "#93d44f"           ; green
       "#eab93d"           ; yellow
       "#204a87"           ; blue
       "#ce5c00"           ; magenta
       "#89b6e2"           ; cyan
       "#ffffff"]          ; white
      )
(ansi-color-for-comint-mode-on)


; EmacsのGitクライアント：Magit
; http://qiita.com/takc923/items/c7a11ff30caedc4c5ba7
(require 'magit)

;;=============== auto chmod ===============
;; ファイル保存時にchmodする
;; chmod +x when you save a file
;; http://www.namazu.org/~tsuchiya/elisp/index.html#chmod
(defun make-file-executable ()
  "Make the file of this buffer executable, when it is a script source."
  (save-restriction
    (widen)
    (if (string= "#!" (buffer-substring-no-properties 1 (min 3 (point-max))))
        (let ((name (buffer-file-name)))
          (or (equal ?. (string-to-char (file-name-nondirectory name)))
              (let ((mode (file-modes name)))
                (set-file-modes name (logior mode (logand (/ mode 4) 73)))
                (message (concat "Wrote " name " (+x)"))))))))
(add-hook 'after-save-hook 'make-file-executable)

;;=============== js2-mode ================
;; http://memememomo.hatenablog.com/entry/2013/03/23/125240
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.\\(js\\|json\\)$" . js2-mode))

;; http://blog.ainam.me/2011/12/13/emacs-js2-mode-indent/
;; インデントの関数の再設定
(add-hook 'js2-mode-hook
          #'(lambda ()
              (require 'js)
              (setq js-indent-level 2
                    js-expr-indent-offset 2
                    indent-tabs-mode nil)
              (set (make-local-variable 'indent-line-function) 'js-indent-line)))

;;=============== HTML mode ===============

;; 拡張子tplのファイルはhtml-modeで開く
;;http://blog.livedoor.jp/ubuntumini/archives/51253507.html
(setq auto-mode-alist
      (cons (cons "\\.tpl$" 'html-mode) auto-mode-alist))

;; HTMLファイルを保存するさいに、
;; Emacsが<head>のcharsetを見て勝手に文字コード判定するのを防ぐ。
(setq auto-coding-functions nil)

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

(defun hello-world()
  (interactive)
  (message "hello world!")
)
(global-set-key "\C-xw" 'hello-world)

;;============ htmlentities-region ==============
(defun htmlentities-region ()
  (interactive)
  (save-excursion
    (call-process-region (region-beginning) (region-end)
      "htmlentities.php" t t))) 


;;=============== swap-screen ===============
;; これは超便利。
;; 
;; http://www.bookshelf.jp/soft/meadow_30.html#SEC405
;; exchange right <->left window
(defun swap-screen()
  "Swap two screen,leaving cursor at current window."
  (interactive)
  (let ((thiswin (selected-window))
        (nextbuf (window-buffer (next-window))))
    (set-window-buffer (next-window) (window-buffer))
    (set-window-buffer thiswin nextbuf)))
(defun swap-screen-with-cursor()
  "Swap two screen,with cursor in same buffer."
  (interactive)
  (let ((thiswin (selected-window))
        (thisbuf (window-buffer)))
    (other-window 1)
    (set-window-buffer thiswin (window-buffer))
    (set-window-buffer (selected-window) thisbuf)))
(global-set-key [f2] 'swap-screen)
(global-set-key [S-f2] 'swap-screen-with-cursor)

(global-set-key "\C-cx" 'swap-screen)

;; settings for text file
(add-hook 'text-mode-hook
          '(lambda ()
             (progn
               (font-lock-mode t)
               (font-lock-fontify-buffer))))




;;======= yasnippet ===================
;;https://github.com/capitaomorte/yasnippet

;;=== auto complete ===
;; http://blog.fusic.co.jp/archives/94
;; http://www.nomtats.com/2010/11/auto-completeelemacs.html
;; http://dev.ariel-networks.com/wp/documents/aritcles/emacs/part9
(require 'auto-complete)
(require 'auto-complete-config)
;;(global-auto-complete-mode nil)
;;(setq ac-auto-start t)


;;(add-hook 'auto-complete-mode-hook
;;          (lambda ()
;;            (define-key ac-completing-map (kbd "C-n") 'ac-next)
;;            (define-key ac-completing-map (kbd "C-p") 'ac-previous)))


;;============== bs.el(バッファ切り替えモジュール) ===================
;; http://yak-shaver.blogspot.jp/2013/03/cycle-bufferel.html
;; cycle-buffer.el もう古いらしく、い
;; 今は bs.el というバッファ切替えモジュールが標準である。
(global-set-key [(f9)] 'bs-cycle-previous)
(global-set-key [(f10)] 'bs-cycle-next)
;; *scratch*バッファも表示候補に入れる
(setq bs-cycle-configuration-name "files-and-scratch")

;; markdown-mode
(load "~/dotfiles/.emacs.d/submodules/markdown-mode/markdown-mode.el")
(setq auto-mode-alist (cons '("\\.md" . gfm-mode) auto-mode-alist))

;; Theme 
;  http://d.hatena.ne.jp/aoe-tk/20130210/1360506829
(load-theme 'misterioso t)


;;=============== shell-pop ===============
;; http://d.hatena.ne.jp/kyagi/20090601/1243841415
;; http://d.hatena.ne.jp/kyagi/20121024/1351012197
(load "~/dotfiles/.emacs.d/submodules/shell-pop-el/shell-pop.el")
(require 'shell-pop)
(global-set-key [f8] 'shell-pop)

;; これなんだったか忘れたw
(put 'dired-find-alternate-file 'disabled nil)
