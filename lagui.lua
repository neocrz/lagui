local Lagui = {}
local path = (...):match("(.-)[^%.]+$")

--[[
    Button methods:
    Lagui.Button.R
    Lagui.Button.newCircl
]]
Lagui.Button = require(path .. 'button')
Lagui.Joy = require(path .. "joy")

return Lagui
