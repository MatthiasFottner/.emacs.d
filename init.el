
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-show-compilation t)
 '(ansi-color-names-vector
   ["#3C3836" "#FB4933" "#86C9D3" "#8DD1CA" "#419BB0" "#A59FC0" "#3FD7E5" "#EBDBB2"])
 '(blink-cursor-mode t)
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "5eeb99062a978f545705eb94a8c3af3039a298621cf152f8f81296b9e99d10fa" "0ee3fc6d2e0fc8715ff59aed2432510d98f7e76fe81d183a0eb96789f4d897ca" default)))
 '(doc-view-continuous t)
 '(elpy-mode-hook nil)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-flymake elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults)))
 '(flycheck-clang-analyzer-executable "")
 '(flycheck-clang-args (quote ("-Wno-pragma-once-outside-header")))
 '(flycheck-clang-include-path
   (quote
    ("D:\\Daten\\LaTeX\\__Bachelor\\C++\\irrlicht\\include\\" "D:\\Programme\\vs2017\\VC\\Tools\\MSVC\\14.11.25503\\include\\")))
 '(flycheck-clang-language-standard "c++17")
 '(flycheck-clang-ms-extensions t)
 '(flycheck-clang-warnings nil)
 '(flycheck-gcc-language-standard "c++11")
 '(flyspell-default-dictionary "deutsch8")
 '(focus-follows-mouse nil)
 '(global-diff-hl-mode t)
 '(global-hl-todo-mode t)
 '(grab-and-drag-button 2)
 '(hl-todo-activate-in-modes (quote (emacs-lisp-mode c++-mode)))
 '(hl-todo-keyword-faces
   (quote
    (("HOLD" . "#d0bf8f")
     ("TODO" . "#cc9393")
     ("NEXT" . "#dca3a3")
     ("THEM" . "#dc8cc3")
     ("PROG" . "#7cb8bb")
     ("OKAY" . "#7cb8bb")
     ("DONT" . "#5f7f5f")
     ("FAIL" . "#8c5353")
     ("DONE" . "#afd8af")
     ("NOTE" . "#d0bf8f")
     ("KLUDGE" . "#d0bf8f")
     ("HACK" . "#d0bf8f")
     ("FIXME" . "#cc9393")
     ("XXX" . "#cc9393")
     ("XXXX" . "#cc9393")
     ("???" . "#cc9393")
     ("BUG" . "#8c5353")
     ("QUESTION" . "#d0bf8f"))))
 '(ido-vertical-define-keys (quote C-n-C-p-up-and-down))
 '(ido-vertical-mode t)
 '(inhibit-startup-screen t)
 '(jdee-server-dir "~/.emacs.d/jdee-server")
 '(menu-bar-mode nil)
 '(nyan-animate-nyancat t)
 '(nyan-animation-frame-interval 0.1)
 '(nyan-minimum-window-width 90)
 '(nyan-mode t)
 '(nyan-wavy-trail t)
 '(org-capture-templates
   (quote
    (("t" "Task" entry
      (file+headline "~/org/notes.org" "Tasks")
      "* TODO %?
  %i
  %a")
     ("s" "Schedule entry" entry
      (file+headline "~/org/notes.org" "Schedule")
      ""))))
 '(org-export-dispatch-use-expert-ui nil)
 '(org-export-in-background t)
 '(org-highlight-latex-and-related (quote (latex script entities)))
 '(org-latex-caption-above nil)
 '(org-latex-classes
   (quote
    (("scrreprt" "\\documentclass{scrreprt}"
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("sig" "\\documentclass{sig-alternate}"
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
 '(org-latex-default-packages-alist
   (quote
    (("AUTO" "inputenc" t)
     ("T1" "fontenc" t)
     ("" "fixltx2e" nil)
     ("" "graphicx" t)
     ("" "grffile" t)
     ("" "longtable" nil)
     ("" "wrapfig" nil)
     ("" "rotating" nil)
     ("normalem" "ulem" t)
     ("" "amsmath" t)
     ("" "textcomp" t)
     ("" "amssymb" t)
     ("" "capt-of" nil))))
 '(org-latex-hyperref-template nil)
 '(org-latex-listings (quote minted))
 '(org-latex-pdf-process (quote ("latexmk -output-directory %o %f -pdf")))
 '(org-src-fontify-natively t)
 '(org-structure-template-alist
   (quote
    (("n" "#+begin_notes
?
#+end_notes")
     ("s" "#+begin_src ?

#+end_src")
     ("e" "#+begin_example
?
#+end_example")
     ("q" "#+begin_quote
?
#+end_quote")
     ("v" "#+begin_verse
?
#+end_verse")
     ("V" "#+begin_verbatim
?
#+end_verbatim")
     ("c" "#+begin_center
?
#+end_center")
     ("C" "#+begin_comment
?
#+end_comment")
     ("l" "#+begin_export latex
?
#+end_export")
     ("L" "#+latex: ")
     ("h" "#+begin_export html
?
#+end_export")
     ("H" "#+html: ")
     ("a" "#+begin_export ascii
?
#+end_export")
     ("A" "#+ascii: ")
     ("i" "#+index: ?")
     ("I" "#+include: %file ?"))))
 '(package-selected-packages
   (quote
    (flycheck company-lsp lsp-mode lsp-python dumb-jump workgroups erc-twitch treemacs-evil company-childframe treemacs-projectile treemacs show-marks avy xterm-color wttrin cmake-mode pretty-mode gitignore-mode org ox-reveal projectile-ripgrep ag projectile-codesearch projectile company flycheck-clang-analyzer flycheck-clang-tidy flycheck-clangcheck company-c-headers company-irony irony ac-clang rjsx-mode js2-mode tern-auto-complete flymake-jshint company-tern tern tern-context-coloring dictcc nyan-mode yascroll ox-twbs ace-window move-text f org-ref use-package diff-hl focus-autosave-mode buffer-move weechat sublimity wolfram org-pdfview pdf-tools aggressive-indent flycheck-pyflakes fancy-battery multiple-cursors pabbrev htmlize o-blog ob-browser org-bullets helm highlight-current-line hl-todo powerline org2blog magithub)))
 '(pos-tip-background-color "#1A3734")
 '(pos-tip-foreground-color "#FFFFC8")
 '(powerline-default-separator (quote wave))
 '(powerline-display-hud t)
 '(powerline-gui-use-vcs-glyph nil)
 '(powerline-height 25)
 '(powerline-text-scale-factor nil)
 '(ripgrep-arguments nil)
 '(save-place t)
 '(scroll-bar-mode nil)
 '(send-mail-function (quote mailclient-send-it))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(tramp-syntax (quote default) nil (tramp))
 '(treemacs-filewatch-mode t)
 '(undo-tree-mode-lighter "")
 '(wttrin-default-cities (quote ("Munich" "Seoul" "구리시"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Cousine" :foundry "outline" :slant normal :weight normal :height 113 :width normal))))
 '(company-preview ((t (:background "#657b83" :foreground "#eee8d5"))))
 '(company-scrollbar-fg ((t (:background "#002B36"))))
 '(diff-hl-change ((t (:background "#073642" :foreground "orange"))))
 '(diff-hl-delete ((t (:background "#073642" :foreground "orange red"))))
 '(diff-hl-insert ((t (:inherit diff-added :background "#073642" :foreground "green"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#49974A" :slant italic))))
 '(font-lock-comment-face ((t (:foreground "#49974A" :slant italic))))
 '(mode-line ((t (:background "#073642" :box nil :weight normal :height 1.0))))
 '(mode-line-buffer-id-inactive ((t (:inherit mode-line-buffer-id :box nil))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#073642" :foreground "#586e75" :box nil :weight normal :height 1.0))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.8))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.5))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.3))))
 '(org-meta-line ((t (:inherit mode-line-buffer-id))))
 '(package-name ((t (:foreground "SpringGreen3" :underline t))))
 '(powerline-active1 ((t (:background "#14282D" :foreground "#839496" :box nil))))
 '(powerline-active2 ((t (:background "#073642" :foreground "#839496" :box nil))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive :background "grey11" :box nil))))
 '(powerline-inactive2 ((t (:inherit mode-line-inactive :background "grey20" :box nil))))
 '(treemacs-directory-collapsed-face ((t (:inherit default))))
 '(treemacs-directory-face ((t (:inherit default))))
 '(treemacs-git-added-face ((t (:inherit diff-hl-insert :background "#002B36"))))
 '(treemacs-git-ignored-face ((t (:inherit file-name-shadow))))
 '(treemacs-git-modified-face ((t (:inherit diff-hl-change :background "#002B36"))))
 '(treemacs-git-untracked-face ((t (:inherit diff-hl-insert :background "#002B36"))))
 '(treemacs-tags-face ((t (:inherit file-name-shadow)))))

(org-babel-load-file
 (expand-file-name "emacs-init.org"
                   user-emacs-directory))
