local Object = require("object")

local Scene = Object:new()

function Scene:add(object, ...)
    local o = object:new()
    o:init(self, ...)
    local id = string.format("%p", o)
    self.objects[id] = o
    o.id = id
    return o
end

function Scene:remove(object)
    self.objects[object.id] = nil
end

function Scene:init(sm)
    
end

function Scene:update(dt)

end

function Scene:draw()

end

function Scene:check_collision(a, b)
    return a.x < b.x+b.w and
            b.x < a.x+a.w and
            a.y < b.y+b.h and
            b.y < a.y+a.h
end

function Scene:check_dist(a, b, d)
    return math.sqrt((a.x^2-b.x^2)+(a.y^2-b.y^2)) <= d
end

function Scene:check_tags(b, tags)
    tags = tags or {}
    local blocked = false
    for i, tag in ipairs(tags) do
        if b.tag == tag then
            blocked = true
            break
        end
    end
    return blocked
end

function Scene:check(a, tags)
    local cols = {}
    for _, b in pairs(self.objects) do
        if b.col and not self:check_tags(b, tags) then
            if a ~= b and self:check_collision(a, b) then
                table.insert(cols, b)
            end
        end
    end
    return cols
end

function Scene:dist(a, d, tag)
    for _, b in pairs(self.objects) do
        if b.tag == tag then
            if a ~= b and self:check_dist(a, b, d) then
                return b
            end
        end
    end
end

function Scene:move_x(a, x, tags)
    a.x = a.x+x
    local cols = self:check(a, tags)
    for _, c in ipairs(cols) do
        if x > 0 then
            a.x = c.x-a.w
        else
            a.x = c.x+c.w
        end
        return c
    end
    return nil
end

function Scene:move_y(a, y, tags)
    a.y = a.y+y
    local cols = self:check(a, tags)
    for _, c in ipairs(cols) do
        if y > 0 then
            a.y = c.y-a.h
        else
            a.y = c.y+c.h
        end
        return c
    end
    return nil
end

return Scene