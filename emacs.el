; Load all paths
(add-to-list 'load-path "~/elisp/emacs")
(add-to-list 'load-path "~/elisp/php")
(add-to-list 'load-path "~/elisp/js")
(add-to-list 'load-path "~/elisp/ruby")
(add-to-list 'load-path "~/elisp/css")

; Load all of our section specific config file
(load-file "~/elisp/emacs/colorize.el")
(load-file "~/elisp/emacs/preferences.el")
(load-file "~/elisp/emacs/navigation.el")
(load-file "~/elisp/emacs/bindings.el")

; Load PHP specific
(load-file "~/elisp/php/emacs.php.el")
(load-file "~/elisp/php/yas.php.el")

; Load JS specific
(load-file "~/elisp/js/emacs.js.el")

; Load Ruby specific
(load-file "~/elisp/ruby/emacs.ruby.el")

; Load CSS specific
(load-file "~/elisp/css/emacs.css.el")

