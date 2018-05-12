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

    self.ingredients = {}
end

function Item:doAction()
    print ('item do action')
end

function Item:canAdd()
end

function Item:hasIngredient(foodState)
    return self.ingredients[foodState] ~= nil
end

function Item:add(player, foods)
    self.ingredients[player.carrying.state] = player.carrying
    table.remove(foods, player.carrying.index)
    player.carrying = nil
end

function Item:canAction()
    print('base on collide')
end

function Item:update(dt)

end

function Item:render(x, y)
    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.states[self.state].frame or self.frame],
        x, y)
end