#!/bin/sh

# symlink to library
PRIVATE_XML=`dirname $0`/../files/karabiner/private.xml  
ls -sfv ${PRIVATE_XML} /Library/Application\ Support/Karabiner

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set repeat.initial_wait 300
/bin/echo -n .
$cli set repeat.consumer_wait 50
/bin/echo -n .
$cli set private.emacsmode_commandY 1
/bin/echo -n .
$cli set remap.app_term_commandL2optionL_except_tab 1
/bin/echo -n .
$cli set remap.space2shiftL_space_fnspace 1
/bin/echo -n .
$cli set repeat.consumer_initial_wait 300
/bin/echo -n .
$cli set private.emacsmode_commandLtGt 1
/bin/echo -n .
$cli set repeat.wait 43
/bin/echo -n .
$cli set private.emacsmode_commandHT 1
/bin/echo -n .
$cli set private.control_to_option_on_apple_keyboard 1
/bin/echo -n .
$cli set private.emacsmode_controlDHTN 1
/bin/echo -n .
$cli set private.capslock_hack_f19 1
/bin/echo -n .
$cli set private.emacsmode_controlAE 1
/bin/echo -n .
$cli set private.emacsmode_controlS 1
/bin/echo -n .
$cli set private.emacsmode_controlB 1
/bin/echo -n .
$cli set private.emacsmode_controlSlash 1
/bin/echo -n .
$cli set private.emacsmode_controlI 1
/bin/echo -n .
$cli set private.emacsmode_controlP 1
/bin/echo -n .
$cli set private.emacsmode_controlK 1
/bin/echo -n .
$cli set private.emacsmode_controlW 1
/bin/echo -n .
$cli set private.emacsmode_controlF 1
/bin/echo -n .
$cli set private.emacsmode_commandF 1
/bin/echo -n .
$cli set private.emacsmode_commandDN 1
/bin/echo -n .
$cli set private.emacsmode_controlY 1
/bin/echo -n .
/bin/echo
