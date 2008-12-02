;
; yas snippets for php-mode
;
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