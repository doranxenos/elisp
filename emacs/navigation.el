;
; Defines custom window navigation
;
(autoload 'window-number-meta-mode "window-number"
  "A global minor mode that enables use of the M- prefix to select
windows, use `window-number-mode' to display the window numbers in
the mode-line."
  t)

(window-number-meta-mode t)

(defun init-custom-window-layout ()
	(interactive)
	(split-window-horizontally)
	(other-window 1)
	(split-window-vertically)
	(other-window 1)
	(split-window-vertically)
	(other-window 1)
	(eshell))