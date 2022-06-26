Config {
    overrideRedirect = False
  , font = "xft:iosevka-11:antialiasing=true"
  , bgColor = "#000"
  , fgColor = "#fff"
  , position = TopH 30
  , sepChar = "%"
  , alignSep = "}{"
  , template = " %XMonadLog% } %date% %SBSP% {%battery% %kbd% "
  , commands = [
        Run XMonadLog
      , Run Battery [
          "-t" , "<acstatus>"
          ,"--"
          , "-o", "<fc=#ff4d4d><left>% (<timeleft>)</fc>"
          , "-O", "<fc=#66ff66><left>%</fc>"
          , "-i", "<fc=#66ff66><left>%</fc>"
          ] 600
      , Run Date "%A, %d %B %H:%M" "date" 100
      , Run Kbd []
      , Run WeatherX "SBSP" [
            ("clear", "<icon=/home/lucas/.config/xmobar/icons/sun.xpm/>")
          , ("sunny", "<icon=/home/lucas/.config/xmobar/icons/sun.xpm/>")
          , ("mostly clear", "<icon=/home/lucas/.config/xmobar/icons/haze.xpm/>")
          , ("mostly sunny", "<icon=/home/lucas/.config/xmobar/icons/haze.xpm/>")
          , ("partly sunny", "<icon=/home/lucas/.config/xmobar/icons/clobudy_day.xpm/>")
          , ("fair", "<icon=/home/lucas/.config/xmobar/icons/fair.xpm/>")
          , ("cloudy", "<icon=/home/lucas/.config/xmobar/icons/overcast.xpm/>")
          , ("overcast", "<icon=/home/lucas/.config/xmobar/icons/overcast.xpm/>")
          , ("partly cloudy", "<icon=/home/lucas/.config/xmobar/icons/clobudy_day.xpm/>")
          , ("mostly cloudy", "<icon=/home/lucas/.config/xmobar/icons/rain.xpm/>")
          , ("considerable cloudiness", "<icon=/home/lucas/.config/xmobar/icons/rain.xpm/>")
          ] [
            "-t"
          , "<tempC>º <skyConditionS>"
          ] 36000
      ]
  }
