-- awesome_mode: api-level=4:screen=on
-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Custom
local keys = require("binds.keys")
local mouse = require("binds.mouse")
local bar = require("wibar.bar")
local vars = require("general.vars")
local error = require("general.error")
local tags = require("general.tags")
local rules = require("rules.rules")
local notif = require("notif.notif")
local menu = require("decor.menu")
local wall = require("decor.wall")
local title = require("decor.title")
local focus = require("general.focus")

-- Error handling
error.error()

-- Variable declarations
vars.vars()

-- Menu 
menu.menu()

-- Tags
tags.tags()

-- Wallpaper
wall.walls()

-- Bar
bar.bar()

-- Keybindings
keys.keys()

-- Mouse
mouse.mouse()

-- Rules
rules.rules()

-- Titlebars
title.title()

-- Notification
notif.notif()

-- Focus follows mouse
focus.focus()