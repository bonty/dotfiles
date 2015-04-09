tell application "Xcode" to activate
tell application "System Events"
    tell process "Xcode"
        key code 15 using {command down}
    end tell
end tell