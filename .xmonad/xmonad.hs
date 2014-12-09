import qualified Data.Map as M

import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Layout.ResizableTile

spawn' = spawn . ("/home/pallly/bin/" ++)

toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

myKeys conf@(XConfig{modMask = modm}) = M.fromList
  [ ((modm, xK_z), sendMessage MirrorShrink)
  , ((modm, xK_a), sendMessage MirrorExpand)
  , ((modm, xK_Control_L), spawn' "keyboard_layout_switch.bash") ]

myConfig = defaultConfig{
    terminal    = "urxvt"
  , workspaces  = ["main", "pallly", "odorik", "alps", "vbox"]
  , modMask     = mod4Mask
  , borderWidth = 2
  , layoutHook  = ResizableTall 1 (3/100) (1/2) []
  , keys        = \x -> myKeys x `M.union` keys defaultConfig x
  }

main = xmonad =<< statusBar "xmobar" xmobarPP toggleStrutsKey myConfig
