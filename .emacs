;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/"))

  (add-to-list
   'package-archives
   '("marmalade" . "https://marmalade-repo.org/packages/"))
  
  (package-initialize))


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
    (o-blog ob-browser org-bullets helm highlight-current-line hl-todo powerline org2blog magithub)))
 '(save-place t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

;; Fonts 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "outline" :slant normal :weight normal :height 113 :width normal))))
 '(escape-glyph ((t (:foreground "#ddaa6f" :weight bold))))
 '(font-lock-builtin-face ((t (:foreground "#f47444" :weight normal))))
 '(font-lock-comment-face ((t (:foreground "#999999" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "#aa9999" :weight normal))))
 '(font-lock-function-name-face ((t (:foreground "#cae682"))))
 '(font-lock-keyword-face ((t (:foreground "#80aaff" :weight bold))))
 '(font-lock-string-face ((t (:foreground "#00dd66" :weight normal))))
 '(font-lock-type-face ((t (:foreground "#92a65e" :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "#cae682"))))
 '(font-lock-warning-face ((t (:foreground "#ddcc8f"))))
 '(minibuffer-prompt ((t (:foreground "#36a5ff"))))
 '(mode-line ((t (:foreground "#ffffff" :background "#0088cc" :box nil))))
 '(mode-line-inactive ((t (:foreground "#00aaee" :background "#444444" :box nil))))
 '(set-face-attribute (quote region) nil :background))

;; numbers highlighted
(font-lock-add-keywords nil '(("[-+]?\\b[0-9]*\\.?[0-9]+\\(?:[eE][-+]?[0-9]+\\)?\\b" . font-lock-warning-face)))


;; long lines
(set-default 'truncate-lines t)

;; No bell sound
(setq visible-bell 1)

;; Powerline (Triangles)
(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
(require 'powerline)
(require 'cl)

(setq powerline-arrow-shape 'curve)
(powerline-default-theme)
(powerline-reset)

;; These two lines are just examples
(setq powerline-default-separator-dir '(left . right))

;; startup maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;(split-window-horizontally)


;show parentheses
(show-paren-mode t)


;; move lines and regions
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
        (forward-line -1)
	)
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


(global-set-key [M-up] 'move-text-up)
(global-set-key [M-down] 'move-text-down)

;; scroll one line at a time (less "jumpy" than defaults)    
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil)            ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)                  ;; scroll window under mouse
(setq scroll-step 1)                                ;; keyboard scroll one line at a time


;;
;; UI COLORS
;;
(set-background-color "#3f3f45")
(set-cursor-color "#00aaee")
;; Highlighted text color and background
(set-face-attribute 'region nil :background "#0077aa" :foreground "#ffffff")
;; highlight current line
;; (highlight-current-line-set-bg-color "#37373b")
