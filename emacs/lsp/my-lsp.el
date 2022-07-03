(message "Running lsp.el file")

;; ;; required to use plists instead of hash-table
(setenv "LSP_USE_PLISTS" "true")

(use-package projectile)
(use-package flycheck)
(use-package company)
(use-package lsp-ui)

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package which-key
    :config
    (which-key-mode))

(use-package helm-lsp
  :commands helm-lsp-workspace-symbol)

(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  (setq gc-cons-threshold 100000000)
  (setq read-process-output-max (* 1024 1024))
  ;;(setq lsp-idle-delay 0.000)
  :config
  (setq lsp-modeline-code-actions-mode t)
  (lsp-enable-which-key-integration t) ; which-key integration
  :commands lsp)

;;(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(provide 'my-lsp)
