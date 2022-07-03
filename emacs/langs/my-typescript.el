(message "Running typescript.el file")

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp)
  :config
  (setq typescript-indent-level 2))

(provide 'my-typescript)
