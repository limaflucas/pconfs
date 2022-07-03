(message "Running angular.el file")

(setq lsp-clients-angular-language-server-command
      '("node"
        "/usr/lib/node_modules/@angular/language-server"
        "--ngProbeLocations"
        "/usr/lib/node_modules"
        "--tsProbeLocations"
        "/usr/lib/node_modules"
        "--stdio"))

(use-package angular-snippets)

(provide 'my-angular)
