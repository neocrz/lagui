local Button = {}
local path = (...):match("(.-)[^%.]+$")
local Cl = require(path .. 'collision')


function Button.R(t)
    local rect = {}
    _ = {} -- temp var

    ---[[ Default Button color & font
    _.color = { 0.5, 0.5, 0.5, 1 }
    _.font = love.graphics.getFont()
    --]]

    ---[[ Button Dimensions
    rect.x = t.x or 0
    rect.y = t.y or 0
    rect.w = t.w or 0
    rect.h = t.h or 0
    --]]

    ---[[ Default - or inactive - variables for drawing
    _.default = t.default or {}
    _.default.text = _.default.text or {}
    _.r, _.g, _.b, _.a = love.graphics.getColor()

    rect.ambient_color = { _.r, _.g, _.b, _.a }

    rect.default = {}
    rect.default.color = _.default.color or _.color
    rect.default.mode = _.default.mode or "line"
    rect.default.text = {
        font = _.default.text.font or _.font,
        color = _.default.text.color or _.color,
        text = _.default.text.text or ""
    }
    --]]

    ---[[ Active variables for drawing
    _.active = t.active or {}
    _.active.text = _.active.text or {}

    rect.active = {}
    rect.active.color = _.active.color or rect.default.color
    rect.active.mode = _.active.mode or "fill"
    rect.active.text = {
        font = _.active.text.font or rect.default.text.font,
        color = _.active.text.color or rect.default.text.color,
        text = _.active.text.text or rect.default.text.text
    }
    --]]

    ---[[ Drawing states
    _.state = t.state or {}
    rect.state = {}

    rect.state.inactive = _.state.inactive or function(self) -- Default - inactive draw
        -- Button Color
        love.graphics.setColor(unpack(self.default.color))
        love.graphics.rectangle(
            self.default.mode,
            self.x, self.y,
            self.w, self.h
        )
        -- Text Color
        love.graphics.setColor(unpack(self.default.text.color))
        love.graphics.print(
            self.default.text.text,
            self.x + (self.w / 2) - (self.default.text.font:getWidth(self.default.text.text) / 2),
            self.y + (self.h / 2) - (self.default.text.font:getHeight(self.default.text.text) / 2)
        )

        -- Return ambient color
        love.graphics.setColor(unpack(self.ambient_color))
    end

    rect.state.active = _.state.active or function(self) -- Active draw
        -- Button Color
        love.graphics.setColor(unpack(self.active.color))
        love.graphics.rectangle(
            self.active.mode,
            self.x, self.y,
            self.w, self.h
        )
        -- Text Color
        love.graphics.setColor(unpack(self.active.text.color))
        love.graphics.print(
            self.active.text.text,
            self.x + (self.w / 2) - (self.active.text.font:getWidth(self.active.text.text) / 2),
            self.y + (self.h / 2) - (self.active.text.font:getHeight(self.active.text.text) / 2)
        )

        -- Return ambient color
        love.graphics.setColor(unpack(self.ambient_color))
    end
    --]]

    ---[[ Callback Actions
    _.action = t.action or {}

    rect.action = {}
    rect.action.pressed = _.action.pressed or nil
    rect.action.released = _.action.released or nil
    rect.action.hover = _.action.hover or nil
    rect.action.out = _.action.out or nil
    --]]

    rect.draw = rect.state.inactive -- Inactive as default drawing state
    _ = nil

    rect.update = function(self, dt)
        local touches = love.touch.getTouches()
        if touches[1] then
            local tch = function()
                for i, id in ipairs(touches) do
                    local tx, ty = love.touch.getPosition(id)
                    if Cl.rect({ x = tx, y = ty }, { x = self.x, y = self.y, w = self.w, h = self.h }) then
                        self.draw = self.state.active
                        if self.action.hover then self.action.hover(self) end
                        return
                    end
                end
                self.draw = self.state.inactive
                if self.action.out then self.action.out(self) end
            end
            tch()
        else
            self.draw = self.state.inactive
            if self.action.out then self.action.out(self) end
        end
    end


    rect.touchpressed = function(self, id, x, y, dx, dy, pressure)
        if Cl.rect({ x = x, y = y }, { x = self.x, y = self.y, w = self.w, h = self.h }) then
            if self.action.pressed then self.action.pressed(self) end
        end
    end

    rect.touchmoved = function(self, id, x, y, dx, dy, pressure)

    end
    rect.touchreleased = function(self, id, x, y, dx, dy, pressure)
        if Cl.rect({ x = x, y = y }, { x = self.x, y = self.y, w = self.w, h = self.h }) then
            if self.action.released then self.action.released(self) end
        end
    end


    return rect
end

function Button.C(t)
    local circle = {}
    local _ = {}

    ---[[ Default Button color & font
    _.color = { 0.5, 0.5, 0.5, 1 }
    _.font = love.graphics.getFont()
    --]]

    ---[[ Button Dimensions
    circle.x = t.x or 0
    circle.y = t.y or 0
    circle.r = t.r or 0
    --]]

    ---[[ Default - or inactive - variables for drawing
    _.default = t.default or {}
    _.default.text = _.default.text or {}
    _.r, _.g, _.b, _.a = love.graphics.getColor()

    circle.ambient_color = { _.r, _.g, _.b, _.a }

    circle.default = {}
    circle.default.color = _.default.color or _.color
    circle.default.mode = _.default.mode or "line"
    circle.default.text = {
        font = _.default.text.font or _.font,
        color = _.default.text.color or _.color,
        text = _.default.text.text or ""
    }
    --]]

    ---[[ Active variables for drawing
    _.active = t.active or {}
    _.active.text = _.active.text or {}

    circle.active = {}
    circle.active.color = _.active.color or circle.default.color
    circle.active.mode = _.active.mode or "fill"
    circle.active.text = {
        font = _.active.text.font or circle.default.text.font,
        color = _.active.text.color or circle.default.text.color,
        text = _.active.text.text or circle.default.text.text
    }
    --]]

    ---[[ Drawing states
    _.state = t.state or {}
    circle.state = {}

    circle.state.inactive = _.state.inactive or function(self) -- Default - inactive draw
        love.graphics.setColor(unpack(self.default.color))
        love.graphics.circle(self.default.mode, self.x, self.y, self.r)
        -- Text Color
        love.graphics.setColor(unpack(self.default.text.color))
        love.graphics.print(
            self.default.text.text,
            self.x - (self.default.text.font:getWidth(self.default.text.text) / 2),
            self.y - (self.default.text.font:getHeight(self.default.text.text) / 2)
        )

        -- Return ambient color
        love.graphics.setColor(unpack(self.ambient_color))
    end

    circle.state.active = _.state.active or function(self) -- Active draw
        -- Button Color
        love.graphics.setColor(unpack(self.active.color))
        love.graphics.circle(self.active.mode, self.x, self.y, self.r)
        -- Text Color
        love.graphics.setColor(unpack(self.active.text.color))
        love.graphics.print(
            self.active.text.text,
            self.x - (self.active.text.font:getWidth(self.active.text.text) / 2),
            self.y - (self.active.text.font:getHeight(self.active.text.text) / 2)
        )

        -- Return ambient color
        love.graphics.setColor(unpack(self.ambient_color))
    end
    --]]

    ---[[ Callback Actions
    _.action = t.action or {}

    circle.action = {}
    circle.action.pressed = _.action.pressed or nil
    circle.action.released = _.action.released or nil
    circle.action.hover = _.action.hover or nil
    circle.action.out = _.action.out or nil
    --]]

    circle.draw = circle.state.inactive -- Inactive as default drawing state
    _ = nil

    circle.update = function(self, dt)
        local touches = love.touch.getTouches()
        if touches[1] then
            local tch = function()
                for i, id in ipairs(touches) do
                    local tx, ty = love.touch.getPosition(id)
                    if Cl.circle({ x = tx, y = ty }, { x = self.x, y = self.y, r = self.r }) then
                        self.draw = self.state.active
                        if self.action.hover then self.action.hover(self) end
                        return
                    end
                end
                self.draw = self.state.inactive
                if self.action.out then self.action.out(self) end
            end
            tch()
        else
            self.draw = self.state.inactive
            if self.action.out then self.action.out(self) end
        end
    end


    circle.touchpressed = function(self, id, x, y, dx, dy, pressure)
        if Cl.circle({ x = x, y = y }, { x = self.x, y = self.y, r = self.r }) then
            if self.action.pressed then self.action.pressed(self) end
        end
    end

    circle.touchmoved = function(self, id, x, y, dx, dy, pressure)

    end

    circle.touchreleased = function(self, id, x, y, dx, dy, pressure)
        if Cl.circle({ x = x, y = y }, { x = self.x, y = self.y, r = self.r }) then
            if self.action.released then self.action.released(self) end
        end
    end


    return circle
end

return Button
