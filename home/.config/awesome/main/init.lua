-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")

-- Theme handling library
local beautiful = require("beautiful")

-- Bling
local bling = require("lib.bling")
-- bling.module.flash_focus.enable()


-- Desktop
------------

-- Layouts
tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        -- awful.layout.suit.dwindle,
        awful.layout.suit.spiral,
        awful.layout.suit.tile,
        awful.layout.suit.max,
        awful.layout.suit.floating,
    })
end)

-- Tags
screen.connect_signal("request::desktop_decoration", function(s)

    -- Tag layouts
    local taglayouts = {
        awful.layout.suit.spiral,
        awful.layout.suit.spiral,
        awful.layout.suit.spiral,
        awful.layout.suit.spiral,
        awful.layout.suit.spiral,
    }

    -- Tag names
    local tagnames = {"1", "2", "3", "4", "5"}

    -- Each screen has its own tag table.
    awful.tag(tagnames, s, taglayouts)

end)


-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
    c:activate { context = "mouse_enter", raise = false }
end)


-- Stuff
----------

require("main.keys")
require("main.ruled")
require("main.menu")
require("main.extras")

