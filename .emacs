;; Packages
;; http://d.hatena.ne.jp/naoya/20130107/1357553140
;; Emacs 24 のデフォルトではパッケージ提供元が
;; elpa.gnu.org のみなので
;; 下記のように設定して増やしてあげる
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; Language
(set-language-environment 'Japanese)

;; Coding system.
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)

;; Theme 
;  http://d.hatena.ne.jp/aoe-tk/20130210/1360506829
(load-theme 'misterioso t)

;;============ Global Keybind ====================
;; C-h as backspace
(global-set-key "\C-h" 'delete-backward-char)

;; disable toggle-input-method and use it as help-command
(global-set-key "\C-\\" 'help-command)

;; compare-window
(global-set-key "\C-cw" 'compare-windows)

;; http://flex.ee.uec.ac.jp/texi/faq-jp/faq-jp_79.html
;; override mark-whole-buffer
(global-set-key "\C-ch" 'help-command)

;; カレントバッファのファイルパスを表示
(defun show-file-path()
  (interactive)
  (message (buffer-file-name))
  )
(global-set-key  "\C-cp" 'show-file-path)

;; revert-buffer-force
(defun revert-buffer-force()
  (interactive)
  (revert-buffer nil t)
  (message "revert-buffer-force done.")
)
(global-set-key "\C-cv" 'revert-buffer-force)

;; run-file
(defun run-file()
  (interactive)
  (shell-command (concat "./" (file-name-nondirectory (buffer-file-name)))))

(global-set-key  "\C-cr" 'run-file)

;; http://tech.kayac.com/archive/emacs.html
; ~つきのバックアップファイルを作らない
(setq make-backup-files nil)

;; http://www.cozmixng.org/~kou/emacs/dot_emacs
(setq kill-whole-line t)


;;============ Global Variables ====================

;; set start up message off
;;(setq inhibit-startup-message t)

;; 1 回の delete-backward-char で複数の whitespace を消す
;; http://www.fan.gr.jp/~ring/Meadow/meadow.html#backward-delete-char-untabify-method
(setq backward-delete-char-untabify-method 'hungry)

;; display time mode
(setq display-time-day-and-date nil)

(setq c-set-style "stroustrup")

;; iswitchb-mode on
(iswitchb-mode 1)

;; colorize region  http://blog.livedoor.jp/t100life/archives/51680860.html
(transient-mark-mode 1)

;; show line-number
(line-number-mode t)

;; hide menu bar
(menu-bar-mode nil)


;; hilight parenthes
(show-paren-mode t)

;; hilight current line
;; http://emacsblog.org/2007/04/09/highlight-the-current-line/
(global-hl-line-mode nil)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

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

;;=============== Custom ===============
;; disable tab
(custom-set-variables
 '(indent-tabs-mode nil))

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
(global-set-key "\C-xf" 'recentf-open-files)

;; Git
; EmacsのGitクライアント：Magit
; http://qiita.com/takc923/items/c7a11ff30caedc4c5ba7
(require 'magit)

; branch切り替えた時に開いてるBufferを自動更新
; http://yoshiori.github.io/blog/2013/01/31/file-update-emacs/
; 変更のあったファイルの自動再読み込み
(global-auto-revert-mode 1)

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

;;=============== shell-pop ===============
;; http://d.hatena.ne.jp/kyagi/20090601/1243841415
(require 'shell-pop)
(global-set-key [f8] 'shell-pop)


;;=============== Visible White Spaces ===============
;; Show tab, zenkaku-space, white spaces at end of line
;; http://openlab.dino.co.jp/wp-content/uploads/2008/07/dotemacs-show-white-spaces.txt
;; http://www.bookshelf.jp/soft/meadow_26.html#SEC317
(defface my-face-tab         '((t (:background "Yellow"))) nil :group 'my-faces)
(defface my-face-zenkaku-spc '((t (:background "LightBlue"))) nil :group 'my-faces)
(defface my-face-spc-at-eol  '((t (:foreground "Red" :underline t))) nil :group 'my-faces)
(defvar my-face-tab         'my-face-tab)
(defvar my-face-zenkaku-spc 'my-face-zenkaku-spc)
(defvar my-face-spc-at-eol  'my-face-spc-at-eol)
(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
   '(("\t" 0 my-face-tab append)
     ("　" 0 my-face-zenkaku-spc append)
     ("[ \t]+$" 0 my-face-spc-at-eol append)
     )))
(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)

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

;; settings for text file
(add-hook 'text-mode-hook
          '(lambda ()
             (progn
               (font-lock-mode t)
               (font-lock-fontify-buffer))))

;;=============== HTML mode ===============

;; 拡張子tplのファイルはhtml-modeで開く
;;http://blog.livedoor.jp/ubuntumini/archives/51253507.html
(setq auto-mode-alist
      (cons (cons "\\.tpl$" 'html-mode) auto-mode-alist))


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
             (c-set-offset 'comment-intro 0)
             (setq tab-width 4)
             (setq c-basic-offset 4)
             (setq c-hanging-comment-ender-p nil)
             (setq php-mode-force-pear t)
             (setq indent-tabs-mode nil)
             (setq php-manual-path "/usr/local/share/php/doc/php-chunked-xhtml")
             (setq php-search-url "http://php.net")
             (setq php-manual-url "http://www.phppro.jp/phpmanual")
             (setq c-set-style "stroustrup")
             (c-set-style "stroustrup")

             )

          )


(add-hook 'php-mode-hook
  '(lambda ()
     (c-set-style "stroustrup")
     (setq php-manual-path "/home/userdqn/php/doc/html")
     (setq php-search-url "http://www.phppro.jp/")
     (setq php-manual-url "http://www.phppro.jp/phpmanual")
     ))


;; exec current test file
(defun prove-quiet()
  (interactive)
  (shell-command
   (concat "prove -Q  " (file-name-nondirectory (buffer-file-name)))))

(define-key php-mode-map "\C-cq" 'prove-quiet)

;; run test
(defun run-test()
  (interactive)
  (shell-command
   ( buffer-file-name)))
(define-key php-mode-map "\C-ct" 'run-test)


(defun my-php-mode ()
  (c-toggle-hungry-state 1)
)
(add-hook 'php-mode-user-hook 'my-php-mode)

;; Flymake PHP Extension

(when 
    (string-match "22" emacs-version)
  (progn
    (require 'flymake)
    
    (defconst flymake-allowed-php-file-name-masks '(
                                                    ("\\.php3\\'" flymake-php-init)
                                                    ("\\.inc\\'" flymake-php-init)
                                                    ("\\.php\\'" flymake-php-init))
      "Filename extensions that switch on flymake-php mode syntax checks")
    
    (defconst flymake-php-err-line-pattern-re '("\\(.*\\) in \\(.*\\) on line \\([0-9]+\\)" 2 3 nil 1)
      "Regexp matching PHP error messages")

    (defun flymake-php-init ()
      (let* ((temp-file       (flymake-init-create-temp-buffer-copy
                               'flymake-create-temp-inplace))
             (local-file  (file-relative-name
                           temp-file
                           (file-name-directory buffer-file-name))))
        (list "php" (list "-f" local-file "-l"))))
    
    (defun flymake-php-load ()
      (setq flymake-allowed-file-name-masks (append flymake-allowed-file-name-masks flymake-allowed-php-file-name-masks))
      (setq flymake-err-line-patterns (cons flymake-php-err-line-pattern-re flymake-err-line-patterns))
      (flymake-mode t)
      (local-set-key "\C-cd" 'flymake-display-err-menu-for-current-line))

    (add-hook 'php-mode-user-hook 'flymake-php-load)))




(put 'set-goal-column 'disabled nil)



;;=============== tdd-mode ===============

;; this is a modification version
;; http://unknownplace.org/memo/2008/02/21/#e001
(defvar tdd-bgcolor-alist
  '(("Think"      ."snow")
    ("Red"        ."#ff4444")
    ("Green"      ."#44dd44")
    ("Refactoring"."#ffaa44")))

(defvar tdd-bgcolor-mode 3)
(defvar tdd-bgcolor-mode-name "")
(let (
      (cell (or (memq 'mode-line-position mode-line-format)
                (memq 'mode-line-buffer-identification mode-line-format)))
      (newcdr 'tdd-bgcolor-mode-name))
  (unless (member newcdr mode-line-format)
    (setcdr cell (cons newcdr (cdr cell)))))

(defun tdd-bgcolor-rotate ()
  (interactive)
  (let (pair)
    (if (>= tdd-bgcolor-mode 3)
        (setq tdd-bgcolor-mode 0)
      (setq tdd-bgcolor-mode
            (+ tdd-bgcolor-mode 1)))
    (setq pair
          (nth tdd-bgcolor-mode tdd-bgcolor-alist))
    (setq tdd-bgcolor-mode-name (format "[%s]" (car pair)))
    (message tdd-bgcolor-mode-name)
    (set-face-foreground 'mode-line (cdr pair))))

(global-set-key "\C-cm" 'tdd-bgcolor-rotate)

;;=======================================

;; 再帰的にファイルを検索させて、etags を実行させる。
(defun etags-find (dir pattern)
  " find DIR -name 'PATTERN' |etags -"
  (interactive
   "DFind-name (directory): \nsFind-name (filename wildcard): ")
  (shell-command
   (concat "find " dir " -type f -name \"" pattern "\" | etags -")))



;;=============== antything.el ===============
;; antything.el
;;(add-to-list 'load-path "~/.emacs.d/auto-install" )
;;(require 'anything-startup)

;;=============== HTML helper mode ===============
(autoload 'html-helper-mode "html-helper-mode" "Yay HTML" t)


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

