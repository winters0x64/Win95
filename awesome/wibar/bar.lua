local awful = require("awful")
local wibox = require("wibox")

-- {{{ Wibar

local bar = {}

function bar.bar()
    -- Create a textclock widget
    mytextclock = wibox.widget.textclock()

    screen.connect_signal("request::desktop_decoration", function(s)
        -- Each screen has its own tag table.
        -- awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
        -- Each screen has its own tag table.
        local names = { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
        local l = awful.layout.suit  -- Just to save some typing: use an alias.
        local layouts = { l.tile, l.tile, l.tile, l.tile, l.tile,
            l.tile, l.tile, l.tile, l.tile }
        awful.tag(names, s, layouts)

        -- Create a promptbox for each screen
        s.mypromptbox = awful.widget.prompt()

        -- Create a taglist widget
        s.mytaglist = awful.widget.taglist {
            screen  = s,
            filter  = awful.widget.taglist.filter.all,
            buttons = {
                awful.button({ }, 1, function(t) t:view_only() end),
                awful.button({ modkey }, 1, function(t)
                                                if client.focus then
                                                    client.focus:move_to_tag(t)
                                                end
                                            end),
                awful.button({ }, 3, awful.tag.viewtoggle),
                awful.button({ modkey }, 3, function(t)
                                                if client.focus then
                                                    client.focus:toggle_tag(t)
                                                end
                                            end),
                awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
                awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
            }
        }

        -- Create a tasklist widget
        s.mytasklist = awful.widget.tasklist {
            screen  = s,
            filter  = awful.widget.tasklist.filter.currenttags,
            buttons = {
                awful.button({ }, 1, function (c)
                    c:activate { context = "tasklist", action = "toggle_minimization" }
                end),
                awful.button({ }, 3, function() awful.menu.client_list { theme = { width = 250 } } end),
                awful.button({ }, 4, function() awful.client.focus.byidx(-1) end),
                awful.button({ }, 5, function() awful.client.focus.byidx( 1) end),
            }
        }

        -- Create the wibox
        s.mywibox = awful.wibar {
            position = "bottom",
            screen   = s,
            widget   = {
                layout = wibox.layout.align.horizontal,
                { -- Left widgets
                    layout = wibox.layout.fixed.horizontal,
                    startmenu_widget,
                    win95_start_menu,
                    s.mytaglist,
                    s.mypromptbox,
                },
                s.mytasklist, -- Middle widget
                { -- Right widgets
                    layout = wibox.layout.fixed.horizontal,
                    wibox.widget.systray(),
                    mytextclock
                },
            }
        }
    end)
end

return bar
