local Lagui = {}
local path = (...):match("(.-)[^%.]+$")
--[[
    Button methods:
    Lagui.Button.newRect
    Lagui.Button.newCircl
]]
Lagui.Button = require(path .. 'button')


return Lagui
