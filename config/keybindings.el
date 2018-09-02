(with-eval-after-load 'org
  (define-key org-mode-map (kbd "<f2>") 'org-agenda-show-agenda-and-todo)
  (define-key org-mode-map (kbd "C-#") 'comment-line)
  (define-key org-mode-map [M-up]   'move-lines-up)
  (define-key org-mode-map [M-down] 'move-lines-down)
  (define-key org-mode-map (kbd "C-j") 'join-line)

  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture))

(with-eval-after-load 'org-agenda
  (define-key org-agenda-mode-map (kbd "<mouse-1>") 'org-agenda-goto-mouse))

(with-eval-after-load 'flyspell
  (define-key flyspell-mouse-map (kbd "<mouse-3>") 'flyspell-correct-word))

(with-eval-after-load 'rjsx-mode
  (define-key rjsx-mode-map (kbd "C-d") 'mark-word-or-next-word-like-this))

(with-eval-after-load 'java
  (define-key java-mode-map (kbd "C-d") 'mark-word-or-next-word-like-this))

;; (define-key c-mode-map (kbd "C-d") 'mark-word-or-next-word-like-this)

(with-eval-after-load 'cc-mode(define-key c++-mode-map (kbd "C-d") 'mark-word-or-next-word-like-this))

(with-eval-after-load 'doc-view
  (define-key doc-view-mode-map (kbd "<C-wheel-up>") 'doc-view-enlarge)
  (define-key doc-view-mode-map (kbd "<C-wheel-down>") 'doc-view-shrink))

(with-eval-after-load 'mc
  (define-key mc/keymap (kbd "<return>") nil))

(with-eval-after-load 'ng2
  (define-key emmet-mode-keymap (kbd "C-j") nil))

(with-eval-after-load 'ivy
  (define-key ivy-minibuffer-map (kbd "RET") 'ivy-alt-done))

(global-unset-key (kbd "ESC ESC ESC"))
(global-unset-key (kbd "<f2> <f2>"))
(global-unset-key (kbd "C-<down-mouse-1>"))
(global-unset-key "\C-d")

(global-set-key (kbd "C-S-d") 'duplicate-line)

(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

(global-set-key (kbd "C-S-g") 'abort-recursive-edit)

(global-set-key (kbd "M-.") 'dumb-jump-go-set-mark)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-<mouse-1>") 'mc/add-cursor-on-click)

(global-set-key (kbd "C-c e") 'save-and-find-build-script-and-compile)

(global-set-key (kbd "C-z") 'winner-undo)
(global-set-key (kbd "C-j") 'join-line)

(global-set-key (kbd "C-d") 'mark-word-or-next-word-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(global-set-key (kbd "C-c i") 'find-user-init-file)

;; Open specific files / buffers
(global-set-key (kbd "C-c t") 'find-org-capture-file)
(global-set-key (kbd "C-c T") 'projectile-find-todos)
(global-set-key (kbd "C-c p p") 'projectile-switch-project)
(global-set-key (kbd "C-#") 'comment-line)

;; Move lines
(global-set-key [M-up]   'move-lines-up)
(global-set-key [M-down] 'move-lines-down)

;; projectile
(global-set-key (kbd "C-c p s r") 'projectile-ripgrep)
