(setq user-full-name    "Felix Brendel"
      user-mail-address "felix@brendel.engineering")

(if (string= system-type "windows-nt")
  (setq build-script-name "build.bat")
 (setq build-script-name "build.sh")
)

(setq doc-view-ghostscript-program "/usr/bin/gs")

(add-to-list 'exec-path "D:/Daten/Coding/Go/Library/bin/")

(setq org-reveal-root "file:///d:/Programme/revealjs/reveal.js-3.6.0/")

(setq find-todo-regex "\\b((TODO)|(NOTE)|(QUESTION)|(HACK)|(BUG))")

(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

(require 'package)
(load-library "url-handlers")

(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/"))

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package academic-phrases
  :ensure t
 )

(if (version< emacs-version "26.0")
    (message "is before 26.0 - skipping company-childframe")
  (use-package company-childframe
  :ensure t
  :config
    (setcar (cdr (assq 'company-childframe-mode minor-mode-alist)) "")
     (company-childframe-mode 1)))

(use-package company :ensure t
  :config
  (setq company-dabbrev-downcase nil)
  (setq-default company-lighter-base "(C)")
  (setq-default company-show-numbers          1)
  (setq-default company-idle-delay            0) ; start completion immediately
  (setq-default company-minimum-prefix-length 1) ; start completion after 1 character.
  (setq-default company-tooltip-align-annotations t)
  (global-company-mode 1))
  (setq company-clang-executable "c:/Languages/LLVM/bin/clang.exe")

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode t)
  (diff-hl-flydiff-mode t)
  (diff-hl-margin-mode t)

  ;; Workaround for displaying correctly in other window
  (use-package frame
    :defer t
    :config
      (progn
       (setq window-divider-default-places 'right-only) ;Default 'right-only
         ;; https://debbugs.gnu.org/cgi/bugreport.cgi?bug=27830#20
         ;; Workaround on emacs 26+ to prevent fringe truncation. You need to use
         ;; either scroll bars or window dividers to prevent that.
         ;; I dislike the default face of `window-divider', so I customize that in my
         ;; `smyx-theme`.
         (setq window-divider-default-right-width 1) ;Default 6
         (window-divider-mode 1))))

(use-package diminish
  :ensure t)

(use-package dumb-jump
  :ensure t)

(use-package flycheck
  :ensure t)

(use-package go-mode
  :ensure t)

(use-package company-go
  :ensure t)

(use-package hl-todo
  :ensure t
  :config
  (global-hl-todo-mode))

(use-package ido-vertical-mode
  :ensure t
  :config
    (ido-mode 1)
    (ido-vertical-mode 1))

(use-package ivy
  :ensure t
   :config (ivy-mode 1))

(use-package magit
  :ensure t)

(use-package multiple-cursors
  :ensure t)

(require 'org)
   (require 'ox-latex)
   (require 'compile)

   (add-to-list 'compilation-error-regexp-alist 'latex-warning)
   (add-to-list 'compilation-error-regexp-alist-alist
                 '(latex-warning
                   "\\(LaTeX.*? Warning:\\(.+\n\\)*\\)" 3 1))

   (add-to-list 'compilation-error-regexp-alist 'latex-error)
   (add-to-list 'compilation-error-regexp-alist-alist
                 '(latex-error
                 "\\(.*Error:\\(.+\n\\)*\\)" 1))

   (add-to-list 'compilation-error-regexp-alist 'latex-error2)
   (add-to-list 'compilation-error-regexp-alist-alist
                 '(latex-error2
                 "\\(^!\s.*\\)" 1))

   (setq org-latex-listings 'minted)
   (setq org-latex-pdf-process '("latexmk -pdf %f"))
   (setq org-default-notes-file "~/org/notes.org")
   (setq org-log-done 'time)
   (setq org-capture-templates
         (quote
          (("t" "Task" entry
            (file+headline "~/org/notes.org" "Tasks")
            "* TODO %?
  %i
  %a")
           ("s" "Schedule entry" entry
            (file+headline "~/org/notes.org" "Schedule")
            ""))))

   (setq org-default-notes-file "~/org/notes.org")
   (setq org-export-dispatch-use-expert-ui nil)
   (setq org-highlight-latex-and-related (quote (latex script entities)))
   (setq org-latex-caption-above nil)
   (setq org-latex-prefer-user-labels t)
   (setq org-latex-classes
         (quote
          (("scrreprt" "\\documentclass{scrreprt}"
            ("\\chapter{%s}"       . "\\chapter*{%s}")
            ("\\section{%s}"       . "\\section*{%s}")
            ("\\subsection{%s}"    . "\\subsection*{%s}")
            ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
            ("\\paragraph{%s}"     . "\\paragraph*{%s}")
            ("\\subparagraph{%s}"  . "\\subparagraph*{%s}"))
           ("sig" "\\documentclass{sig-alternate}"
            ("\\section{%s}"       . "\\section*{%s}")
            ("\\subsection{%s}"    . "\\subsection*{%s}")
            ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
            ("\\paragraph{%s}"     . "\\paragraph*{%s}")
            ("\\subparagraph{%s}"  . "\\subparagraph*{%s}"))
           ("article" "\\documentclass[11pt]{article}"
            ("\\section{%s}"       . "\\section*{%s}")
            ("\\subsection{%s}"    . "\\subsection*{%s}")
            ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
            ("\\paragraph{%s}"     . "\\paragraph*{%s}")
            ("\\subparagraph{%s}"  . "\\subparagraph*{%s}"))
           ("report" "\\documentclass[11pt]{report}"
            ("\\part{%s}"          . "\\part*{%s}")
            ("\\chapter{%s}"       . "\\chapter*{%s}")
            ("\\section{%s}"       . "\\section*{%s}")
            ("\\subsection{%s}"    . "\\subsection*{%s}")
            ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
           ("book" "\\documentclass[11pt]{book}"
            ("\\part{%s}"          . "\\part*{%s}")
            ("\\chapter{%s}"       . "\\chapter*{%s}")
            ("\\section{%s}"       . "\\section*{%s}")
            ("\\subsection{%s}"    . "\\subsection*{%s}")
            ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))))

   (setq org-latex-default-packages-alist
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

  (setq org-latex-hyperref-template nil)
  (setq org-latex-listings (quote minted))
  (setq org-src-fontify-natively t)
  (setq org-structure-template-alist
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



   (add-hook 'org-mode-hook (lambda ()
          (set-fill-column 100)
          (org-bullets-mode 1)
          (abbrev-mode 1)
          (auto-fill-mode 1)))

   (use-package org-bullets
     :ensure t)

   (use-package ox-reveal
     :ensure t)

   (use-package ox-twbs
     :ensure t)

(use-package color-theme-sanityinc-solarized
    :ensure t)

(use-package ng2-mode
      :ensure t)

  (use-package tide
      :ensure t)

  (use-package emmet-mode
      :ensure t)

(flycheck-add-mode 'typescript-tide 'ng2-ts-mode)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1)

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)
)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'rjsx-mode-hook #'setup-tide-mode)
(add-hook 'rjsx-mode-hook 'emmet-mode)

(add-hook 'ng2-html-mode-hook 'emmet-mode)

(use-package powerline
  :ensure t
  :config
    (powerline-default-theme))

(use-package projectile
   :ensure t
   :config
   (projectile-global-mode)
   (diminish 'projectile-mode))

 (use-package projectile-ripgrep
   :ensure t)

(use-package rjsx-mode
  :ensure t
  :config
    (add-to-list 'auto-mode-alist '(".*\\.js\\'" . rjsx-mode))
    ;; Use space instead of tab
    (setq indent-tabs-mode nil)
    ;; disable the semicolon warning
    (setq js2-strict-missing-semi-warning nil))

(use-package treemacs
  :ensure t
  :defer nil
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (setq treemacs-change-root-without-asking nil
        treemacs-collapse-dirs              (if (executable-find "python") 3 0)
        treemacs-file-event-delay           100
        treemacs-follow-after-init          t
        treemacs-follow-recenter-distance   0.1
        treemacs-goto-tag-strategy          'refetch-index
        treemacs-indentation                2
        treemacs-indentation-string         " "
        treemacs-is-never-other-window      t
        treemacs-never-persist              nil
        treemacs-no-png-images              nil
        treemacs-recenter-after-file-follow nil
        treemacs-recenter-after-tag-follow  nil
        treemacs-show-hidden-files          t
        treemacs-silent-filewatch           nil
        treemacs-silent-refresh             t
        treemacs-sorting                    'alphabetic-desc
        treemacs-tag-follow-cleanup         t
        treemacs-tag-follow-delay           1.5
        treemacs-width                      35)

 ;;   ;; (treemacs-follow-mode t)
 ;;   ;; (treemacs-filewatch-mode t)
 ;;   ;; (treemacs-git-mode 'simple)

  :bind
  (:map global-map
        ([f8]         . treemacs-toggle)
        ("M-0"        . treemacs-select-window)
        ("C-x 1"      . treemacs-delete-other-windows)))

(use-package treemacs-projectile
  :defer t
  :ensure t
  :config
  (setq treemacs-header-function #'treemacs-projectile-create-header))

(use-package wolfram
  :ensure t
  :config
    (setq wolfram-alpha-app-id "UX8T57-3WXAA24JHT"))

(use-package wttrin
  :ensure t
  :config
  (setq wttrin-default-accept-language '("Accept-Language" . "de-DE")))

(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil)            ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)                  ;; scroll window under mouse
(setq scroll-step 1)                                ;; keyboard scroll one line at a time
(setq scroll-conservatively 101)

(set-default 'truncate-lines t)

(setq initial-major-mode 'text-mode)
(setq initial-scratch-message "\
Unfortunately there is a radio connected to my brain.")
; (add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq frame-title-format "%b - Emacs ")

(defvar blink-cursor-colors
   (list  "#92c48f" "#6785c5" "#be369c" "#d9ca65")
 ;; (list
 ;;     "#00FFF6"
 ;;     "#0099FF")
  "On each blink the cursor will cycle to the next color in this list.")

(setq blink-cursor-count 0)
(defun blink-cursor-timer-function ()
  "Zarza wrote this cyberpunk variant of timer `blink-cursor-timer'.
Warning: overwrites original version in `frame.el'.

This one changes the cursor color on each blink. Define colors in `blink-cursor-colors'."
  (when (not (internal-show-cursor-p))
    (when (>= blink-cursor-count (length blink-cursor-colors))
      (setq blink-cursor-count 0))
    (set-cursor-color (nth blink-cursor-count blink-cursor-colors))
    (setq blink-cursor-count (+ 1 blink-cursor-count))
    )
  (internal-show-cursor nil (not (internal-show-cursor-p))))

(blink-cursor-mode)

(set-frame-parameter (selected-frame) 'alpha '(100 . 96))
 (add-to-list 'default-frame-alist '(alpha . (100 . 96)))
 (defun transparency-toggle ()
   (interactive)
   (let ((alpha (frame-parameter nil 'alpha)))
     (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
          '(100 . 96) '(100 . 96)))))
(transparency-toggle)

(setq gc-cons-threshold (eval-when-compile (* 1024 1024 1024)))
(run-with-idle-timer 2 t (lambda () (garbage-collect)))

(setq backup-directory-alist `(("." . "~/.emacs-saves")))

(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

(setq compilation-ask-about-save nil)
(setq compilation-auto-jump-to-first-error nil)
(setq compile-command "find_and_run.py build.bat")
(setq compilation-read-command nil)
(setq compilation-scroll-output t)
;; compilation in new frame
;; (setq special-display-buffer-names
;;      `(("*compilation*" . ((name . "*compilation*")
;;                            ,@default-frame-alist
;;                            (left . (- 1))
;;                            (top . 0)))))

;; (setq special-display-buffer-names
;;     `(("*Org PDF LaTeX Output*" . ((name . "*Org PDF LaTeX Output*")
;;                           ,@default-frame-alist
;;                           (left . (- 1))
;;                           (top . 0)))))

(defadvice yank (around html-yank-indent)
  "Indents after yanking."
  (let ((point-before (point)))
    ad-do-it
      (indent-region point-before (point))))
(ad-activate 'yank)

(global-auto-revert-mode t)

;; auto overwrap i-search
;; Prevents issue where you have to press backspace twice when
;; trying to remove the first character that fails a search
(define-key isearch-mode-map [remap isearch-delete-char] 'isearch-del-char)

(defadvice isearch-search (after isearch-no-fail activate)
  (unless isearch-success
    (ad-disable-advice 'isearch-search 'after 'isearch-no-fail)
    (ad-activate 'isearch-search)
    (isearch-repeat (if isearch-forward 'forward))
    (ad-enable-advice 'isearch-search 'after 'isearch-no-fail)
    (ad-activate 'isearch-search)))


;; search for highlighted if exist
(defun jrh-isearch-with-region ()
  "Use region as the isearch text."
  (when mark-active
    (let ((region (funcall region-extract-function nil)))
      (deactivate-mark)
      (isearch-push-state)
      (isearch-yank-string region))))
(add-hook 'isearch-mode-hook #'jrh-isearch-with-region)

(setq visible-bell nil
    ring-bell-function #'ignore)

(setq sentence-end-double-space nil)

(setq org-agenda-files '("~/org"))

(setq org-log-done 'time)

(delete-selection-mode 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace-except-current-line)
(defun untabify-except-makefiles ()
"Replace tabs with spaces except in makefiles."
(unless (derived-mode-p 'makefile-mode)
  (untabify (point-min) (point-max))))

(add-hook 'before-save-hook 'untabify-except-makefiles)

(add-hook 'focus-out-hook          (lambda () (when (and buffer-file-name (buffer-modified-p)) (save-buffer))))
(add-hook 'mouse-leave-buffer-hook (lambda () (when (and buffer-file-name (buffer-modified-p)) (save-buffer))))

 (defadvice switch-to-buffer (before save-buffer-now activate)
   (when (and buffer-file-name (buffer-modified-p)) (save-buffer)))
 (defadvice other-window (before other-window-now activate)
(when (and buffer-file-name (buffer-modified-p)) (save-buffer)))

(defalias 'yes-or-no-p 'y-or-n-p)

(modify-syntax-entry ?_ "w")

(require 'winner)
(winner-mode 1)

(global-unset-key (kbd "ESC ESC ESC"))
(global-unset-key (kbd "<f2> <f2>"))

(global-set-key (kbd "C-S-d") 'duplicate-line)

(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)


(with-eval-after-load 'doc-view
  (define-key doc-view-mode-map (kbd "<C-wheel-up>") 'doc-view-enlarge)
  (define-key doc-view-mode-map (kbd "<C-wheel-down>") 'doc-view-shrink))

(global-set-key (kbd "M-.") 'dumb-jump-go-set-mark)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-unset-key (kbd "C-<down-mouse-1>"))
(global-set-key (kbd "C-<mouse-1>") 'mc/add-cursor-on-click)
(define-key mc/keymap (kbd "<return>") nil)

(global-set-key (kbd "C-c e") 'save-and-find-build-script-and-compile)

(global-set-key (kbd "C-z") 'winner-undo)
(global-unset-key "\C-d")
(global-set-key (kbd "C-j") 'join-line)


;; Multi cursor
(define-key rjsx-mode-map (kbd "C-d") 'mark-word-or-next-word-like-this) ;; rjsx-mode
(define-key java-mode-map (kbd "C-d") 'mark-word-or-next-word-like-this) ;; rjsx-mode

(global-set-key (kbd "C-d") 'mark-word-or-next-word-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C-c i") 'find-user-init-file)

;; Open specific files / buffers
(global-set-key (kbd "C-c t") 'find-org-capture-file)
(global-set-key (kbd "C-c T") 'projectile-find-todos)
(global-set-key (kbd "C-#") 'comment-line)

;; Move lines
(global-set-key [M-up]   'move-lines-up)
(global-set-key [M-down] 'move-lines-down)

;; projectile
(global-set-key (kbd "C-c p s r") 'projectile-ripgrep)


;; org
;; (define-key org-mode-map (kbd "C-c e") 'save-and-export-to-pdf)
;; (define-key org-mode-map (kbd "C-c r") 'save-and-export-to-reavealjs)
(define-key org-mode-map (kbd "C-#") 'comment-line)
(define-key org-mode-map [M-up]   'move-lines-up)
(define-key org-mode-map [M-down] 'move-lines-down)
(define-key org-mode-map (kbd "C-j") 'join-line)

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line 1)
  (yank)
  (yank)
  (forward-line -1)
)

(defun dumb-jump-go-set-mark ()
   "Sets a mark and dumb jumps."
   (interactive)
   (kbd "C-SPC C-SPC")
   (dumb-jump-go nil))

(defun projectile-find-todos ()
   "find TODOS in the project."
   (interactive)
   (ripgrep-regexp find-todo-regex (projectile-project-root)))

(defun save-and-find-build-script-and-compile ()
  "Walks upward the directory tree until a buildscript is found"
  (interactive)
  (save-buffer)
  (let* ((build-script-path (locate-dominating-file (expand-file-name default-directory) build-script-name)))
      (if build-script-path (progn
          (setq compile-command (concat build-script-path build-script-name))
          (compile compile-command))
        (error (concat "The default buildscript '" build-script-name "' cannot be found"))
      )
   )
)

(defun move-lines (n)
  (let ((beg) (end) (keep))
    (if mark-active
        (save-excursion
          (setq keep t)
          (setq beg (region-beginning)
                end (region-end))
          (goto-char beg)
          (setq beg (line-beginning-position))
          (goto-char end)
          (setq end (line-beginning-position 2)))
      (setq beg (line-beginning-position)
            end (line-beginning-position 2)))
    (let ((offset (if (and (mark t)
                           (and (>= (mark t) beg)
                                (< (mark t) end)))
                      (- (point) (mark t))))
          (rewind (- end (point))))
      (goto-char (if (< n 0) beg end))
      (forward-line n)
      (insert (delete-and-extract-region beg end))
      (backward-char rewind)
      (if offset (set-mark (- (point) offset))))
    (if keep
        (setq mark-active t
              deactivate-mark nil))))

(defun move-lines-up (n)
  "move the line(s) spanned by the active region up by N lines."
  (interactive "*p")
  (move-lines (- (or n 1))))

(defun move-lines-down (n)
  "move the line(s) spanned by the active region down by N lines."
  (interactive "*p")
  (move-lines (or n 1)))

(defun find-user-init-file ()
  "Edit the `init.org', in another window."
  (interactive)
  (find-file-other-window "~/.emacs.d/emacs-init.org"))

(defun find-org-capture-file ()
  "Edit the org capture file, in another window."
  (interactive)
  (find-file-other-window org-default-notes-file))

(defun browse-file-directory ()
  "Open the current file's directory however the OS would."
  (interactive)
  (if default-directory
      (browse-url-of-file (expand-file-name default-directory))
    (error "No `default-directory' to open")))

(defun delete-trailing-whitespace-except-current-line ()
  (interactive)
  (let ((begin (line-beginning-position))
        (end (line-end-position)))
    (save-excursion
      (when (< (point-min) begin)
        (save-restriction
          (narrow-to-region (point-min) (1- begin))
          (delete-trailing-whitespace)))
      (when (> (point-max) end)
        (save-restriction
          (narrow-to-region (1+ end) (point-max))
          (delete-trailing-whitespace))))))

(defun save-and-export-to-pdf ()
    "Save the buffer and then latex export to pdf."
    (interactive)
    (save-buffer)
    (org-latex-export-to-pdf)
    ;; (switch-to-buffer-other-window "*Org PDF LaTeX Output*")
    ;; (compilation-mode)
)

  (defun save-and-export-to-reavealjs ()
    "Save the buffer and then latex export to reavealjs slides."
    (interactive)
    (save-buffer)
    (org-reveal-export-to-html-and-browse))

(defun mark-current-word (&optional arg allow-extend)
  "Put point at beginning of current word, set mark at end."
  (interactive "p\np")
  (setq arg (if arg arg 1))
  (if (and allow-extend
           (or (and (eq last-command this-command) (mark t))
               (region-active-p)))
      (set-mark
       (save-excursion
         (when (< (mark) (point))
           (setq arg (- arg)))
         (goto-char (mark))
         (forward-word arg)
         (point)))
    (let ((wbounds (bounds-of-thing-at-point 'word)))
      (unless (consp wbounds)
        (error "No word at point"))
      (if (>= arg 0)
          (goto-char (car wbounds))
        (goto-char (cdr wbounds)))
      (push-mark (save-excursion
                   (forward-word arg)
                   (point)))
      (activate-mark))))

(defun mark-word-or-next-word-like-this ()
  "if there is no active region the word under
   the point will be marked, otherwise the next word is selected."
  (interactive)
  (if (region-active-p)
  ;; then
    (progn
      (mc/mark-more-like-this nil 'forwards)
      (mc/maybe-multiple-cursors-mode)
      (mc/cycle-forward))
  ;; else
    (mc--select-thing-at-point 'word)))

(setq compilation-finish-functions
   (lambda (buf str)
      (if (string= "finished\n" str)
         (progn
            (run-at-time "0.2 sec" nil
               (lambda ()
                  (setq inhibit-message 1)
                  (winner-undo)
                  (setq inhibit-message nil)
               )
            )
         )
      )
   )
)

(add-hook 'go-mode-hook (lambda ()
  (set (make-local-variable 'company-backends) '(company-go))
  (company-mode)
  (add-hook 'before-save-hook 'gofmt-before-save)
  (setq tab-width 4)
  (setq indent-tabs-mode 1)))

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

  (add-hook 'c++-mode-hook (
      lambda()
         (c-set-style "awk")
         (c-set-offset 'inlambda 0)
         (abbrev-mode -1)
         (define-key c++-mode-map (kbd "C-d") nil)
         (flycheck-mode 1)
  ))

  (add-hook 'c-mode-hook (
      lambda()
         (c-set-style "awk")
         (c-set-offset 'inlambda 0)
         (abbrev-mode -1)
         (define-key c-mode-map (kbd "C-d") nil)
         (flycheck-mode 1)
  ))

(add-hook 'doc-view-mode-hook (
  lambda ()
    (auto-revert-mode)
    (setq doc-view-continuous t)
  ))

(require 'ido)

  (defun insert-build-script()
    "Prompt user to pick a build script to insert."
    (interactive)

    (let ((choices-alist '(("cl.exe" . "@echo off
pushd %~dp0

set exeName=main.exe
set binDir=bin

mkdir quickbuild
pushd quickbuild

cl^
   ../src/*.cpp^
   /Fe%exeName% /MP /openmp /W3 /std:c++latest^
   /nologo /EHsc /Z7^
   /link /incremental /debug:fastlink

if %errorlevel% == 0 (
   echo.
   if not exist ..\\%binDir% mkdir ..\\%binDir%
   move %exeName% ..\\%binDir%\\ > NUL
   pushd ..\\%binDir%
  echo ---------- Output start ----------
   %exeName%
   echo ---------- Output   end ----------
   del %exeName% /S /Q > NUL
   popd
) else (
  echo.
  echo Fucki'n 'ell
)

popd
rd quickbuild /S /Q
popd") ("generic" . "@echo off
pushd %~dp0

build
run

popd") ("python" . "@echo off
pushd %~dp0

python filename.py

popd") ("go" . "@echo off

set mainFileName=main

pushd %~dp0

go build %mainFileName%.go

if %errorlevel% == 0 (
   echo.

   echo ---------- Output start ----------
   %mainFileName%
   echo ---------- Output   end ----------

) else (
  echo.
  echo Fucki'n 'ell
)

popd") ("org-mode" . "@echo off
pushd %~dp0

set fileName=\"Ausarbeitung\"
set pdfTempDir=\"temp_pdf\"

emacsclient -c ^
 -e \"(progn (require 'org) (find-file-other-window \\\"%fileName%.org\\\") (org-latex-export-to-latex) (save-buffers-kill-terminal))\"

echo.
echo ================================================
echo               Tex Export Finished
echo ================================================
echo.

if %errorlevel% == 0 (
    if not exist %pdfTempDir% (
        mkdir %pdfTempDir%
    ) else (
        call :copyfilesin
    )

    latexmk -Werror -pdf -shell-escape %fileName%.tex && (
        call :cleanup
        goto :success
    ) || (
        echo Errors converting to pdf ㅠㅠ
        call :cleanup
        goto :fail
    )
) else (
    echo Errors converting to tex ㅠㅠ
    goto:fail
)

:copyfilesin
for /f \"usebackq\" %%m in (`dir /b %pdfTempDir%\\*minted*`) do (
    move \"%pdfTempDir%\\%%m\" \"%%m\" > NUL
)
move %pdfTempDir%\\*.aux .\\ > NUL
move %pdfTempDir%\\*.bbl .\\ > NUL
move %pdfTempDir%\\*.blg .\\ > NUL
move %pdfTempDir%\\*.fdb_latexmk .\\ > NUL
move %pdfTempDir%\\*.fls .\\ > NUL
move %pdfTempDir%\\*.log .\\ > NUL
move %pdfTempDir%\\*.out .\\ > NUL
move %pdfTempDir%\\*.toc .\\ > NUL
goto :eof

:cleanup
for /f \"usebackq\" %%m in (`dir /b *minted*`) do (
    move \"%%m\" \"%pdfTempDir%\\%%m\" > NUL
)
move *.aux %pdfTempDir%\\ > NUL
move *.bbl %pdfTempDir%\\ > NUL
move *.blg %pdfTempDir%\\ > NUL
move *.fdb_latexmk %pdfTempDir%\\ > NUL
move *.fls %pdfTempDir%\\ > NUL
move *.log %pdfTempDir%\\ > NUL
move *.out %pdfTempDir%\\ > NUL
move *.toc %pdfTempDir%\\ > NUL
goto :eof

:success
popd
echo yey
exit 0

:fail
popd
exit 1")

)))

      (let ((choice (ido-completing-read "Insert build script for:" (mapcar #'car choices-alist))))
        (insert (alist-get choice choices-alist)))))

(setcar (cdr (assq 'ivy-mode minor-mode-alist)) "")
(setcar (cdr (assq 'abbrev-mode minor-mode-alist)) "")
(setcar (cdr (assq 'auto-fill-function minor-mode-alist)) "")
