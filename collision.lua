local Collision = {}

Collision.twod = {}
---[[
function Collision.twod.axis_aligned_bounding_box(r1, r2)
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

--]]

Collision.rect = Collision.twod.axis_aligned_bounding_box -- Facility


return Collision
