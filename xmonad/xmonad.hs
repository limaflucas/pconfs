import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.Run
import XMonad.Hooks.EwmhDesktops

main = do
  xmproc <- spawnPipe "picom"
  xmonad . ewmh =<< statusBar "xmobar /home/lucas/.config/xmobar/xmobarrc.sh" myXmobarPP def myConfig

myConfig = def
  {
    modMask    = mod4Mask
  , terminal = "terminator"
  }
  `additionalKeysP`
  [
    ("M-f", spawn "firefox")
  , ("XF86MonBrightnessUp", spawn "light -A 20")
  , ("XF86MonBrightnessDown", spawn "light -U 20")
  ]

myXmobarPP :: PP
myXmobarPP = def
    { ppSep             =  magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap (blue "[") (blue "]")
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [l, ws]
    }
  where
    magenta, blue, white, yellow, red, lowWhite :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""
