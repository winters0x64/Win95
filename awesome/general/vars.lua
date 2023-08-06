local beautiful = require("beautiful")
local gears = require("gears")

local vars = {}

function vars.vars()
    -- {{{ Variable definitions
    -- Themes define colours, icons, font and wallpapers.
    beautiful.init("/home/winters/.config/awesome/decor/theme.lua")
    -- This is used later as the default terminal and editor to run.
    terminal = "/usr/bin/alacritty"
    editor = os.getenv("EDITOR") or "nano"
    editor_cmd = terminal .. " -e " .. editor

    -- Default modkey.
    -- Usually, Mod4 is the key with a logo between Control and Alt.
    -- If you do not like this or do not have such a key,
    -- I suggest you to remap Mod4 to another key using xmodmap or other tools.
    -- However, you can use another modifier like Mod1, but it may interact with others.
    modkey = "Mod4"
    -- }}} 
end

return vars