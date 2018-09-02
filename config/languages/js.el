(use-package ng2-mode
  :ensure t)

(use-package tide
  :ensure t
  :diminish
  :config
  (setq tide-allow-popup-select (quote (code-fix jump-to-implementation refactor)))
  (setq tide-completion-detailed t)
  (setq tide-default-mode "JSX"))

;; (use-package emmet-mode
  ;; :ensure t)

(flycheck-add-mode 'javascript-eslint 'rjsx-mode)

(flycheck-add-mode 'typescript-tide   'ng2-ts-mode)
(flycheck-add-mode 'typescript-tslint 'ng2-ts-mode)

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
;; (add-hook 'rjsx-mode-hook #'emmet-mode)

;; (add-hook 'ng2-html-mode-hook 'emmet-mode)

(use-package rjsx-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '(".*\\.js\\'" . rjsx-mode))
  ;; Use space instead of tab
  (setq indent-tabs-mode nil)
  ;; disable the semicolon warning
  (setq js2-strict-missing-semi-warning nil))

;; (require 'lsp-javascript-flow)
;; (add-hook 'js-mode-hook #'lsp-javascript-flow-enable)
;; (add-hook 'js2-mode-hook #'lsp-javascript-flow-enable) ;; for js2-mode support
;; (add-hook 'rjsx-mode #'lsp-javascript-flow-enable) ;; for rjsx-mode support
