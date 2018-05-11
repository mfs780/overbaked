--[[
    GD50
    Legend of Zelda

    Author: Colton Ogden
    cogden@cs50.harvard.edu
]]

Item = Class{}

function Item:init(def, state)
    self.texture = def.texture
    self.frame = def.frame or 1

    self.index = nil

    self.defaultState = state or def.defaultState
    self.state = self.defaultState
    self.states = def.states

    -- dimensions
    self.width = def.width
    self.height = def.height

    -- default empty collision callback
    self.canAdd = function() end -- check add list

    self.add = function() end -- change item based on add list

    self.canAction = function() end -- check action

    self.doAction = function() end -- change frame based on action
end

function Item:update(dt)

end

function Item:render(x, y)
    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.states[self.state].frame or self.frame],
        x, y)
end