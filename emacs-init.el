(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/"))
  (package-initialize))

;; (setq user-full-name "Felix Brendel"
;;       user-mail-address "felix@brendel.engineering") ;

(setq doc-view-ghostscript-program "D:/Programme/gohstscript/gs9.18/bin/gswin32.exe")

(add-to-list 'exec-path "D:/Daten/Coding/Go/Library/bin/")

;; (pyvenv-activate "~/scripts/python/")

(require 'org)
    (require 'ox)
    (require 'multiple-cursors)
;;    (require 'creamsody-theme)

(setq mouse-wheel-scroll-amount '(3 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil)            ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)                  ;; scroll window under mouse
(setq scroll-step 3)                                ;; keyboard scroll one line at a time

(set-default 'truncate-lines t)

(font-lock-add-keywords nil '(("[-+]?\\b[0-9]*\\.?[0-9]+\\(?:[eE][-+]?[0-9]+\\)?\\b" . font-lock-warning-face)))

;; (creamsody-modeline-two)
;; (set-face-attribute 'mode-line nil :height 1.0)
;; (set-face-attribute 'mode-line-inactive nil :height 1.0)
(powerline-default-theme)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; (split-window-horizontally)

(setq initial-scratch-message "\
I’m giving up on trying
to sell your things that you ain’t buying.

It's your move
I played all of mine
Time is running out
Make your move
Or we can't go on
Till you understand
It's all in your hands")
(setq initial-major-mode 'fundamental-mode)

(show-paren-mode t)

(set-cursor-color "#ff84a4")

(setq-default frame-title-format '("%b - Emacs"))

(setq completions-format 'vertical)

(ido-mode 1)
(ido-vertical-mode 1)
;(setq ido-separator "\n\t ")

(setq visible-bell nil
    ring-bell-function #'ignore)

(setq backup-directory-alist `(("." . "~/.emacs-saves")))

(setq delete-old-versions t
kept-new-versions 6
kept-old-versions 2
version-control t)

(add-hook 'focus-out-hook          (lambda () (when (and buffer-file-name (buffer-modified-p)) (save-buffer))))
(add-hook 'mouse-leave-buffer-hook (lambda () (when (and buffer-file-name (buffer-modified-p)) (save-buffer))))

 (defadvice switch-to-buffer (before save-buffer-now activate)
   (when (and buffer-file-name (buffer-modified-p)) (save-buffer)))
 (defadvice other-window (before other-window-now activate)
(when (and buffer-file-name (buffer-modified-p)) (save-buffer)))

(add-hook 'before-save-hook 'delete-trailing-whitespace-except-current-line)
(defun untabify-except-makefiles ()
"Replace tabs with spaces except in makefiles."
(unless (derived-mode-p 'makefile-mode)
  (untabify (point-min) (point-max))))

(add-hook 'before-save-hook 'untabify-except-makefiles)

(modify-syntax-entry ?_ "w")

(setq org-log-done 'time)

(defvar blink-cursor-colors (list
     "#00FFF6"
     "#0099FF")
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

(global-diff-hl-mode t)
;(diff-hl-flydiff-mode t)

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
    (window-divider-mode 1)))

(global-auto-revert-mode t)

(delete-selection-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq locale-coding-system 'utf-8) ; pretty
(set-terminal-coding-system 'utf-8) ; pretty
(set-keyboard-coding-system 'utf-8) ; pretty
(set-selection-coding-system 'utf-8) ; please
(prefer-coding-system 'utf-8) ; with sugar on top

(setq sentence-end-double-space nil)

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

(setq wolfram-alpha-app-id "UX8T57-3WXAA24JHT")

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
  (fill-paragraph 1)
  (save-buffer)
  (org-latex-export-to-pdf))

(global-unset-key (kbd "C-z"))
(global-unset-key "\C-d")
(global-set-key (kbd "C-j") 'join-line)
(global-set-key (kbd "C-d") 'mc/mark-next-like-this-word)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-c i") 'find-user-init-file)
(global-set-key (kbd "C-c t") 'find-org-capture-file)
(global-set-key (kbd "C-#") 'comment-line)

(global-set-key [M-up]   'move-lines-up)
(global-set-key [M-down] 'move-lines-down)

(define-key org-mode-map (kbd "C-c p") 'save-and-export-to-pdf)
(define-key org-mode-map (kbd "C-#") 'comment-line)
(define-key org-mode-map [M-up]   'move-lines-up)
(define-key org-mode-map [M-down] 'move-lines-down)

(bind-key "C-c c" 'org-capture)

(add-hook 'c++-mode-hook (
    lambda()
       (c-set-style "awk")
       (abbrev-mode -1)
       (define-key c++-mode-map (kbd "C-d") nil)
)t)

(add-hook 'c-mode-hook (
    lambda()
       (c-set-style "awk")
       (abbrev-mode -1)
       (define-key c-mode-map (kbd "C-d") nil)
)t)

(defun auto-complete-for-go ()
  (auto-complete-mode 1))
 (add-hook 'go-mode-hook 'auto-complete-for-go)


    (with-eval-after-load 'go-mode
 (require 'go-autocomplete))

(add-hook 'go-mode-hook (
     lambda()
         (add-hook 'before-save-hook #'gofmt-before-save)
 )t)

(add-hook 'python-mode-hook (
    lambda()
        (pyvenv-mode t)
        (elpy-mode t)
        (ido-mode t)
        (flycheck-mode t)
       ;; (aggressive-indent-mode t)
)t)

(setq org-default-notes-file "~/org/notes.org")

  (add-hook 'org-mode-hook (
      lambda()
          (abbrev-mode t)
          (set-fill-column 100)
          (auto-fill-mode t)
          (org-bullets-mode t)
  ))
  (setq org-latex-to-pdf-process '("pdflatex %f && bibtex %f && pdflatex %f && pdflatex %f"))
  (setq org-log-done 'time)

(add-hook 'doc-view-mode-hook (
  lambda ()
    (auto-revert-mode)
    (setq doc-view-continuous t)
  ))
