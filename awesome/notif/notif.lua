local naughty = require("naughty")
local awful = require("awful")
local ruled = require("ruled")


local notif = {}

function notif.notif ()
    -- {{{ Notifications

    ruled.notification.connect_signal('request::rules', function()
        -- All notifications will match this rule.
        ruled.notification.append_rule {
            rule       = { },
            properties = {
                screen           = awful.screen.preferred,
                implicit_timeout = 5,
            }
        }
    end)

    naughty.connect_signal("request::display", function(n)
        naughty.layout.box { notification = n }
    end)

    -- }}}
end

return notif
