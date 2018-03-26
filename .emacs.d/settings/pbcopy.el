(defun copy-from-osx ()
  "Handle copy/paste intelligently on osx."
  (let ((pbpaste (purecopy "/usr/bin/pbpaste")))
    (if (and (eq system-type 'darwin)
             (file-exists-p pbpaste))
        (let ((tramp-mode nil)
              (default-directory "~"))
          (shell-command-to-string pbpaste)))))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx
      interprogram-paste-function 'copy-from-osx)

;; (defun pbcopy ()
;;   (interactive)
;;   (call-process-region (point) (mark) "pbcopy")
;;   (setq deactivate-mark t))

;; (defun pbpaste ()
;;   (interactive)
;;   (call-process-region (point) (if mark-active (mark) (point)) "pbpaste" t t))

;; (global-set-key (kbd "C-c c") 'pbcopy)
;; (global-set-key (kbd "C-c v") 'pbpaste)

;;(defun copy-from-osx ()
;;  (shell-command-to-string "pbpaste"))
;;
;;(defun paste-to-osx (text &optional push)
;;  (let ((process-connection-type nil))
;;    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
;;      (process-send-string proc text)
;;      (process-send-eof proc))))
;;
;;(setq interprogram-cut-function 'paste-to-osx)
;;(setq interprogram-paste-function 'copy-from-osx)
