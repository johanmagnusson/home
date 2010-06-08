;; emacs, please

;; ELPA -- http://tromey.com/elpa/
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;; fix []{} etc...
(setq mac-option-modifier 'none)

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

;; keep private installation of color-theme... 
;; http://www.nongnu.org/color-theme/
(add-to-list 'load-path "~/.emacs.d/packages/color-theme-6.6.0")
(require 'color-theme)

(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     ;; TOOD: auto-download of this theme, or something: http://github.com/crafterm/twilight-emacs
     (load-file "~/.emacs.d/color-themes/twilight-emacs/color-theme-twilight.el")
     (color-theme-twilight)))

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
 '(column-number-mode t))

;; editing, require final newline
(setq require-final-newline t)
