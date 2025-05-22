local Object = require("object")

local Sample = Object:new()

function Sample:init(sc, x, y)
    self.sc = sc
    self.tag = "sample"
    self.col = true

    self.x = x
    self.y = y
    self.z = 0
    self.w = 32
    self.h = 32
end

function Sample:draw()
    -- love.graphics.draw(img, self.x, self.y)
    love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
end

function Sample:update(dt)
    
end

return Sample