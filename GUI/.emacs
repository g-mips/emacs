;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; THIS SECTION SHOULD ALWAYS BE FIRST ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives
	'(("gnu" . "http://elpa.gnu.org/packages/")
	  ("melpa" . "http://melpa.org/packages/")
	  ("marmalade" . "http://marmalade-repo.org/packages/")))
  (package-initialize))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-alist nil)
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes
   (quote
    ("90e4b4a339776e635a78d398118cb782c87810cb384f1d1223da82b612338046" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(display-time-mode t)
 '(elscreen-display-screen-number nil)
 '(global-hl-line-mode 1)
 '(global-linum-mode t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (1)))
 '(package-selected-packages
   (quote
    (magit js3-mode elscreen yasnippet sml-mode smart-mode-line-powerline-theme clues-theme auto-complete)))
 '(scroll-bar-mode nil)
 '(scroll-conservatively 101)
 '(tool-bar-mode nil)
 '(undo-limit 20000000)
 '(undo-strong-limit 40000000)
 '(visible-cursor t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elscreen-tab-control-face ((t (:background "#110B14" :foreground "#C0E9F6"))))
 '(elscreen-tab-current-screen-face ((t (:background "#110B14" :foreground "#C0E9F6"))))
 '(elscreen-tab-other-screen-face ((t (:foreground "#90A0A0" :slant italic))))
 '(highlight ((t (:background "midnight blue" :foreground nil :bold t)))))

(load-theme 'clues)

(global-set-key (kbd "C-x g") 'magit-status)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Requires ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; ido ;;;;
(require 'ido)
(ido-mode t)

;;;; sml ;;;;
(if (not (package-installed-p 'smart-mode-line))
    (package-install 'smart-mode-line))
(if (not (package-installed-p 'smart-mode-line-powerline-theme))
    (package-install 'smart-mode-line-powerline-theme))
(require 'smart-mode-line-powerline-theme)
(sml/setup)

;;;; auto-complete ;;;;
(if (not (package-installed-p 'auto-complete))
    (package-install 'auto-complete))	  
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;;;; yasnippet ;;;;
(if (not (package-installed-p 'yasnippet))
    (package-install 'yasnippet))
(require 'yasnippet)
(yas-global-mode 1)

;; (require 'compile)
;; (require 'cc-mode)
;;(require 'flymake-jslint)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Hooks ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (add-hook 'js-mode-hook 'js2-minor-mode)
;; (add-hook 'js2-mode-hook 'ac-js2-mode)
(autoload 'js3-mode "js3" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
'(js3-auto-indent-p t)         ; it's nice for commas to right themselves.
'(js3-enter-indents-newline t) ; don't need to push tab before typing
'(js3-indent-on-enter-key t)   ; fix indenting before moving on
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;;(add-hook 'js2-mode-hook 'flymake-jslint-load)
;;(add-hook 'js2-mode-hook 'ac-js2-mode)
;; (add-hook 'css-mode-hook 'skewer-css-mode)
;; (add-hook 'html-mode-hook 'skewer-html-mode)

;;;; emacs-startup-hook ;;;;
(add-hook 'emacs-startup-hook 'elscreen-start)

;;;; window-setup-hook ;;;;
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(define-key global-map (kbd "M-RET") 'toggle-frame-fullscreen)

;;;; after-init-hook ;;;;
;;(add-hook 'after-init-hook #'global-flycheck-mode)

;; (defun swap-delete-keys ()
;;  (global-unset-key (kbd "C-DEL"))
;;  (global-unset-key (kbd "M-^")))
  ;;(global-set-key (kbd "C-DEL") 'delete-indentation))
  ;;(global-set-key (kbd "M-^") 'backward-kill-word))
;; (add-hook 'window-setup-hook 'swap-delete-keys)

(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook
	     (lambda ()
	       (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

(eval-after-load 'json-mode
  '(add-hook 'json-mode-hook
	     (lambda ()
	       (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

(eval-after-load 'sgml-mode
  '(add-hook 'html-mode-hook
	     (lambda ()
	       (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))

(eval-after-load 'css-mode
  '(add-hook 'css-mode-hook
	     (lambda ()
	       (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))

;; Such a high undo limit will make it highly impossible to lose information

;; TODO(GRANT): Figure out how to manage these guys
;; (setq todo-file "./todo.txt")
;; (setq log-file "./log.txt")

;;(defun load-todo ()
;;  (interactive)
;;  (find-file todo-file))
;;(define-key global-map "\et" 'load-todo)

;;(defun load-log ()
;;  (interactive)
;;  (find-file log-file)
;;  (if (boundp 'longlines-mode) ()
;;    (longlines-mode 1)
;;    (longlines-show-hard-newlines))
;;  (if (equal longlines-mode t) ()
;;    (longlines-mode 1)
;;    (longlines-show-hard-newlines))
;;  (end-of-buffer)
;;  (newline-and-indent)
;;  (insert-timeofday)
;;  (newline-and-indent)
;;  (newline-and-indent)
;;  (end-of-buffer))
;;(define-key global-map (kbd "M-T") 'load-log)

;;(define-key global-map (kbd "M-p") 'quick-calc)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; COMPILING ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq compilation-directory-locked nil)

;;(defun find-project-directory-recursive ()
  "Recursively search for a makefile."
  ;;(interactive)
;;  (if (file-exists-p "build.bat") t
;;      (cd "../")
;;      (find-project-directory-recursive)))

;;(defun lock-compilation-directory ()
;;  "The compilation process should NOT hunt for a makefile"
;;  (interactive)
;;  (setq compilation-directory-locked t)
;;  (message "Compilation directory is locked."))

;;(defun unlock-compilation-directory ()
;;  "The compilation process SHOULD hunt for a makefile"
;;  (interactive)
;;  (setq compilation-directory-locked nil)
;;  (message "Compilation directory is roaming."))

;;(defun find-project-directory ()
;;  "Find the project directory."
;;  (interactive)
;;  (setq find-project-from-directory default-directory)
;;  (switch-to-buffer-other-window "*compilation*")
;;  (if compilation-directory-locked (cd last-compilation-directory)
;;  (cd find-project-from-directory)
;;  (find-project-directory-recursive)
;;  (setq last-compilation-directory default-directory)))

;; Make the current build
;;(defun make-without-asking ()
;;  "Make the current build."
;;  (interactive)
;;  (if (find-project-directory) (compile "build.bat"))
;;  (other-window 1))
;;(define-key global-map (kbd "M-m") 'make-without-asking)

;; Window Commands
;;(defun w32-restore-frame ()
;;  "Restore a minimized frame"
;;  (interactive)
;;  (w32-send-sys-command 61728))

;;(defun maximize-frame ()
;;  "Maximize the current frame"
;;  (interactive)
;;  (w32-send-sys-command 61488))

;; Bright-red TODOs
(setq fixme-modes '(c++-mode c-mode emacs-lisp-mode python-mode lua-mode))
(make-face 'font-lock-fixme-face)
(make-face 'font-lock-study-face)
(make-face 'font-lock-important-face)
(make-face 'font-lock-note-face)
(mapc (lambda (mode)
	(font-lock-add-keywords
	 mode
	 '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
	   ("\\<\\(STUDY\\)" 1 'font-lock-study-face t)
	   ("\\<\\(IMPORTANT\\)" 1 'font-lock-important-face t)
	   ("\\<\\(NOTE\\)" 1 'font-lock-note-face t))))
      fixme-modes)
(modify-face 'font-lock-fixme-face "Red" nil nil t nil t nil nil)
(modify-face 'font-lock-study-face "Yellow" nil nil t nil t nil nil)
(modify-face 'font-lock-important-face "Yellow" nil nil t nil t nil nil)
(modify-face 'font-lock-note-face "Dark Green" nil nil t nil t nil nil)

;;(load-library "view")


;;(setq python-shell-interpreter "C:\\Program Files\\Anaconda3\\python.exe"
;;      python-shell-interpreter-args
;;      "-i C:\\Program Files\\Anaconda3\\Scripts\\ipython-script.py")


(setenv "GIT_ASKPASS" "git-gui--askpass")

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(message "Deleting old backup files...")
(let ((week (* 60 60 24 7))
      (current (float-time (current-time))))
  (dolist (file (directory-files temporary-file-directory t))
    (when (and (backup-file-name-p file)
               (> (- current (float-time (fifth (file-attributes file))))
                  week))
      (message "%s" file)
      (delete-file file))))
