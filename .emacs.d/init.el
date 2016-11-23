
(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/custom")

(require 'setup-general)
(if (version< emacs-version "24.4")
    (require 'setup-ivy-counsel)
  (require 'setup-helm)
  (require 'setup-helm-gtags))
;; (require 'setup-ggtags)
(require 'setup-cedet)
(require 'setup-editing)

(require 'cc-mode)
(require 'semantic)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(semantic-mode 1)

;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zygospore helm-gtags helm yasnippet ws-butler volatile-highlights use-package undo-tree iedit dtrt-indent counsel-projectile company clean-aindent-mode anzu))))

;;; close startup message
(setq inhibit-startup-message -1)

;;; close tool bar and scroll bar
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;; default major
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;;; disable backup
(setq make-backup-files)

;;; close auto save
(setq auto-save-default -1)

;;; 括号匹配，高亮显示另外一边到括号
(setq show-paren-mode t)
(setq show-paren-style 'parenthesis)

;;; yes/no->y/n
(fset 'yes-or-no-p 'y-or-n-p)

;;; title
(setq frame-title-format "%f")

;;;disable version control
(setq vc-handled-backends nil)

;;; display column number
(global-linum-mode t)
(setq column-number-mode t)
(setq line-number-mode t)

;;; display time
(display-time-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)

;;; ido
(require 'ido)
(ido-mode t)

;;; ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;; org mode
(require 'org-install)

;;; windmove
(windmove-default-keybindings)

;;; winner mode
(winner-mode t) ;C-x <left>和C-x <right> to switch buffer
(global-set-key (kbd "C-x <up>") 'winner-undo)
(global-set-key (kbd "C-x <down>") 'winner-redo)

;;; hideshow
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'c++-mode-hook        'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'python-mode-hook     'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'asm-mode-hook        'hs-minor-mode)

(global-set-key (kbd "M-1")     'hs-toggle-hiding)
(global-set-key (kbd "M-2")     'hs-hide-all)
(global-set-key (kbd "M-3")     'hs-show-all)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; cc-mode
(global-cwarn-mode 1)

;Actually, this statement is not just for cc-mode, it is global for all modes
(setq-default tab-width 4
      indent-tabs-mode t)

(setq-default  c-basic-offset 4)
;; Available C style:
;; “gnu”: The default style for GNU projects
;; “k&r”: What Kernighan and Ritchie, the authors of C used in their book
;; “bsd”: What BSD developers use, aka “Allman style” after Eric Allman.
;; “whitesmith”: Popularized by the examples that came with Whitesmiths C, an early commercial C compiler.
;; “stroustrup”: What Stroustrup, the author of C++ used in his book
;; “ellemtel”: Popular C++ coding standards as defined by “Programming in C++, Rules and Recommendations,” Erik Nyquist and Mats Henricson, Ellemtel
;; “linux”: What the Linux developers use for kernel development
;; “python”: What Python developers use for extension modules
;; “java”: The default style for java-mode (see below)
;; “user”: When you want to define your own style
(setq c-default-style '((c-mode . "k&r") (other . "k&r")))

;; 自动模式，在此种模式下当你键入{时，会自动根据你设置的对齐风格对齐
(c-toggle-auto-newline)
;; 此模式下，当按Backspace时会删除最多的空格
(c-toggle-hungry-state)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; makefile
(add-to-list 'auto-mode-alist '("\\.mak$" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\.defs$" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\.mk$" . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("[Mm]akefile\\." . makefile-gmake-mode))
(add-to-list 'auto-mode-alist '("\\onfig$" . conf-mode))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; emacs for python
;(load-file "~/.emacs.d/emacs-for-python/epy-init.el")
;(require 'highlight-indentation)
;(setq skeleton-pair nil)
;(add-hook 'python-mode-hook 'highlight-indentation)
;(add-hook 'cc-mode-hook 'highlight-indentation)
;(add-hook 'c-mode-hook 'highlight-indentation)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; color-theme
(package-initialize)
(load-theme 'monokai t)

;;; smex
(add-to-list 'load-path "~/.emacs.d/smex")
(require 'smex)
(smex-initialize)

(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "M-x") 'smex)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; The following lines are always needed. Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Package: yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Package: smartparens
(require 'smartparens-config)
(show-smartparens-global-mode +1)
(smartparens-global-mode 1)

;; when you press RET, the curly braces automatically
;; add another newline
(sp-with-modes '(c-mode c++-mode)
			   (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
			   (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
														 ("* ||\n[i]" "RET"))))
;; GDB setting
(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
