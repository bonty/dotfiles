#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set remap.app_term_commandL2optionL_except_tab 1
/bin/echo -n .
$cli set repeat.initial_wait 300
/bin/echo -n .
$cli set remap.space2shiftL_space_fnspace 1
/bin/echo -n .
$cli set remap.shiftR2optionL 1
/bin/echo -n .
$cli set repeat.consumer_initial_wait 300
/bin/echo -n .
$cli set repeat.wait 43
/bin/echo -n .
$cli set repeat.consumer_wait 50
/bin/echo -n .
$cli set private.capslock_hack_f19 1
/bin/echo -n .
$cli set remap.controlL2controlL_escape 1
/bin/echo -n .
$cli set remap.shiftL2commandL 1
/bin/echo -n .
$cli set private.control_to_option_on_apple_keyboard 1
/bin/echo -n .
/bin/echo

