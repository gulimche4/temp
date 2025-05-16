local Scene = require("scenes.scene")

local Game = Scene:new()

function Game:init(sm)
    self.sm = sm
    self.objects = {}
end

function Game:draw()
    for _, object in pairs(self.objects) do
        object:draw()
    end
end

function Game:update(dt)
    for _, object in pairs(self.objects) do
        object:update(dt)
    end
end

return Game