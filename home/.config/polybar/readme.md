Polybar config
=======

Actually 6 panels in a trenchcoat
-------

Left xfce panel with whisker menu, 2%  
Right xfce panel with mpd plugin, 5%  
Left xfce panel with system tray, 7%  
Right xfce panel with mpd plugin, 5%  
  
Polybar system tray sucks, and polybar mpd controls
lack features I wanted


Dependencies  
-------

Polybar  
wmctrl (for polywins)  
slop (for the resize of polywins)
jq (for weather)  
yad (for calendar)  
  
  
Fonts used  
-------
[Poppins Regular](https://fonts.google.com/specimen/Poppins?category=Sans+Serif&sort=popularity&preview.size=12)  
[Iosevka Nerd Font Complete](https://github.com/ryanoasis/nerd-fonts)  
Consolas Nerd Font for the system monitor


Used scripts 
-------

[Polywins](https://github.com/alnj/polywins)  
edited mostly to change the names of the shown windows, but also
to fix the bug where it wouldn't update when switching workspaces
while a sticky window is active   

[OpenWeatherMap Simple](https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts)  
edited to use nerdfont glyphs instead of whatever the original used
and also added some missing status icons


Find Monitors
-------
polybar -m | cut -d ':' -f 1


Inspired by some of these themes  
-------
https://github.com/arashsm79/polybar-themes  
https://github.com/adi1090x/polybar-themes


Polybar uses default cursor 
-------

Copy the cursor theme to /usr/share/icons and edit the /usr/share/icons/default/index.theme to select it. 
