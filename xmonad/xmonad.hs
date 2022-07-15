import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Loggers
import XMonad.Util.SpawnOnce

import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP

--import XMonad.Layout.LayoutModifier

main :: IO()
main = do
       xmonad
     . withSB (topXmobar <> bottomXmobar)
     . ewmhFullscreen
     . ewmh
     . docks
     $ myConfig

myConfig = def {
    modMask = mod4Mask
  , terminal = "alacritty"
  , startupHook = myStartupHook
  , layoutHook = avoidStruts(Full ||| Tall 1 (3/100) (1/2) ||| Mirror (Tall 1 (3/100) (1/2))) 
  }
  `additionalKeysP`
    [
      ("M-f", spawn "firefox")
    , ("<XF86MonBrightnessUp>",   spawn "light -A 10")
    , ("<XF86MonBrightnessDown>", spawn "light -U 10")
    , ("<XF86AudioRaiseVolume>",  spawn "pactl set-sink-volume @DEFAULT_SINK@ +5%")
    , ("<XF86AudioLowerVolume>",  spawn "pactl set-sink-volume @DEFAULT_SINK@ -5%")
    , ("<XF86AudioMute>",         spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
    ]

topXmobar    = statusBarPropTo "_XMONAD_LOG_TOP"    "xmobar ~/.config/xmobar/top.xmobarrc"    (pure topXmobarPP)
bottomXmobar = statusBarPropTo "_XMONAD_LOG_BOTTOM" "xmobar ~/.config/xmobar/bottom.xmobarrc" (pure bottomXmobarPP)

bottomXmobarPP :: PP
bottomXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 20

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""

topXmobarPP :: PP
topXmobarPP = def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = wrap " " "" . xmobarBorder "Top" "#8be9fd" 2
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 20

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#ff79c6" ""
    blue     = xmobarColor "#bd93f9" ""
    white    = xmobarColor "#f8f8f2" ""
    yellow   = xmobarColor "#f1fa8c" ""
    red      = xmobarColor "#ff5555" ""
    lowWhite = xmobarColor "#bbbbbb" ""

myStartupHook :: X ()
myStartupHook = do
      spawnOnce "picom --vsync -b"
      spawnOnce "alacritty" 
      spawnOnce "firefox"
      spawnOnce "mailspring"