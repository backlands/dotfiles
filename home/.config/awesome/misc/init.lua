-- Standard awesome library
local gears = require("gears")
local awful = require("awful")

-- Theme handling library
local beautiful = require("beautiful")

-- Widget library
local wibox = require("wibox")

-- Bling
local bling = require("lib.bling")

-- Helpers
local helpers = require("helpers")


-- Task Preview
----------------

bling.widget.task_preview.enable {
    -- x = 20,
    -- y = 20,
    height = dpi(150),
    width = dpi(220),
    placement_fn = function(c)
        awful.placement.bottom_left(c, {
            margins = {
                left = beautiful.useless_gap,
                bottom = beautiful.wibar_height + beautiful.useless_gap
            }
        })
    end
}


-- Window switcher
--------------------

bling.widget.window_switcher.enable {
    type = "list",

    hide_window_switcher_key = "Escape",
    minimize_key = "n",
    unminimize_key = "N",
    kill_client_key = "q",
    cycle_key = "Tab",
    previous_key = "Up",
    next_key = "Down",
    vim_previous_key = "j",
    vim_next_key = "k"
}


local discord_scratch = bling.module.scratchpad:new {
    command = "discord",
    rule = { instance = "discord" },
    sticky = false,
    autoclose = false,
    floating = true,
    geometry = { x = 245, y = 85, height = 800, width = 950 },
    reapply = false,
    dont_focus_before_close = false,
}

local spotify_scratch = bling.module.scratchpad:new {
    command = "spotify",
    rule = { instance = "spotify" },
    sticky = false,
    autoclose = false,
    floating = true,
    geometry = { x = 150, y = 65, height = 660, width = 960 },
    reapply = false,
    dont_focus_before_close = false,
}

local keepassxc_scratch = bling.module.scratchpad:new {
    command = "keepassxc",
    rule = { instance = "keepassxc" },
    sticky = false,
    autoclose = false,
    floating = true,
    geometry = { x = 245, y = 85, height = 600, width = 800 },
    reapply = false,
    dont_focus_before_close = false,
}

local bitwarden_scratch = bling.module.scratchpad:new {
    command = "bitwarden-desktop",
    rule = { instance = "bitwarden" },
    sticky = false,
    autoclose = false,
    floating = true,
    geometry = { x = 245, y = 85, height = 600, width = 800 },
    reapply = false,
    dont_focus_before_close = false,
}

local slack_scratch = bling.module.scratchpad:new {
    command = "slack",
    rule = { instance = "slack" },
    sticky = false,
    autoclose = false,
    floating = true,
    geometry = { x = 150, y = 65, height = 800, width = 960 },
    reapply = false,
    dont_focus_before_close = false,
}


-- Signals
------------

discord_scratch:connect_signal("spawn", function(c) c:turn_off() end)
spotify_scratch:connect_signal("spawn", function(c) c:turn_off() end)
keepassxc_scratch:connect_signal("spawn", function(c) c:turn_off() end)
bitwarden_scratch:connect_signal("spawn", function(c) c:turn_off() end)
slack_scratch:connect_signal("spawn", function(c) c:turn_off() end)

awesome.connect_signal("scratch::discord", function() discord_scratch:toggle() end)
awesome.connect_signal("scratch::spotify", function() spotify_scratch:toggle() end)
awesome.connect_signal("scratch::keepassxc", function() keepassxc_scratch:toggle() end)
awesome.connect_signal("scratch::bitwarden", function() bitwarden_scratch:toggle() end)
awesome.connect_signal("scratch::slack", function() slack_scratch:toggle() end)


-- Stuff
----------

require("misc.ping")
require("misc.bar")
-- require("misc.titlebar")
require("misc.tooltip")
require("misc.pop")
require("misc.deco")

