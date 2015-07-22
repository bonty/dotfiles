#!/bin/sh

# symlink to library
PRIVATE_XML=`dirname $0`/../files/karabiner/private.xml  
ls -sfv ${PRIVATE_XML} /Library/Application\ Support/Karabiner

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set option.emacsmode_controlS 1
/bin/echo -n .
$cli set repeat.consumer_wait 50
/bin/echo -n .
$cli set remap.app_term_commandL2optionL_except_tab 1
/bin/echo -n .
$cli set remap.space2shiftL_space_fnspace 1
/bin/echo -n .
$cli set repeat.consumer_initial_wait 300
/bin/echo -n .
$cli set option.emacsmode_controlAE 1
/bin/echo -n .
$cli set repeat.wait 43
/bin/echo -n .
$cli set option.emacsmode_controlW 1
/bin/echo -n .
$cli set option.emacsmode_controlSlash 1
/bin/echo -n .
$cli set private.control_to_option_on_apple_keyboard 1
/bin/echo -n .
$cli set private.emacsmode_commandLtGt 1
/bin/echo -n .
$cli set private.capslock_hack_f19 1
/bin/echo -n .
$cli set option.emacsmode_controlV 1
/bin/echo -n .
$cli set option.emacsmode_ex_commandW 1
/bin/echo -n .
$cli set option.emacsmode_controlLeftbracket 1
/bin/echo -n .
$cli set option.emacsmode_controlY 1
/bin/echo -n .
$cli set option.emacsmode_commandV 1
/bin/echo -n .
$cli set remap.controlJ2enter 1
/bin/echo -n .
$cli set option.emacsmode_controlI 1
/bin/echo -n .
$cli set repeat.initial_wait 300
/bin/echo -n .
/bin/echo
