(eval-when-compile
  (require 'use-package))

(defun my-flymd-browser-function (url)
  (let ((process-environment (browse-url-process-environment)))
    (apply 'start-process
           (concat "firefox " url)
           nil
           "/usr/bin/open"
           (list "-a" "firefox" url))))

(use-package flymd
  :straight t
  :init
  (setq flymd-browser-open-function 'my-flymd-browser-function))

(use-package markdown-mode
  :straight t)

(provide 'md-config)
