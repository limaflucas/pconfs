(message "Running init.el file")

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some default settings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)	
(column-number-mode t)
(setq display-line-numbers t)
(global-hl-line-mode 1)
(setq-default cursor-type '(hbar . 1))
(setq-default blink-cursor-mode -1)
(setq frame-resize-pixelwise t) ; resize based on pixels to remove annoying gaps
(setq imenu-auto-rescan t) ; rescan automatically for new tags
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default tab-stop-list
              '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
(setq-default set-language-environment "utf-8")
(set-default-coding-systems 'utf-8)

;;;;;;;;;;;;;;;;;;;;;;;;
;; Package management ;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; including MELPA repository
(require 'package)
(setq package-enable-at-startup nil) ; tells emacs not to load any packages before starting up
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
						 ("gnu"       . "http://elpa.gnu.org/packages/")
						 ("melpa"     . "https://melpa.org/packages/")))
(package-initialize)

;; fetching updated version of packages from repos
(unless package-archive-contents
  (package-refresh-contents))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install must have pacakges ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(dolist (package '(use-package yasnippet-snippets spacemacs-theme))
  (unless (package-installed-p package)
    (package-install package)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; use-package configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Third packages configuration ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path
             (expand-file-name "lsp" user-emacs-directory))

(add-to-list 'load-path
			 (expand-file-name "langs" user-emacs-directory))

(require 'my-lsp)
(require 'my-typescript)
(require 'my-angular)
(require 'my-haskell)

;;;;;;;;;;;;;;;;;;;;;
;; Themes settings ;;
;;;;;;;;;;;;;;;;;;;;;
(load-theme 'spacemacs-dark t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Buffers & Frames settings ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package ace-window
  :config (global-set-key (kbd "C-o") 'ace-window))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(package-selected-packages
   '((\, yasnippet)
     which-key use-package lsp-ui lsp-ivy helm-lsp dap-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
