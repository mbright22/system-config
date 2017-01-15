if !(xrandr | grep "DP1 disconnected" 1>/dev/null 2>&1)
then 
    xrandr --output DP1 --primary; 
    xrandr --output eDP1 --off;
else
    if (xrandr | grep "HDMI1 connected" 1>/dev/null 2>&1)
    then
	xrandr --output HDMI1 --primary
	xrandr --output eDP1 --off
    else
	xrandr --output eDP1 --brightness 1.0
    fi
fi
