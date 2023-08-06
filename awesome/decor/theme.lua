---------------------------
-- Win95 --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local rnotification = require("ruled.notification")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}

local buttons = os.getenv('HOME') .. "/.themes/Chicago95/gtk-3.0/buttons/"
theme.icons = os.getenv('HOME') .."/.icons/Chicago95/" 

theme.font          = "MorePerfectDOSVGA 12"

theme.bg_normal     = "#c0c0c0"
theme.bg_focus      = "#000080"
theme.bg_urgent     = "#ff0000"
theme.bg_minimize   = "#444444"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#000000"
theme.fg_focus      = "#ffffff"
theme.fg_urgent     = "#ffffff"
theme.fg_minimize   = "#ffffff"

theme.useless_gap         = dpi(0)
theme.border_width        = dpi(1)
theme.border_color_normal = "#000000"
theme.border_color_active = "#535d6c"
theme.border_color_marked = "#91231c"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)


theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(20)
theme.menu_width  = dpi(100)

--button: maximize 
theme.titlebar_maximized_button_normal_inactive       = buttons.."maximize_normal.png"
theme.titlebar_maximized_button_focus_inactive        = buttons.."maximize_normal.png"
theme.titlebar_maximized_button_normal_inactive_press = buttons.."maximize_pressed.png"
theme.titlebar_maximized_button_focus_inactive_press  = buttons.."maximize_pressed.png"

--button: un-maximize 
theme.titlebar_maximized_button_normal_active         = buttons.."restore_normal.png" -- TODO: fix path
theme.titlebar_maximized_button_focus_active          = buttons.."restore_normal.png" -- TODO: fix path
theme.titlebar_maximized_button_normal_active_press   = buttons.."restore_pressed.png"
theme.titlebar_maximized_button_focus_active_press    = buttons.."restore_pressed.png"

--button: minimize
theme.titlebar_minimize_button_normal                 = buttons.."minimize_normal.png"
theme.titlebar_minimize_button_focus                  = buttons.."minimize_normal.png"
theme.titlebar_minimize_button_normal_press           = buttons.."minimize_normal.png"
theme.titlebar_minimize_button_focus_press            = buttons.."minimize_normal.png"

--button: close 
theme.titlebar_close_button_normal                    = buttons.."close_normal.png"
theme.titlebar_close_button_focus                     = buttons.."close_normal.png"
theme.titlebar_close_button_focus_press               = buttons.."close_pressed.png"
theme.titlebar_close_button_normal_press              = buttons.."close_pressed.png" 

--Wallpaper
theme.wallpaper = "/home/winters/.config/awesome/walls/win95.jpg"

-- Start icon 
theme.home_icon = theme.icons.."/places/scalable/start-here.svg"

-- App icons
theme.browser = theme.icons.."/apps/scalable/chromium-browser.svg"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_normal, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

-- Set different colors for urgent notifications.
rnotification.connect_signal('request::rules', function()
    rnotification.append_rule {
        rule       = { urgency = 'critical' },
        properties = { bg = '#ff0000', fg = '#ffffff' }
    }
end)

return theme
