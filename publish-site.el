()

(setq-default load-prefer-newer t)
(setq package-user-dir (expand-file-name "./.packages"))
(package-initialize)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
(package-refresh-contents)
(package-install 'htmlize)
(add-to-list 'load-path package-user-dir)


(require 'org)
(require 'ox-publish)
(require 'htmlize)

(setq relative-css-location "./css/basic.css")
(set-face-attribute 'mode-line-active nil :inherit 'mode-line)
(org-babel-tangle-file "./stylesheets.org")

;;(setq org-html-htmlize-output-type 'css)

(setq make-backup-files nil)


(setq 
      org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head (format "<link rel=\"stylesheet\" href=\"%s\" />" relative-css-location)
      org-html-htmlize-output-type 'css)

;; Define Publishing Project
(setq org-publish-project-alist
      (list
       (list "my-org-site"
	     :recursive t
	     :base-directory "./content"
	     :publishing-directory "./public"
	     :publishing-function 'org-html-publish-to-html
	     :html-doctype "html5"
	     :html-head-include-default-style nil
	     :html-head-include-scripts nil
	     :with-author nil
	     :with-creator t
	     :with-toc t
	     :html-html5-fancy t
	    
	     :section-numbers nil
	     :time-stamp-file nil

	     )))


;; Generate Site output
(org-publish-all t)

(message "Build Complete")
