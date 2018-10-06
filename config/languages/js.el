;; (use-package ng2-mode
  ;; :ensure t)

(use-package tide
  :ensure t
  :diminish
  :config
  (setq tide-allow-popup-select (quote (code-fix jump-to-implementation refactor)))
  (setq tide-completion-detailed t)
  (setq tide-default-mode "JSX"))

;; (use-package emmet-mode
  ;; :ensure t)

;; (flycheck-add-mode 'javascript-eslint 'rjsx-mode)
;; (flycheck-add-mode 'javascript-jshint 'rjsx-mode)
;; (flycheck-add-mode 'javascript-tide 'rjsx-mode)
;; (flycheck-add-mode 'typescript-tide   'ng2-ts-mode)
;; (flycheck-add-mode 'typescript-tslint 'ng2-ts-mode)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  ;; (flycheck-mode +1)
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

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name
                       (if (string-equal system-type "windows-nt")
                           "node_modules/.bin/eslint.cmd"
                         "node_modules/eslint/bin/eslint.js")
                       root))))
    (when (and eslint (file-exists-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)


(setq yarn--running-p nil)
(setq yarn--run-frame-name "yarn run")
(setq yarn--run-buffer-name "*shell - yarn run*")

(defun yarn-run-start ()
  (interactive)
  (when yarn--running-p
    (error "yarn is already running"))
  (let ((root-path (locate-dominating-file (expand-file-name default-directory) "package.json")))
    (unless root-path
      (error "not in a npm project"))
    (make-frame `((name . ,yarn--run-frame-name)))
    (select-frame-by-name yarn--run-frame-name)
    (shell)
    (rename-buffer yarn--run-buffer-name)
    (delete-other-windows)
    (compilation-shell-minor-mode 1)
    (insert (concat "cd " root-path ""))
    (comint-send-input)
    (insert "yarn start")
    (comint-send-input)
    (end-of-buffer)
    (other-frame 1)
    (setq yarn--running-p t)))

(defun yarn-run-kill ()
  (interactive)
  (unless yarn--running-p
    (error "yarn is not running"))
  (select-frame-by-name yarn--run-frame-name)
  (let ((kill-buffer-query-functions
         (delq 'process-kill-buffer-query-function kill-buffer-query-functions)))
    (kill-buffer yarn--run-buffer-name))
  (delete-frame)
  (setq yarn--running-p nil))


(defhydra hydra-yarn (:color pink :hint nil)
  "
^yarn^
------
_s_tart
_k_ill
"
  ("s" yarn-run-start       :color blue)
  ("k" yarn-run-kill        :color blue)
  ("q" quit-window "quit"   :color blue))
