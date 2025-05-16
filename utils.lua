Res = {}
Res.w = 640
Res.h = 360

function Res:init()
    local w, h = love.graphics.getDimensions()
    self.zoom = w/self.w
end

function Res:getX()
    return love.mouse.getX()/self.zoom
end

function Res:getY()
    return love.mouse.getY()/self.zoom
end

function rgb(r, g, b)
    return {r/255, g/255, b/255}
end

function rgba(r, g, b, a)
    return {r/255, g/255, b/255, a}
end