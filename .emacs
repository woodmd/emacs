;; path where settings files are kept

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/settings")
;; path to where plugins are kept
(setq plugin-path "~/.emacs.d/el-get/")

;; define various custom functions
(require 'custom-functions)

;; configure general settings
(require 'general-settings)

;; install dependencies with el-get
;; (require 'el-get-settings)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


(defvar myPackages
  '(py-autopep8)) ;; add the autopep8 package

(require 'py-autopep8)

;; (defun pbcopy ()
;;   (interactive)
;;   (call-process-region (point) (mark) "pbcopy")
;;   (setq deactivate-mark t))

;; (defun pbpaste ()
;;   (interactive)
;;   (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

;; (global-set-key (kbd "C-c c") 'pbcopy)
;; (global-set-key (kbd "C-c v") 'pbpaste)

(setq LaTeX-verbatim-environments-local '("Verbatim" "lstlisting"))

(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;---------------;
;;; Utilities ;;;
;---------------;

;; Git
;; (include-plugin "magit")
;; (require 'magit)

;; Popup
;;(include-elget-plugin "popup")
(require 'popup)

;; Websocket
;; (include-plugin "websocket")
;; (require 'websocket)

;; Request
;;(include-plugin "request")
(require 'request)

;; yasnippet
;; (require 'yasnippet-settings)

;; Auto complete
;;(require 'auto-complete-settings)
(require 'auto-complete)

;; Camelcase functions
;; (require 'camelcase-settings)

;; Helm
;; (require 'helm-settings)


;-----------;
;;; Modes ;;;
;-----------;

;; Ido mode
;; (require 'ido)
;; (ido-mode 1)

;; MuMaMo
;; (require 'mumamo-settings)

;; Markdown mode
(require 'markdown-settings)

;; Python mode 
;;(require 'python-settings)

;; ;; Python mode settings
(require 'python)

;; ;; Jedi settings
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)

;; Flycheck settings
(add-hook 'after-init-hook #'global-flycheck-mode)
;; (setq flycheck-check-syntax-automatically '(mode-enabled save))

;; LaTeX and Auctex
(require 'latex-settings)

;; SCSS Mode
;; (require 'scss-settings)

;; Matlab mode
;; (require 'matlab-settings)

;; Javascript
;; (require 'js-settings)

;; YAML mode
(require 'yaml-settings)

;; Nyancat mode!
;; (nyan-mode 0)


;---------------------------------------------------------------------
;; Put auto 'custom' changes in a separate file (this is stuff like
;; custom-set-faces and custom-set-variables)
(load 
 (setq custom-file (expand-file-name "settings/custom.el" user-emacs-directory))
 'noerror)

