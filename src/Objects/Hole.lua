--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

Hole = Class{__includes = ActionTable}

function Hole:init(def, x, y)
    ActionTable.init(self, def, x, y)
end

function Hole:onGrab (player, foods)
    if (player.carrying and player.carrying.ingredients) then
        player.carrying.ingredients = {}
        player.carrying.state = 'pen'
    elseif (player.carrying) then
        table.remove(foods, player.carrying.index)
        player.carrying = nil
    end
end

function Hole:update(dt)
    ActionTable.update(self, dt)
end

function Hole:render(adjacentOffsetX, adjacentOffsetY)
    ActionTable.render(self, adjacentOffsetX, adjacentOffsetY)
end