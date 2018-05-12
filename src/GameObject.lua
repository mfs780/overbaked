--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

GameObject = Class{}

function GameObject:init(def, x, y)
    self.texture = def.texture
    self.frame = def.frame or 1

    self.defaultState = def.defaultState
    self.state = self.defaultState
    self.states = def.states

    self.data = def.data

    -- dimensions
    self.x = x
    self.y = y
    self.width = def.width
    self.height = def.height
end

function GameObject:onCollide()
end

function GameObject:onGrab()
end

function GameObject:update(dt)

end

function GameObject:render(adjacentOffsetX, adjacentOffsetY)
    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.states[self.state].frame or self.frame],
        self.x + adjacentOffsetX, self.y + adjacentOffsetY)
end