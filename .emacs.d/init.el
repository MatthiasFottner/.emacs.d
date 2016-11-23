(package-initialize)
(org-babel-load-file
  (expand-file-name "emacs-init.org"
                   user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (auto-complete icicles multiple-cursors pabbrev htmlize o-blog ob-browser org-bullets helm highlight-current-line hl-todo powerline org2blog magithub)))
 '(save-place t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "monofur" :foundry "outline" :slant normal :weight normal :height 113 :width normal))))
 '(escape-glyph ((t (:foreground "#ddaa6f" :weight bold))))
 '(font-lock-builtin-face ((t (:foreground "#f47444" :weight normal))))
 '(font-lock-comment-face ((t (:foreground "#999999" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "#aa9999" :weight normal))))
 '(font-lock-function-name-face ((t (:foreground "aquamarine3"))))
 '(font-lock-keyword-face ((t (:foreground "#80aaff" :weight bold))))
 '(font-lock-string-face ((t (:foreground "#00dd66" :weight normal))))
 '(font-lock-type-face ((t (:foreground "#92a65e" :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "SpringGreen3"))))
 '(font-lock-warning-face ((t (:foreground "#ddcc8f"))))
 '(minibuffer-prompt ((t (:foreground "#36a5ff"))))
 '(mode-line ((t (:foreground "#ffffff" :background "#0088cc" :box nil))))
 '(mode-line-inactive ((t (:foreground "#00aaee" :background "#444444" :box nil))))
 '(set-face-attribute (quote region) nil :background))
