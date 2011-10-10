;; emacs, please

;; ELPA -- http://tromey.com/elpa/
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize)
  ;; init marmalade repo
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/")))

;; fix []{} etc...
(setq mac-option-modifier 'none)

;; cmd should act as meta, not as super
(setq mac-command-modifier 'meta)

;; Deva-Vu Sans Mono
(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black"
                         :inverse-video nil :box nil :strike-through nil
                         :overline nil :underline nil :slant normal :weight normal
                         :height 120 :width normal :foundry "unknown"
                         :family "DejaVu Sans Mono")))))

;; Remove annoying starup screen
(custom-set-variables '(inhibit-startup-screen t))

;; Clean up interface
;(tool-bar-mode nil)
;(menu-bar-mode nil)
(scroll-bar-mode nil)

;; prevent paranoid autosave files
(setq make-backup-files nil)
(setq auto-save nil)
(setq delete-auto-save-files t)

;; do not store auto save files in current dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; keep private installation of color-theme... 
;; http://www.nongnu.org/color-theme/
(add-to-list 'load-path "~/.emacs.d/packages/color-theme-6.6.0")
(require 'color-theme)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-charcoal-black)))

(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))

;; major modes for jade and stylus
(add-to-list 'load-path "~/.emacs.d/packages/jade-mode")
(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

;; apache-mode, for editing apache configuration files
(add-to-list 'load-path "~/.emacs.d/packages/apache-mode")
(require 'apache-mode)
(add-to-list 'auto-mode-alist '("\\.htaccess\\'"   . apache-mode))
(add-to-list 'auto-mode-alist '("httpd\\.conf\\'"  . apache-mode))
(add-to-list 'auto-mode-alist '("srm\\.conf\\'"    . apache-mode))
(add-to-list 'auto-mode-alist '("access\\.conf\\'" . apache-mode))
(add-to-list 'auto-mode-alist '("sites-\\(available\\|enabled\\)/" . apache-mode))

;; nginx-mode, for editing nginx config files
(add-to-list 'load-path "~/.emacs.d/packages/nginx-mode")
(require 'nginx-mode)

;; scrolling behavior
(setq scroll-margin 5)
(setq scroll-conservatively 5)

;; please show me my marked region
(setq transient-mark-mode t)

(custom-set-variables
 ;; don't wrap lines, truncate
 '(truncate-lines t)
 ;; kill newline as well when killing
 '(kill-whole-line t)
 ;; show column numbers
 '(column-number-mode t)
 ;; indent with spaces, not tabs
 '(indent-tabs-mode nil))

;; editing, require final newline
(setq require-final-newline t)

;; move between windows
(defun select-next-window ()
  "Switch to the next window" 
  (interactive)
  (select-window (next-window)))

(defun select-previous-window ()
  "Switch to the previous window" 
  (interactive)
  (select-window (previous-window)))

(global-set-key (kbd "M-<right>") 'select-next-window)
(global-set-key (kbd "M-<left>")  'select-previous-window)
