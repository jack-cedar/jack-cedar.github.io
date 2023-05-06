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


(setq make-backup-files nil)

(setq org-html-head
      "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />
      <style>
      body {color: #fafafa; background-color: #232840;}
        .title {color: #f9f871}
        h2 {color: #d085d2}
        a {color: #31c8d5}
      </style>"

      )



(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      )
      
;; yellow #f9f871
;; Purple #d085d2
;; Light blu #31c8d5
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
