local Lagui = {}
local path  = (...):match("(.-)[^%.]+$")
local cwd   = (...):gsub('%.init$', '') .. "."
--[[
    Button methods:
    Lagui.Button.R
    Lagui.Button.newCircl
]]
Lagui.Button = require(cwd .. 'button')
Lagui.Joy = require(cwd .. "joy")

return Lagui
