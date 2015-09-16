import qualified Data.Map as M

import Control.Applicative

import XMonad.Hooks.ManageDocks
import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.MouseResizableTile
import XMonad.Layout.NoBorders
import qualified XMonad.Layout.Glass as Glass
import XMonad.Layout.Circle
import XMonad.Layout.ToggleLayouts
import qualified XMonad.StackSet as W

spawn' = spawn . ("/home/pallly/bin/" ++)

toggleStrutsKey XConfig{XMonad.modMask = modMask} = (modMask, xK_b)

myKeys conf@(XConfig{modMask = modm}) = M.fromList
  [ ((modm, xK_z), sendMessage ExpandSlave)
  , ((modm, xK_a), sendMessage ShrinkSlave)

  , ((modm .|. shiftMask, xK_space), sendMessage ToggleLayout)

  , ((modm, xK_Control_L), spawn' "keyboard_layout_switch.bash")

  , ((modm, xK_F2),  spawn "sudo backlight -")
  , ((modm, xK_F3),  spawn "sudo backlight +")

  , ((modm, xK_F9),  spawn "pactl set-sink-volume 0 -5%")
  , ((modm, xK_F10), spawn "pactl set-sink-volume 0 +5%")
  , ((modm, xK_F11), spawn "pulseaudio-ctl mute")

  , ((modm, xK_m),   windows W.focusMaster)

  , ((modm, xK_q),   restart "xmonad" True)

  , ((modm, xK_s), spawn "screenshot")
  , ((modm .|. shiftMask, xK_s), spawn "select-screenshot")

  , ((modm, xK_i), invert)

  , ((modm, xK_g), sendMessage Glass.Toggle)
  , ((modm .|. shiftMask, xK_g), sendMessage Glass.ToggleFullscreen)
  , ((modm, xK_k), sendMessage Glass.FocusUp)
  , ((modm, xK_j), sendMessage Glass.FocusDown)

  , ((modm, xK_c), kill)
  ]

myResizableTall = mouseResizableTile{ masterFrac    = 2/3
                                    , fracIncrement = 1/100
                                    , draggerType   = BordersDragger
                                    }

myConfig = ewmh defaultConfig
  { terminal    = "urxvt"
  , workspaces  = map show [1..6]
  , modMask     = mod4Mask
  , borderWidth = 3

  , manageHook =
      composeAll
        [ appName =? "display" --> doFloat
        , Glass.glassManageHook "kbd-reminder"
        , manageHook defaultConfig
        ]

  , layoutHook = avoidStruts
               $ Glass.glassLayout ( "/home/pallly/.cabal/bin/kbd-reminder"
                                  ++ "  /home/pallly/.kbdReminder-sk-erb.png")
                   "kbd-reminder"
               $ toggleLayouts
                   (noBorders Full)
                   ( myResizableTall
                 ||| Circle
                   )

  , logHook         = dynamicLog
  , handleEventHook = handleEventHook defaultConfig <+> fullscreenEventHook
  , focusedBorderColor = "darkgreen"

  , keys = \x -> myKeys x `M.union` keys defaultConfig x
  }

main = xmonad =<< statusBar "xmobar" xmobarPP toggleStrutsKey myConfig

atom_WM_INVERSE_COLORS :: X Atom
atom_WM_INVERSE_COLORS = getAtom "WM_INVERSE_COLORS"

invert :: X ()
invert = do
 withDisplay $ \dpy -> do
  focusedWin <- W.peek . windowset <$> get
  case focusedWin of
    Just w -> do
      a <- atom_WM_INVERSE_COLORS
      p <- io $ getWindowProperty8 dpy a w
      let p' = case p of
                 Just [1] -> [0]
                 _        -> [1]

      io $ changeProperty8 dpy w a cARDINAL propModeReplace p'

    _ -> return ()
