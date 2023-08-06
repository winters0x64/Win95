local awful = require("awful")

local mouse = {}

function mouse.mouse()
    -- {{{ Mouse bindings
    awful.mouse.append_global_mousebindings({
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewprev),
    awful.button({ }, 5, awful.tag.viewnext),
})
-- }}}
end

return mouse

