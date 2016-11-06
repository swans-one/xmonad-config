import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import System.IO


main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/erik/.xmobarrc"
  xmonad $ defaultConfig
    { borderWidth = 3
    , terminal = "urxvt"
    , modMask = mod4Mask
    , normalBorderColor = "#111111"
    , focusedBorderColor = "#444488"
    , manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ layoutHook defaultConfig
    , logHook = dynamicLogWithPP defaultPP
                { ppOutput = hPutStrLn xmproc
                }
    }
