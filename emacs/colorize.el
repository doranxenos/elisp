;
; Colorizes emacs
;
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