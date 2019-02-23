;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Functions to load ein notebooks faster

(defun jupy-launch ()
  "Prompt user for desired work directory and python environment, then launch
 jupyter notebook server in an ansi term buffer."
  
  (interactive)
  (ansi-term "/bin/bash")

  (insert (concat "cd " (read-directory-name "Enter work directory: ")))
  (term-send-input)
  (insert (concat "source activate " (read-string "Enter python environment: ")))
  (term-send-input)

  (insert "jupyter notebook --no-browser")
  (term-send-input)
  (term-line-mode)
  )
(provide 'jupy-launch)

(defun ein-get-psswd-and-login ()
  "This function automates killing and yanking the jupyter server password from an ansi terminal. 
Hacky and intended to be used only after calling jupy-launch: Notebook login will occur in default port."
  (interactive)
  (let ( (jup-buffer (get-buffer "*ansi-term*")))
    (if jup-buffer
        (progn
          (switch-to-buffer "*ansi-term*")
          (term-char-mode)
          (beginning-of-buffer)
          (search-forward "=")
          (kill-line)
          (end-of-buffer)          
          (switch-to-buffer "*scratch*")
          (ein:notebooklist-login 8888 (current-kill 0))
          (ein:notebooklist-open 8888)
          
          ;; disable "next-input-history" command, is deleting cells          
          (define-key ein:notebook-mode-map (kbd "M-n") nil)
          
          )))
  )

(provide 'ein-get-psswd-and-login)


;; (async-shell-command (concat
;;                       (concat "cd " (read-directory-name "Enter work directory: ")) "; "
;;                       (concat "source activate " (read-string "Enter python environment: ")) "; "
;;                       "jupyter notebook --no-browser") ";")

