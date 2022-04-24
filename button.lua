local Button = {}
function Button.newRect(t)
    b = {} -- Structure
    _ = {} -- temp var
    _.r, _.g, _.b, _.a = love.graphics.getColor()

    b.default = {}
    b.default.color = { _.r, _.g, _.b, _.a }
    b.default.font = love.graphics.getFont()

    b.x = t.x or 0
    b.y = t.y or 0
    b.w = t.w or 0
    b.h = t.h or 0
    b.text = {}
    b.text.text = t.text.text or ""
    b.text.color = t.text.color or { 0, 0, 0, 1 }
    b.color = { 1, 1, 1, 1 }
    b.font = t.font or b.default.font
    b.mode = "fill"
    b.draw = nil
    b.draws = {
        inactive = function(self)
            love.graphics.setColor(unpack(self.color))
            love.graphics.rectangle(self.mode, self.x, self.y, self.w, self.h)
            love.graphics.setColor(unpack(self.text.color))
            love.graphics.print(
                self.text.text,
                self.x + (self.w / 2) - (self.font:getWidth(self.text.text) / 2),
                self.y + (self.h / 2) - (self.font:getHeight(self.text.text) / 2)
            )
        end
    }

    function b:update(dt)
        local touches = love.touch.getTouches()

        for i, id in ipairs(touches) do
            local x, y = love.touch.getPosition(id)
        end
    end

    ---[[ Touch
    function b:touchpressed(id, x, y, dx, dy, pressure)
    end

    function b:touchmoved(id, x, y, dx, dy, pressure)

    end

    function b:touchreleased(id, x, y, dx, dy, pressure)
    end

    --]]



    _ = nil
    return b
end

return Button
