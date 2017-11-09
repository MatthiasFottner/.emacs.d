(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (creamsody)))
 '(custom-safe-themes
   (quote
    ("0ee3fc6d2e0fc8715ff59aed2432510d98f7e76fe81d183a0eb96789f4d897ca" default)))
 '(dnd-open-file-other-window t)
 '(doc-view-continuous t)
 '(elpy-mode-hook nil)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults)))
 '(elpy-rpc-python-command "python")
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(org-latex-classes
   (quote
    (("sig" "\\documentclass{sig-alternate}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("article" "\\documentclass[11pt]{article}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("report" "\\documentclass[11pt]{report}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("book" "\\documentclass[11pt]{book}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))))
 '(package-selected-packages
   (quote
    (use-package diff-hl focus-autosave-mode buffer-move weechat creamsody-theme sublimity wolfram org-pdfview pdf-tools aggressive-indent elpy flycheck-pyflakes fancy-battery multiple-cursors pabbrev htmlize o-blog ob-browser org-bullets helm highlight-current-line hl-todo powerline org2blog magithub)))
 '(python-shell-interpreter "python")
 '(pyvenv-virtualenvwrapper-python "C:/Languages/Python35/python")
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
 '(default ((t (:family "Monaco" :foundry "outline" :slant normal :weight normal :height 98 :width normal))))
 '(diff-hl-change ((t (:inherit default :foreground "orange"))))
 '(diff-hl-insert ((t (:inherit diff-added :foreground "green")))))

 (org-babel-load-file
    (expand-file-name "emacs-init.org"
                     user-emacs-directory))
