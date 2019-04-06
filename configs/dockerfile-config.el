(eval-when-compile
  (require 'use-package))

(use-package dockerfile-mode
	      :straight (dockerfile-mode
			 :type git
			 :host github
			 :repo "spotify/dockerfile-mode")
	      :mode ("Dockerfile\\'" . dockerfile-mode)
	      )

(provide 'dockerfile-config)
