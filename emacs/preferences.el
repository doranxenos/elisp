;
; Sets general preferences about emacs
;

; No silly toolbar
(tool-bar-mode nil)

; No silly menubar
(menu-bar-mode nil)

; Set tab width to 2
(setq default-tab-width 2)
(setq tab-width 2)
(setq c-basic-indent 2)
(setq indent-tabs-mode t)

(show-paren-mode t)
(column-number-mode t)

; Handle .gz files
(auto-compression-mode t)

; Set font to reasonable size
(set-face-font 'default "fixed")

(transient-mark-mode t)
(delete-selection-mode t)

; No scrollbar
(scroll-bar-mode nil)

; No beeping
(setq visible-bell t)

; No startup screen
(setq inhibit-startup-message t)

; Better buffer switching
(require 'swbuff)
(iswitchb-mode 1)

; Include flymake
(require 'flymake)

; Include yas snippets since they are awesome
(require 'yasnippet-bundle)

; Don't make backup files
(setq make-backup-files nil)

; Make *scratch* not have any text in it
(custom-set-variables
 '(initial-scratch-message ""))
