local Joy = {}
local path = (...):match("(.-)[^%.]+$")
local Cl = require(path .. 'collision')

function Joy.New(t)
    local joy = {}
    local _ = {}

    ---[[ Default Button color & font
    _.color = { 0.5, 0.5, 0.5, 1 }
    _.font = love.graphics.getFont()
    --]]

    joy.x = t.x or 0
    joy.y = t.y or 0
    joy.r = t.r or 100


    return joy
end

return Joy
