import qualified Data.Map as M

import Control.Applicative

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.ResizableTile
import XMonad.Layout.SimpleFloat
import qualified XMonad.StackSet as W

spawn' = spawn . ("/home/pallly/bin/" ++)

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myKeys conf@(XConfig{modMask = modm}) = M.fromList
  [ ((modm, xK_z), sendMessage MirrorShrink)
  , ((modm, xK_a), sendMessage MirrorExpand)

  , ((modm, xK_Control_L), spawn' "keyboard_layout_switch.bash")

  , ((modm, xK_F2),  spawn "sudo backlight -")
  , ((modm, xK_F3),  spawn "sudo backlight +")

  , ((modm, xK_F9),  spawn "pulseaudio-ctl down")
  , ((modm, xK_F10), spawn "pulseaudio-ctl up")
  , ((modm, xK_F11), spawn "pulseaudio-ctl mute")

  , ((modm, xK_m),   windows W.focusMaster)

  , ((modm, xK_q),   restart "xmonad" True)

  , ((modm, xK_s), spawn "screenshot")
  , ((modm .|. shiftMask, xK_s), spawn "select-screenshot")

  , ((modm, xK_i), invert)

  , ((modm .|. shiftMask, xK_i), spawn "pkill compton; compton -CGb")
  ]


myConfig = ewmh defaultConfig
  { terminal    = "urxvt"
  , workspaces  = [ "1:browser", "2:music", "3:pallly"
                  , "4:work1", "5:work2", "6:other"
                  ]
  , modMask     = mod4Mask
  , borderWidth = 1

  , manageHook      = composeAll [ appName =? "display" --> doFloat ]
                  <+> manageHook defaultConfig
  , layoutHook      = ResizableTall 1 (3/100) (1/2) []
                  ||| Full
                  ||| simpleFloat
  , logHook         = fadeInactiveLogHook 0.85
  , handleEventHook = handleEventHook defaultConfig <+> fullscreenEventHook

  , keys = \x -> keys defaultConfig x `M.union` myKeys x
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

      io $ spawn ("echo \"" ++ show p ++ "\" >> /tmp/foo")
      io $ changeProperty8 dpy w a cARDINAL propModeReplace p'

    _ -> return ()
