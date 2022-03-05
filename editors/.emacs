(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; enable lateral line numbers
(global-display-line-numbers-mode)

;; enable line highlight
(global-hl-line-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(custom-enabled-themes (quote (material)))
 '(custom-safe-themes
   (quote
    ("90a6f96a4665a6a56e36dec873a15cbedf761c51ec08dd993d6604e32dd45940" default)))
 '(package-selected-packages (quote (material-theme)))

 ;; enable column numbers
 '(column-number-mode t)

 ;; enable matching parentesis
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )