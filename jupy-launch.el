;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Functions to load ein notebooks faster

(defun jupy-launch ()
  "Prompt user for desired work directory and python environment, then launch
 jupyter notebook server in an ansi term buffer."
  
  (interactive)
  (ansi-term "/bin/bash")
  ;; (switch-to-buffer "*ansi-term*")

  (insert (concat "cd " (read-directory-name "Enter work directory: ")))
  (term-send-input)
  (insert (concat "source activate " (read-string "Enter python environment: ")))
  (term-send-input)

  (insert "jupyter notebook --no-browser")
  (term-send-input)
  (term-line-mode)
  ;; (beginning-of-buffer)

  )
(provide 'jupy-launch)

(defun ein-get-psswd-and-login ()
  "This function automates killing and yanking the jupyter server password from an ansi termnal in line-mode. 
Hacky and intended to be used only after calling jupy-launch: Notebook login will occur in default port."
  (interactive)
  (let ( (jup-buffer (get-buffer "*ansi-term*")))
    (if jup-buffer
        (progn
          (switch-to-buffer "*ansi-term*")
          (term-line-mode)
          (beginning-of-buffer)
          (search-forward "=")
          (kill-line)
          (switch-to-buffer "*scratch*")
          (ein:notebooklist-login 8888 (current-kill 0))
          (ein:notebooklist-open 8888)
          )))
  )

(provide 'ein-get-psswd-and-login)


;; (async-shell-command (concat
;;                       (concat "cd " (read-directory-name "Enter work directory: ")) "; "
;;                       (concat "source activate " (read-string "Enter python environment: ")) "; "
;;                       "jupyter notebook --no-browser") ";")

