#!/bin/sh

THEMEDIR=`dirname $0`/../themes/iterm2/

cd $THEMEDIR

for f in *; do
    THEME=$(basename "$f")
    defaults write -app iTerm 'Custom Color Presets' -dict-add "$THEME" "$(cat "$f")"
done

cd -
