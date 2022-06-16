local Lagui = {}
local path = (...):match("(.-)[^%.]+$")
local Cl = require(path .. 'collision')
--[[
    Button methods:
    Lagui.Button.R
    Lagui.Button.newCircl
]]
Lagui.Button = require(path .. 'button')


return Lagui
