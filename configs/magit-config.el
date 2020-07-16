(eval-when-compile
  (require 'use-package))

(use-package magit
  :straight t
  :bind
  ("C-x g" . magit-status)
  ("C-c g" . magit-dispatch)
  ("C-c f g" . magit-file-dispatch)
  )

(use-package forge
  :straight t
  :after magit
  :preface
  (progn
    (defun my-ls-pullreqs-created-my-me (repo)
      (mapcar (lambda (row)
                (closql--remake-instance 'forge-pullreq (forge-db) row))
              (forge-sql
               [:select $i1 :from pullreq
                        :where (and (= pullreq:repository $s2)
                                    (= pullreq:author     $s3)
                                    (isnull pullreq:closed))
                        :order-by [(desc updated)]]
               (vconcat (closql--table-columns (forge-db) 'pullreq t))
               (oref repo id)
               (ghub--username repo))))
    (defun my-insert-pullreqs-created-my-me ()
      "Insert a list of open pull-requests that are created by you."
      (when-let ((repo (forge-get-repository nil)))
        (unless (oref repo sparse-p)
          (forge-insert-topics "My pull requests"
                               (my-ls-pullreqs-created-my-me repo)
                               (forge--topic-type-prefix repo 'pullreq)))))

    )
  :config
  (when forge--sqlite-available-p
    (progn
      (magit-add-section-hook 'magit-status-sections-hook 'my-insert-pullreqs-created-my-me 'forge-insert-pullreqs nil))
    )
  (transient-append-suffix 'forge-dispatch '(0)
    ["Edit"
     ("e l" "edit label"    forge-edit-topic-labels)])
  )

(provide 'magit-config)
