local Box = {}
local path = (...):match("(.-)[^%.]+$")
local Cl = require(path .. 'collision')

function Box.new(tb)
    local box = {}
    local temp = {}

    local default_color = { 1, 1, 1, 1 }

    local return_font = love.graphics.getFont()

    box.x = tb.x or 0
    box.y = tb.y or 0
    box.w = tb.w or 0
    box.h = tb.h or 0
    box.padding = tb.padding or {}
    box.padding.up = box.padding.up or 0
    box.padding.down = box.padding.down or 0
    box.padding.left = box.padding.left or 0
    box.padding.right = box.padding.right or 0

    box.element = tb.element or {}
    box.element.w = box.element.w or 100
    box.element.h = box.element.h or 40

    box.elements = {}

    box.element_index = 0

    -- addElement to the elements table
    function box:addElement(tb1)
        self.element_index = self.element_index + 1
        table.insert(self.elements, self.element_index, tb1)
        return self.element_index
    end

    -- add elements in a table to the elements table
    function box:AddMany(tb2)
        local tb = tb2 or {}
        for i, o in pairs(tb) do
            if type(o) == "table" then
                print("Origin index:", i, "elements table index:", self:addElement(o))
            end
        end
    end

    function box:setHpadding(value, divide)
        -- divide: if true > divide the value between each side | else > each size have the full value
        -- value: actual size of padding for each
        local d = divide or false
        local v = value or nil

        if v then
            if d then
                v = v / 2
            end
            self.padding.left = v
            self.padding.right = v
        end
    end

    function box:setVpadding(value, divide)
        -- divide: if true > divide the value between each side | else > each size have the full value
        -- value: actual size of padding for each
        local d = divide or false
        local v = value or nil

        if v then
            if d then
                v = v / 2
            end
            self.padding.up = v
            self.padding.down = v
        end
    end

    function box:listDraw()
        local element_box = {}
        element_box.x = self.x + self.padding.left
        element_box.y = self.y + self.padding.up
        element_box.w = self.w - self.padding.up - self.padding.down
        element_box.h = self.w - self.padding.left - self.padding.right

        local element_x = element_box.x + (element_box.w / 2) - (self.element.w / 2)

        local y_index = element_box.y + self.element.h
        local y_distance = 10
        love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
        for i, o in pairs(self.elements) do
            o.x = element_x
            o.y = y_index
            o.w = self.element.w
            o.h = self.element.h
            if not (o.y + o.h > self.y + self.h) then
                o:draw()
            end
            y_index = y_index + self.element.h * 2
        end
    end

    box.draw = box.listDraw
    -- return box

    function box:update(dt)
        for i, o in pairs(self.elements) do
            if o.update then o:update(dt) end
        end
    end

    function box:mousereleased(x, y, button, istouch, presses)
        for i, o in pairs(self.elements) do
            if o.mousereleased then o:mousereleased(x, y, button, istouch, presses) end
        end
    end

    return box
end

-- return module
return Box
