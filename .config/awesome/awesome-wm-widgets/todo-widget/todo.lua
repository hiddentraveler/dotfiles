-------------------------------------------------
-- ToDo Widget for Awesome Window Manager
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/todo-widget

-- @author Pavel Makhov
-- @copyright 2020 Pavel Makhov
-------------------------------------------------

local awful = require("awful")
local wibox = require("wibox")
local json = require("json")
local spawn = require("awful.spawn")
local gears = require("gears")
local beautiful = require("beautiful")
local gfs = require("gears.filesystem")

local HOME_DIR = os.getenv("HOME")
local WIDGET_DIR = HOME_DIR .. '/.config/awesome/awesome-wm-widgets/todo-widget'
local STORAGE = HOME_DIR .. '/.task/backlog.data'

local GET_TODO_ITEMS = 'bash -c "cat ' .. STORAGE .. '"'

local rows  = { layout = wibox.layout.fixed.vertical }
local todo_widget = {}
local update_widget

