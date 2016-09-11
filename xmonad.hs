import XMonad
import XMonad.Hooks.DynamicLog

main = do
    xmonad $ defaultConfig
        { borderWidth = 20
	, terminal = "urxvt"
	, modMask = mod4Mask
	, normalBorderColor = "#222244"
	, focusedBorderColor = "#333355" }
