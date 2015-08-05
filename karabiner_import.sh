#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set remap.jis_commandL2commandL_eisuu 1
/bin/echo -n .
$cli set repeat.wait 43
/bin/echo -n .
$cli set repeat.initial_wait 100
/bin/echo -n .
$cli set remap.jis_eisuu2optionL_eisuu_term 1
/bin/echo -n .
$cli set remap.jis_commandR2commandR_toggle_kana_eisuu 1
/bin/echo -n .
$cli set remap.jis_jansi 1
/bin/echo -n .
$cli set remap.fn2commandL 1
/bin/echo -n .
/bin/echo
