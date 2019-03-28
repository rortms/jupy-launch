;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Functions to load ein notebooks faster

(defun jupy-launch ()
  "Prompt user for desired work directory and python environment, then launch
 jupyter notebook server in an ansi term buffer."
  
  (interactive)
  (let ( (curr-buff (current-buffer)) )
    
    (ansi-term "/bin/bash" "jupyter-server-buffer")

    ;; Enter work directory
    (comint-send-string "*jupyter-server-buffer*"
                        (concat "cd " (read-directory-name "Enter work directory: ")))
    (term-send-input)

    ;; Enter python environment
    (comint-send-string "*jupyter-server-buffer*"
                        (concat "source activate " (read-string "Enter python environment: ")))
    (term-send-input)

    ;; Launch jupyter server
    (comint-send-string "*jupyter-server-buffer*"
                        "jupyter notebook --no-browser")
    (term-send-input)

    (switch-to-buffer curr-buff)

    )

  )

(provide 'jupy-launch)

;; (provide 'ein-get-psswd-and-login)

