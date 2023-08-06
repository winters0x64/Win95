local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")


local walls = {}

function walls.walls()
    -- {{{ Wallpaper
    screen.connect_signal("request::wallpaper", function(s)
        awful.wallpaper {
            screen = s,
            widget = {
                {
                    image     = beautiful.wallpaper,
                    upscale   = true,
                    downscale = true,
                    widget    = wibox.widget.imagebox,
                },
                valign = "center",
                halign = "center",
                tiled  = false,
                widget = wibox.container.tile,
            }
        }
    end)
    -- }}}
    -- Will change this line from here soon
    beautiful.useless_gap = 5
end

return walls