(require 'geben)

(defun flymake-php-init ()
  "Use php to check the syntax of the current file."
  (let* ((temp (flymake-init-create-temp-buffer-copy 'flymake-create-temp-inplace))
	 (local (file-relative-name temp (file-name-directory buffer-file-name))))
    (list "php" (list "-f" local "-l"))))
(add-to-list 'flymake-err-line-patterns
  '("\\(Parse\\|Fatal\\) error: +\\(.*?\\) in \\(.*?\\) on line \\([0-9]+\\)$" 3 4 nil 2))

(add-to-list 'flymake-allowed-file-name-masks '("\\.php$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.inc$" flymake-php-init))
(add-to-list 'flymake-allowed-file-name-masks '("\\.thtml$" flymake-php-init))

(add-hook 'php-mode-hook (lambda () (flymake-mode 1)))

(autoload 'php-mode "php-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.thtml$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

(defun php-debug (file &rest args)
	(interactive)
	(window-number-select 2)
	(geben)
	(window-find-file file)
	(switch-to-buffer (get-buffer-create "*php-debug output*"))
	(setenv "XDEBUG_CONFIG" "idekey=bananasAreAwesome")
	(start-process "xdebug" "*php-debug output*" "php" file)
	(setenv "XDEBUG_CONFIG" nil))