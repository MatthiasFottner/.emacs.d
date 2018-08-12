(use-package academic-phrases
  :ensure t)

(if (version< emacs-version "26.0")
    (message "is before 26.0 - skipping company-childframe")
  (use-package company-posframe
    :ensure t
    :diminish
    :config
    (company-posframe-mode 1)))

(use-package company :ensure t
  :config
  (setq company-dabbrev-downcase nil)
  (setq-default company-lighter-base "(C)")
  (setq-default company-show-numbers          1)
  (setq-default company-idle-delay            0) ; start completion immediately
  (setq-default company-minimum-prefix-length 1) ; start completion after 1 character.
  (setq-default company-tooltip-align-annotations t)
  (global-company-mode 1))


;; filter companys suggestions, to not contaion numbers, or non ANSII
;; characters or if it is too long
(push (apply-partially #'cl-remove-if
                       (lambda (c)
                         (or (string-match-p "[^\x00-\x7F]+" c)
                             (string-match-p "[0-9]+" c)
                             (if (equal major-mode "org")
                                 (>= (length c) 20)))))
      company-transformers)

(use-package wrap-region
  :ensure t)

(use-package browse-kill-ring
  :ensure t
  :config (browse-kill-ring-default-keybindings))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode t)
  (diff-hl-flydiff-mode t)
  (diff-hl-margin-mode t)
  (setq diff-hl-draw-borders t)
  (setq diff-hl-flydiff-delay 0.1)
  (setq diff-hl-fringe-bmp-function (quote diff-hl-fringe-bmp-from-pos))
  (setq diff-hl-margin-symbols-alist
    (quote
     ((insert . "|")
      (delete . "|")
      (change . "|")
      (unknown . "|")
      (ignored . "|"))))

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

(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

(use-package diminish
  :ensure t)

(use-package dumb-jump
  :ensure t)

(use-package flycheck
  :ensure t)
(use-package flycheck-popup-tip
  :ensure t)

(add-hook 'flycheck-mode-hook 'flycheck-popup-tip-mode)

(use-package go-mode
  :ensure t)

(use-package company-go
  :ensure t)

(use-package hl-todo
  :ensure t
  :config
  (global-hl-todo-mode)
  (setq hl-todo-activate-in-modes (quote (emacs-lisp-mode c++-mode ng2-ts-mode)))
  (setq hl-todo-keyword-faces
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
      ("QUESTION" . "#d0bf8f")))))

(use-package ivy
  :ensure t
  :diminish
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-display-style 'fancy)
  (ivy-use-virtual-buffers t)
  :config
    (setq projectile-completion-system 'ivy)
    (setq ivy-on-del-error-function #'ignore)
    (ivy-mode))

(use-package ivy-rich
  :ensure t
  :custom
  (ivy-virtual-abbreviate 'full
                          ivy-rich-switch-buffer-align-virtual-buffer t
                          ivy-rich-path-style 'abbrev)
  :config
  (ivy-set-display-transformer 'ivy-switch-buffer
                               'ivy-rich-switch-buffer-transformer))

(use-package counsel
  :ensure t
  :diminish
  :config (counsel-mode))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))


(use-package magit
  :ensure t)
(setenv "GIT_ASKPASS" "git-gui--askpass")
(setenv "SSH_ASKPASS" "git-gui--askpass")

(use-package multiple-cursors
  :ensure t)


(use-package powerline
  :ensure t
  :config
   (setq powerline-default-separator (quote wave))
   (setq powerline-display-hud t)
   (setq powerline-gui-use-vcs-glyph nil)
   (setq powerline-height 25)
   (setq powerline-text-scale-factor nil)
   (powerline-default-theme))

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (diminish 'projectile-mode))

(use-package projectile-ripgrep
  :ensure t)

(use-package rainbow-mode
  :ensure t
  :diminish
  :hook (prog-mode))

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
        treemacs-filewatch-mode             t
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
        ([f8]         . treemacs)
        ("M-0"        . treemacs-select-window)
        ("C-x 1"      . treemacs-delete-other-windows)))

(use-package treemacs-projectile
  :defer t
  :config
  (setq treemacs-header-function #'treemacs-projectile-create-header))

(use-package wolfram
  :ensure t
  :config
  (setq wolfram-alpha-app-id "UX8T57-3WXAA24JHT"))

(use-package which-key
  :ensure t
  :config
  (setq which-key-idle-delay 0.2)
  (setq which-key-lighter "")
  (setq which-key-mode t)
  (setq which-key-sort-order (quote which-key-prefix-then-key-order)))

(use-package wttrin
  :ensure t
  :config
  (setq wttrin-default-accept-language '("Accept-Language" . "de-DE"))
  (setq wttrin-default-cities (quote ("Munich" "Seoul" "구리시"))))

(require 'winner)
(winner-mode 1)
