(add-to-list 'load-path "~/elisp")
(add-to-list 'load-path "~/elisp/geben")
(add-to-list 'load-path "~/elisp/conf")

(require 'yasnippet-bundle)

; Colorize emacs
(set-background-color "gray16")
(set-foreground-color "white")
(set-cursor-color "red")
(set-face-foreground 'mode-line-buffer-id "red")
(set-face-background 'region "white")
(set-face-foreground 'region "black")
(copy-face 'font-lock-comment-face 'font-lock-doc-string-face)
(set-face-foreground 'font-lock-comment-face "green2")
(set-face-foreground 'font-lock-string-face "MediumOrchid")
(set-face-foreground 'font-lock-builtin-face "SlateBlue1")
(set-face-foreground 'font-lock-function-name-face "SlateBlue2")

;; Set colors of flymake error and warning lines
(add-hook 'flymake-mode-hook
          (lambda()
            (set-face-background 'flymake-errline "firebrick")
						(set-face-foreground 'flymake-errline "white")
            (set-face-background 'flymake-warnline "yellow4")
            ))

;; No toolbar
(tool-bar-mode nil)

; Set tab width to 2
(setq default-tab-width 2)
(setq tab-width 2)
(setq c-basic-indent 2)
(setq indent-tabs-mode t)

(show-paren-mode t)
(column-number-mode t)

; Handle .gz files
(auto-compression-mode t)

(add-to-list 'same-window-buffer-names "*grep*")

;; Set font to reasonable size
(set-face-font 'default "fixed")

(transient-mark-mode t)
(delete-selection-mode t)

(require 'flymake)

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(autoload 'css-mode "css-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))

(autoload 'ruby-mode "ruby-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(require 'ruby-electric)

;; No scrollbar
(scroll-bar-mode nil)

;; No beeping
(setq visible-bell t)

;; No startup screen
(setq inhibit-startup-message t)

;; Better buffer switching
(require 'swbuff)
(iswitchb-mode 1)

; Don't make backup files
(setq make-backup-files nil)

(autoload 'window-number-meta-mode "window-number"
  "A global minor mode that enables use of the M- prefix to select
windows, use `window-number-mode' to display the window numbers in
the mode-line."
  t)

(window-number-meta-mode t)

(defun focus-next-window () (interactive) (other-window 1))
(defun focus-prev-window () (interactive) (other-window -1))

(defun custom-pop-to-buffer (buf) 
	(interactive)
	(if (equal (window-number) 1) (funcall (lambda nil (window-number-select 2) (switch-to-buffer buf)))
		(funcall (lambda nil (window-number-select 1) (switch-to-buffer buf)))))

(defun window-find-file (file-to-load &optional win-number)
	(interactive)
	(if win-number (window-number-select win-number) 
		(window-number-select 1))
	(find-file file-to-load))

(defun init-custom-window-layout ()
	(interactive)
	(split-window-horizontally)
	(other-window 1)
	(split-window-vertically)
	(other-window 1)
	(split-window-vertically)
	(other-window 1)
	(eshell))

(defun goto-eshell ()
	(interactive)
	(window-number-select 4))

(defun goto-main-window ()
	(interactive)
	(window-number-select 1))

(defun window-grep (regexp &optional files dir)
	(interactive)
	(window-number-select 3)
	(if (not files) (set 'files "./*"))
	(if (not dir) (set 'dir "./"))
	(lgrep regexp files dir))

;; ;; Custom keybindings
(global-set-key [(control z)] nil) ; Undo minimize
(global-set-key [(control x) (p)] 'focus-prev-window)
(global-set-key [(control x) (o)] 'focus-next-window)
(global-set-key [(control x) (z)] 'goto-main-window)
(global-set-key [(control x) (control z)] 'goto-main-window)
(global-set-key [(control x) (m)] 'goto-eshell)
(global-set-key [(control x) (control m)] 'goto-eshell)

(load-file "~/elisp/conf/php.el")