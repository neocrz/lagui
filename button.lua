local Button = {}
local Col = {}
function Col.Rect(r1, r2)
    local rect1 = {}
    local rect2 = {}

    rect1.x = r1.x or 0
    rect1.y = r1.y or 0
    rect1.w = r1.w or 1
    rect1.h = r1.h or 1

    rect2.x = r2.x or 0
    rect2.y = r2.y or 0
    rect2.w = r2.w or 1
    rect2.h = r2.h or 1

    if rect1.x < rect2.x + rect2.w and
        rect1.x + rect1.w > rect2.x and
        rect1.y < rect2.y + rect2.h and
        rect1.h + rect1.y > rect2.y then
        return true
    else
        return false
    end

end

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

    b.draws = {
        inactive = function(self)
            love.graphics.setColor(unpack(self.color))
            love.graphics.rectangle("line", self.x, self.y, self.w, self.h)
            love.graphics.setColor(unpack(self.text.color))
            love.graphics.print(
                self.text.text,
                self.x + (self.w / 2) - (self.font:getWidth(self.text.text) / 2),
                self.y + (self.h / 2) - (self.font:getHeight(self.text.text) / 2)
            )
        end,
        active = function(self)
            love.graphics.setColor(unpack(self.color))
            love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
            love.graphics.setColor(unpack(self.text.color))
            love.graphics.print(
                self.text.text,
                self.x + (self.w / 2) - (self.font:getWidth(self.text.text) / 2),
                self.y + (self.h / 2) - (self.font:getHeight(self.text.text) / 2)
            )
        end
    }
    b.draw = b.draws.inactive

    function b:update(dt)
        local touches = love.touch.getTouches()

        for i, id in ipairs(touches) do
            local tx, ty = love.touch.getPosition(id)
            if Col.Rect({ x = x, y = y }, self) then self.draw = self.draws.active end
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
