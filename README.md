# LaGUI

GUI for touchscreen (LÖVE for Android)

[Progress](#Progress) - [Instructions](#Instructions)


_obs: I'm not using metatables for now. I'm a beginner at this..._

## Progress
### Button
- [x] Rectangle
- [x] Circle
- [x] D-pad


## Instructions
```lua
-- main.lua

local Lagui = require("lagui.lagui")
function love.load()
  button = Lagui.Button.R({
    x = 100, y = 100, w = 100, h = 40,
    default = {
      text = {
        text = "Hello!"
      },
    },
    action = {
      released = function(self)
        self.default.color = {love.math.random( ), love.math.random( ), love.math.random( ), 1}
      end,
    },
  })
end



function love.update(dt)
  button:update(dt)
end


function love.draw()
  button:draw()
end

function love.touchmoved( id, x, y, dx, dy, pressure )
  button:touchmoved( id, x, y, dx, dy, pressure )
end

function love.touchpressed( id, x, y, dx, dy, pressure )
  button:touchpressed( id, x, y, dx, dy, pressure )
end

function love.touchreleased( id, x, y, dx, dy, pressure )
  button:touchreleased( id, x, y, dx, dy, pressure )
end
```
