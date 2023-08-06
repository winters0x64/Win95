local awful = require("awful")
local beautiful = require("beautiful")
local menubar = require("menubar")
local gears = require("gears")
local wibox =require("wibox")
require("awful.hotkeys_popup.keys")
local hotkeys_popup = require("awful.hotkeys_popup")


local menu = {}

function menu.menu()
    -- Menubar configuration
    menubar.utils.terminal = terminal -- Set the terminal for applications that require it

    -- Win95 start menu
    local win95_master_menu = awful.menu({ items = { 
        { "Hotkeys", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
        { "Run",function()  awful.spawn.with_shell("rofi -show drun") end},
        { "Internet Explorer",function()  awful.spawn("google-chrome-stable") end,beautiful.browser},
        { "Suspend", function() awful.quit() end },
        { "Reboot", function() awful.spawn("reboot") end },
        { "Shutdown", function() awful.spawn("shutdown now") end }

    }})

    win95_start_menu = awful.widget.launcher({
        image = beautiful.home_icon,
        menu = win95_master_menu
    })

    win95 = wibox.widget({
        
    })

end


return menu

