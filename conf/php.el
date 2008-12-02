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

;; php-mode yas snippets
(yas/define-snippets 'php-mode
	'(
("<?" "<?php

$0

?>" "php")

("class" "class ${1:className} {

    public function $1( ${2:arguments} ) {
        $0
    }

}" "class")

("fu" "function ${1:functionName}( ${2:arguments} ) {
    $0

}" "function")

("pubf" "public function ${1:functionName}( ${2:arguments} ) {
    $0

}" "public function")

("privf" "private function ${1:functionName}( ${2:arguments} ) {
    $0
}" "private function")

("protf" "protected function ${1:functionName}( ${2:arguments} ) {
    $0
}" "protected function")

("foreach" "foreach( ${1:\\$array} as \$${2:key} => \$${3:value} ) {
    $0
}" "foreach")

("for" "for( ${1:\\$i=0}, ${2:\\$il=}${3:10}; ${4:\\$i<\\$il}; ${5:\\$i++} ) {
    $0
}" "for")

("testcase" "<?php
require_once 'PHPUnit/Framework.php';

class ${1:Unit}Test extends PHPUnit_Framework_TestCase {

    public function test${2:FunctionName}() {
        $0
    }

}

?>" "PHPUnit TestCase Skeleton")

("testfunc" "public function test${1:FunctionName}() {
    $0
}" "PHPUnit Test Function")
		))