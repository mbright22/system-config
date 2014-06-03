import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import System.Exit
import System.IO
import XMonad.Config.Gnome
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Util.Run(spawnPipe)
import Graphics.X11.ExtraTypes.XF86

import qualified Data.Map as M
import qualified XMonad.StackSet as W

myNormalBorderColor = "#444444"
myFocusedBorderColor = "#cccccc"

myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
 
    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
 
    -- launch dmenu
    , ((modm, xK_p ), spawn "dmenu_run")
 
    -- launch gmrun
    , ((modm .|. shiftMask, xK_p ), spawn "gmrun")

    -- lock screen
    , ((modm, xK_l ), spawn "slock")
 
    -- close focused window
    , ((modm .|. shiftMask, xK_c ), kill)
 
     -- Rotate through the available layout algorithms
    , ((modm, xK_space ), sendMessage NextLayout)
 
    -- Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)
 
    -- Resize viewed windows to the correct size
    , ((modm, xK_n ), refresh)
 
    -- Move focus to the next window
    , ((modm, xK_Tab ), windows W.focusDown)
 
    -- Move focus to the next window
    , ((modm, xK_j ), windows W.focusDown)
 
    -- Move focus to the previous window
    , ((modm, xK_k ), windows W.focusUp )
 
    -- Move focus to the master window
    , ((modm, xK_m ), windows W.focusMaster )
 
    -- Swap the focused window and the master window
    , ((modm, xK_Return), windows W.swapMaster)
 
    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j ), windows W.swapDown )
 
    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k ), windows W.swapUp )
 
    -- Shrink the master area
    , ((modm, xK_h ), sendMessage Shrink)
 
    -- Expand the master area
    --, ((modm, xK_l ), sendMessage Expand)
 
    -- Push window back into tiling
    , ((modm, xK_t ), withFocused $ windows . W.sink)
 
    -- Increment the number of windows in the master area
    , ((modm , xK_comma ), sendMessage (IncMasterN 1))
 
    -- Deincrement the number of windows in the master area
    , ((modm , xK_period), sendMessage (IncMasterN (-1)))
 
    -- toggle the status bar gap (used with avoidStruts from Hooks.ManageDocks)
    -- , ((modm , xK_b ), sendMessage ToggleStruts)
 
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q ), io (exitWith ExitSuccess))
 
    -- Restart xmonad
    , ((modm , xK_q ), restart "xmonad" True)

    -- Set up Volume keys
    , ((0 , xF86XK_AudioLowerVolume), spawn "amixer -c 1 set Master on && amixer -c 1 set Headphone on && amixer -c 1 set Master 2-")
    , ((0 , xF86XK_AudioRaiseVolume), spawn "amixer -c 1 set Master on && amixer -c 1 set Headphone on && amixer -c 1 set Master 2+")
    , ((0 , xF86XK_AudioMute), spawn "amixer -D pulse set Master 1+ toggle") 

    --Launch calculator
    , ((0 , xF86XK_Calculator), spawn "gnome-calculator")

    --Launch email client
    , ((0 , xF86XK_Mail), spawn "thunderbird")

    --Launch web browser
    , ((0 , xF86XK_HomePage), spawn "google-chrome")

    --Launch chat program (mapped to 'search' (F3))
    , ((0 , xF86XK_Search), spawn "hipchat")

    --Launch system monitor (mapped to 'Music' (F9))
    , ((0 , xF86XK_Tools), spawn "gnome-system-monitor")
	
    -- Set up brightness keys
    --, ((0 , xF86XK_MonBrightnessDown), spawn "xrandr --output eDP1 --brightness")
    ]
    ++
 
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
 
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_e, xK_w, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]

main = xmonad =<< xmobar gnomeConfig { 
		modMask = mod4Mask, 
		workspaces=myWorkspaces,
		keys=myKeys,
		normalBorderColor = myNormalBorderColor, 
		focusedBorderColor = myFocusedBorderColor}
 
