
(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/"))
  (package-initialize))

(require 'org)
(require 'multiple-cursors)

(custom-set-variables
 '(custom-enabled-themes (quote (wombat)))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (multiple-cursors pabbrev htmlize o-blog ob-browser org-bullets helm highlight-current-line hl-todo powerline org2blog magithub)))
 '(save-place t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

(custom-set-faces
 '(default ((t (:family "Inconsolata" :foundry "outline" :slant normal :weight normal :height 113 :width normal))))
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

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil)            ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)                  ;; scroll window under mouse
(setq scroll-step 1)                                ;; keyboard scroll one line at a time

(setq visible-bell 1)

(set-default 'truncate-lines t)

(font-lock-add-keywords nil '(("[-+]?\\b[0-9]*\\.?[0-9]+\\(?:[eE][-+]?[0-9]+\\)?\\b" . font-lock-warning-face)))

(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)
(require 'cl)

(setq powerline-arrow-shape 'curve)
(powerline-default-theme)
(powerline-reset)

(setq powerline-default-separator-dir '(left . right))

(add-to-list 'default-frame-alist '(fullscreen . maximized))
;; (split-window-horizontally)

(show-paren-mode t)

(set-background-color "#3f3f45")
(set-cursor-color "#00aaee")

(set-face-attribute 'region nil :background "#0077aa" :foreground "#ffffff")

(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)))))
     
(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(defun find-user-init-file ()
  "Edit the `init.org', in another window."
  (interactive)
  (find-file-other-window "~/.emacs.d/emacs-init.org"))

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C-c i") 'find-user-init-file)

(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)
