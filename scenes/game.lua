local Scene = require("scenes.scene")

local Game = Scene:new()

function Game:init(sm)
    self.sm = sm
    self.objects = {}
end

function Game:draw()
    table.sort(self.objects, function (a, b)
        return a.z < b.zsa
    end)
    for _, object in ipairs(self.objects) do
        object:draw()
    end
end

function Game:update(dt)
    for _, object in ipairs(self.objects) do
        object:update(dt)
    end
end

return Game