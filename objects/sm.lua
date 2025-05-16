local Object = require("object")

local SM = Object:new()

function SM:init()
    SM:load_scene("game")
end

function SM:load_scene(name)
    self.scene = require("scenes."..name):new()
    self.scene:init(self)
end

function SM:draw()
    self.scene:draw()
end

function SM:update(dt)
    dt = dt*60
    if dt > 2 then
        return
    end
    self.scene:update(dt)
end

function SM:keypressed(key)
    if self.scene.keypressed then self.scene:keypressed(key) end
end

function SM:mousepressed(x, y, button)
    if self.scene.mousepressed then self.scene:mousepressed(x, y, button) end
end

return SM