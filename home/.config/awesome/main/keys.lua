-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

-- Theme handling library
local beautiful = require("beautiful")

-- Notifications library
local naughty = require("naughty")

-- Bling
local bling = require("lib.bling")
local playerctl = bling.signal.playerctl.lib()

-- Helpers
local helpers = require("helpers")


-- Make key easier to call
----------------------------

mod = "Mod4"
alt = "Mod1"
ctrl = "Control"
shift = "Shift"


-- Global key bindings
------------------------

awful.keyboard.append_global_keybindings({

---- App

    -- Terminal
    awful.key({mod}, "Return", function()
        awful.spawn(terminal)
    end,
    {description = "Spawn terminal", group = "App"}),

    -- Launcher
    awful.key({mod}, "d", function()
        awful.spawn(launcher)
    end,
    {description = "Spawn launcher", group = "App"}),

    -- Power menu
    awful.key({mod}, "0", function()
        awful.util.spawn_with_shell(powermenu)
    end,
    {description = "Spawn power menu", group = "App"}),

    -- Screenshot menu
    awful.key({}, "Print", function()
        awful.util.spawn_with_shell(screenshot)
    end,
    {description = "Spawn screenshot menu", group = "App"}),

    -- Hotkeys menu
    awful.key({mod}, "\\",
        hotkeys_popup.show_help,
    {description = "Hotkeys menu", group = "App"}),


---- WM

    -- Restart awesome
    awful.key({mod, shift}, "r",
        awesome.restart,
    {description = "Reload awesome", group = "WM"}),

    -- Quit awesome
    awful.key({mod, shift, ctrl}, "q",
        awesome.quit,
    {description = "Quit awesome", group = "WM"}),


---- Window

    -- Focus client by direction
    awful.key({mod}, "Up", function()
        awful.client.focus.bydirection("up")
    end,
    {description = "Focus up", group = "Window"}),

    awful.key({mod}, "Left", function()
        awful.client.focus.bydirection("left")
    end,
    {description = "Focus left", group = "Window"}),

    awful.key({mod}, "Down", function()
        awful.client.focus.bydirection("down")
    end,
    {description = "Focus down", group = "Window"}),

    awful.key({mod}, "Right", function()
        awful.client.focus.bydirection("right")
    end,
    {description = "Focus right", group = "Window"}),

    -- Resize focused client
    awful.key({mod, ctrl}, "Up", function(c)
        helpers.resize_client(client.focus, "up")
    end,
    {description = "Resize to the up", group = "Window"}),

    awful.key({mod, ctrl}, "Left", function(c)
        helpers.resize_client(client.focus, "left")
    end,
    {description = "Resize to the left", group = "Window"}),

    awful.key({mod, ctrl}, "Down", function(c)
        helpers.resize_client(client.focus, "down")
    end,
    {description = "Resize to the down", group = "Window"}),

    awful.key({mod, ctrl}, "Right", function(c)
        helpers.resize_client(client.focus, "right")
    end,
    {description = "Resize to the right", group = "Window"}),

    -- Un-minimize windows
    awful.key({mod, shift}, "n", function()
        local c = awful.client.restore()
        if c then
            c:activate{raise = true, context = "key.unminimize"}
        end
    end),

---- Screen

    awful.key({mod, ctrl, shift}, "Right", function()
        awful.screen.focus_relative(1)
    end,
    {description = "Focus to the Next Screen", group = "Screen"}),

    awful.key({mod, ctrl, shift}, "Left", function()
        awful.screen.focus_relative(-1)
    end,
    {description = "Resize to the Previous Screen", group = "Screen"}),

    awful.key({mod, ctrl, shift}, "Up", function(c)
        client.focus:move_to_screen(client.focus.screen.index - 1)
    end,
    {description = "Move to Previous Screen", group = "client"}),

    awful.key({mod, ctrl, shift}, "Down", function(c)
        client.focus:move_to_screen(client.focus.screen.index + 1)
    end,
    {description = "Move to Next Screen", group = "client"}),

---- Bling

    -- Add client to tabbed layout
    awful.key({mod, shift}, "e", function()
        awesome.emit_signal("tabbed::add")
    end,
    {description = "Add client to tabbed layout", group = "Bling"}),

    -- Remove client from tabbed layout
    awful.key({mod, ctrl}, "e", function()
        awesome.emit_signal("tabbed::destroy")
    end,
    {description = "Remove client from tabbed layout", group = "Bling"}),

    -- Cycle through client in tabbed layout
    awful.key({mod}, "`", function()
        awesome.emit_signal("tabbed::cycle")
    end,
    {description = "Cycle through client in tabbed layout", group = "Bling"}),

    -- Discord scratchpad
    awful.key({mod, ctrl, shift}, "d", function()
        awesome.emit_signal("scratch::discord")
    end,
    {description = "Toggle discord scratchpad", group = "Bling"}),

    -- Spotify scratchpad
    awful.key({mod, ctrl, shift}, "m", function()
        awesome.emit_signal("scratch::spotify")
    end,
    {description = "Toggle music scratchpad", group = "Bling"}),

    -- KeePassXC scratchpad
    awful.key({mod, ctrl, shift}, "z", function()
        awesome.emit_signal("scratch::keepassxc")
    end,
    {description = "Toggle keepassxc scratchpad", group = "Bling"}),

    -- BitWarden scratchpad
    awful.key({mod, ctrl, shift}, "b", function()
        awesome.emit_signal("scratch::bitwarden")
    end,
    {description = "Toggle bitwarden scratchpad", group = "Bling"}),

    -- Slack scratchpad
    awful.key({mod, ctrl, shift}, "s", function()
        awesome.emit_signal("scratch::slack")
    end,
    {description = "Toggle slack scratchpad", group = "Bling"}),


---- Misc

    -- Screen brightness
    awful.key({}, "XF86MonBrightnessDown", function()
        awful.spawn.with_shell("light -U 2")
    end,
    {description = "Decrease screen brightness", group = "Misc"}),

    awful.key({}, "XF86MonBrightnessUp", function()
        awful.spawn.with_shell("light -A 2")
    end,
    {description = "Increase screen brightness", group = "Misc"}),

    -- Keyboard backlight (i'm using macbook)
    awful.key({}, "XF86KbdBrightnessDown", function()
        awful.spawn.with_shell("light -s sysfs/leds/smc::kbd_backlight -U 5")
    end,
    {description = "Decrease keyboard brightness", group = "Misc"}),

    awful.key({}, "XF86KbdBrightnessUp", function()
        awful.spawn.with_shell("light -s sysfs/leds/smc::kbd_backlight -A 5")
    end,
    {description = "Increase keyboard brightness", group = "Misc"}),

    -- Volume
    awful.key({}, "XF86AudioMute", function()
        helpers.volume_control(0)
    end,
    {description = "Toggle volume", group = "Misc"}),

    awful.key({}, "XF86AudioLowerVolume", function()
        helpers.volume_control(-2)
    end,
    {description = "Lower volume", group = "Misc"}),

    awful.key({}, "XF86AudioRaiseVolume", function()
        helpers.volume_control(2)
    end,
    {description = "Raise volume", group = "Misc"}),

    -- Music
    awful.key({}, "XF86AudioPlay", function()
        playerctl:play_pause()
    end,
    {description = "Toggle music", group = "Misc"}),

    awful.key({}, "XF86AudioPrev", function()
        playerctl:previous()
    end,
    {description = "Previous music", group = "Misc"}),

    awful.key({}, "XF86AudioNext", function()
        playerctl:next()
    end,
    {description = "Next music", group = "Misc"}),

    -- Music - No Fn Mode
    awful.key({mod, ctrl}, "Return", function()
        playerctl:play_pause()
    end,
    {description = "Toggle music", group = "Misc"}),

    awful.key({mod, ctrl}, ",", function()
        playerctl:previous()
    end,
    {description = "Previous music", group = "Misc"}),

    awful.key({mod, ctrl}, ".", function()
        playerctl:next()
    end,
    {description = "Next music", group = "Misc"}),

    -- Screenshot
    awful.key({mod}, "/", function()
        awful.spawn.with_shell("screensht")
    end,
    {description = "Take screenshot", group = "Misc"}),

    -- Window switcher
    awful.key({mod}, "Tab", function()
        awesome.emit_signal("bling::window_switcher::turn_on")
    end,
    {description = "Window switcher", group = "Misc"}),

})


-- Client key bindings
------------------------

client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
        -- Move or swap by direction
        awful.key({mod, shift}, "k", function(c)
            helpers.move_client(c, "up")
        end),

        awful.key({mod, shift}, "h", function(c)
            helpers.move_client(c, "left")
        end),

        awful.key({mod, shift}, "j", function(c)
            helpers.move_client(c, "down")
        end),

        awful.key({mod, shift}, "l", function(c)
            helpers.move_client(c, "right")
        end),

        -- Relative move client
        awful.key({mod, shift, ctrl}, "j", function (c)
            c:relative_move(0,  dpi(20), 0, 0)
        end),

        awful.key({mod, shift, ctrl}, "k", function (c)
            c:relative_move(0, dpi(-20), 0, 0)
        end),

        awful.key({mod, shift, ctrl}, "h", function (c)
            c:relative_move(dpi(-20), 0, 0, 0)
        end),

        awful.key({mod, shift, ctrl}, "l", function (c)
            c:relative_move(dpi( 20), 0, 0, 0)
        end),

        -- Toggle floating
        awful.key({mod, ctrl}, " ",
            awful.client.floating.toggle
        ),

        awful.key({}, "XF86LaunchA",
            awful.client.floating.toggle
        ),

        -- Toggle fullscreen
        awful.key({mod}, "f", function()
            client.focus.fullscreen = not client.focus.fullscreen
            client.focus:raise()
        end),

        -- Toggle maximize
        awful.key({mod}, "m", function()
            client.focus.maximized = not client.focus.maximized
        end),

        -- Minimize windows
        awful.key({mod}, "n", function()
            client.focus.minimized = true
        end),

        -- Keep on top
        awful.key({mod}, "p", function (c)
            c.ontop = not c.ontop
        end),

        -- Sticky
        awful.key({mod, shift}, "p", function (c)
            c.sticky = not c.sticky
        end),

        -- Close window
        awful.key({mod, shift}, "q", function()
            client.focus:kill()
        end),

        -- Center window
        awful.key({mod}, "c", function()
            awful.placement.centered(c, {honor_workarea = true, honor_padding = true})
        end),
    })
end)


-- Move through workspaces
----------------------------

awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = { mod },
        keygroup = "numrow",
        description = "Only view tag",
        group = "Tag",
        on_press = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers = { mod, ctrl },
        keygroup = "numrow",
        description = "Toggle tag",
        group = "Tags",
        on_press = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { mod, shift },
        keygroup = "numrow",
        description = "Move focused client to tag",
        group = "Tags",
        on_press = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    }
})


-- Mouse bindings on desktop
------------------------------

awful.mouse.append_global_mousebindings({

    -- Left click
    awful.button({}, 1, function()
        naughty.destroy_all_notifications()
        if mymainmenu then
            mymainmenu:hide()
        end
    end),

    -- Right click
    awful.button({}, 3, function()
        mymainmenu:toggle()
    end),

    -- Side key
    awful.button({}, 8, awful.tag.viewprev),
    awful.button({}, 9, awful.tag.viewnext)

})


-- Mouse buttons on the client
--------------------------------

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({}, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({mod}, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        awful.button({mod}, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)

