-- import Xmobar

-- config :: Config
-- config = defaultConfig {  
--     overrideRedirect = False
--   , allDesktops = True
--   , lowerOnStart = True
--   , pickBroadest = False
--   , persistent = False
--   , hideOnStart = False
--   , font     = "xft:SourceCodePro:size=10:antialias=true"
--   , bgColor  = "#5f5f5f"
--   , fgColor  = "#ffffff"
--   , position = TopH 25
--   , alpha = 255
--   , commands = [
--     Run $ Battery
--       [ "-t" , "<acstatus>"
--       ,"--"
--       , "-o", "<left>%(<timeleft>)"
--       , "-O", "Charging(<left>%)"
--       , "-i", "Charged(<left>%)"
--       ] 36000
--     , Run $ Cpu [ "-t", "CPU <total>%"] 300
--     , Run $ Memory ["--template", "RAM <usedratio>%"] 300
--     , Run $ Swap ["--template", "SWAP <usedratio>%"] 300
--     , Run $ Date "%A, %d %B %H:%M:%S" "date" 10
--     , Run $ Kbd []
--     , Run $ WeatherX "SBSP"
--       [
--       --   ("clear", sunny)
--       -- , ("sunny", sunny)
--       -- , ("mostly clear", haze)
--       -- , ("mostly sunny", haze)
--       -- , ("partly sunny", cloudy)
--       -- , ("fair", fair)
--       -- , ("cloudy", overcast)
--       -- , ("overcast", overcast)
--       -- , ("partly cloudy", cloudy)
--       -- , ("mostly cloudy", rain)
--       -- , ("considerable cloudiness", rain)
--       ]
--       ["-t", "<tempC>º<skyConditionS>"] 10
--     --, Run $ XMonadLog
--     ]
--   , sepChar  = "%"
--   , alignSep = "}{"
--   , template = "}%date% %SBSP%{%battery% %kbd% [%cpu% %memory% %swap%]"
--   }
--   -- where
--   --   sunny = "<icon=/home/lucas/.config/xmobar/icons/sun.xpm/>"
--   --   haze = "<icon=/home/lucas/.config/xmobar/icons/haze.xpm/>"
--   --   cloudy = "<icon=/home/lucas/.config/xmobar/icons/cloudy_day.xpm/>"
--   --   fair = "<icon=/home/lucas/.config/xmobar/icons/fair.xpm/>"
--   --   overcast = "<icon=/home/lucas/.config/xmobar/icons/overcast.xpm/>"
--   --   rain = "<icon=/home/lucas/.config/xmobar/icons/rain.xpm/>"

-- main :: IO()
-- main = xmobar config



import Xmobar
import Config
import Monitors

-- Example user-defined plugin

data HelloWorld = HelloWorld
    deriving (Read, Show)

instance Exec HelloWorld where
    alias HelloWorld = "hw"
    run   HelloWorld = return "<fc=red>Hello World!!</fc>"

-- Configuration, using predefined monitors as well as our HelloWorld
-- plugin:

config :: Config
config = defaultConfig {
  font = "xft:Sans Mono-9"
  , additionalFonts = []
  , borderColor = "black"
  , border = TopB
  , bgColor = "black"
  , fgColor = "grey"
  , alpha = 255
  , position = Top
  , textOffset = -1
  , iconOffset = -1
  , lowerOnStart = True
  , pickBroadest = False
  , persistent = False
  , hideOnStart = False
  , iconRoot = "."
  , allDesktops = True
  , overrideRedirect = True
--  , textOutputFormat = Ansi
  , commands = [ Run $ Weather "EGPH" ["-t","<station>: <tempC>C",
                                        "-L","18","-H","25",
                                        "--normal","green",
                                        "--high","red",
                                        "--low","lightblue"] 36000
               , Run $ Network "eth0" ["-L","0","-H","32",
                                        "--normal","green","--high","red"] 10
               , Run $ Network "eth1" ["-L","0","-H","32",
                                        "--normal","green","--high","red"] 10
               , Run $ Cpu ["-L","3","-H","50",
                             "--normal","green","--high","red"] 10
               , Run $ Memory ["-t","Mem: <usedratio>%"] 10
               , Run $ Swap [] 10
               , Run $ Com "uname" ["-s","-r"] "" 36000
               , Run $ Date "%a %b %_d %Y %H:%M:%S" "date" 10
              , Run HelloWorld
              ]
  , sepChar = "%"
  , alignSep = "}{"
  , template = "%cpu% | %memory% * %swap% | %eth0% - %eth1% }\
               \ %hw% { <fc=#ee9a00>%date%</fc>| %EGPH% | %uname%"
}

main :: IO ()
  main = xmobar config
--  main = config >>= xmobar
