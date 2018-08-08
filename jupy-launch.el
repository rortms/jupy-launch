(defun jupy-launch (work-folder py-env)
  (interactive "sEnter working directory: \nsEnter python environment: ")
  (let ( (launch-command (concat
                          "cd " work-folder         "&&"
                          "source activate " py-env "&&"
                          "jupyter notebook --no-browser"))) ;end varlist
    (ansi-term "/bin/bash")
    (switch-to-buffer "*ansi-term*")
    (end-of-buffer)
    (insert launch-command)
    (term-send-input)) ;; end let
  )

(provide 'jupy-launch)

