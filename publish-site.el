(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;; Install dependencies
(use-package htmlize)
(use-package esxml)


;; Load Publishing Utilities
(require 'ox-publish)

(setq relative-css-location "./css/simple.css")

(org-babel-tangle-file "./stylesheets.org" (concat "./public/" relative-css-location))




(setq make-backup-files nil)


(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head (format "<link rel=\"stylesheet\" href=\"%s\" />" relative-css-location)
      )
;;      <link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />

;; Define Publishing Project
(setq org-publish-project-alist
      (list
       (list "my-org-site"
	     :recursive t
	     :base-directory "./content"
	     :publishing-directory "./public"
	     :publishing-function 'org-html-publish-to-html
	     :with-author nil
	     :with-creator t
	     :with-toc t
	     :section-numbers nil
	     :time-stamp-file nil

	     )))


;; Generate Site output
(org-publish-all t)

(message "Build Complete")
