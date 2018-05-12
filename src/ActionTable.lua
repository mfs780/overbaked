--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

ActionTable = Class{__includes = Table}

function ActionTable:init(def, x, y)
    Table.init(self, def, nil, x, y)

    self.action = def.action
end


function ActionTable:onGrab (player, foods)
    if (player.carrying and player.carrying:canAction(self.action) and self.ontop == nil) then
        Table.onGrab(self, player, foods)
    elseif (player.carrying == nil and self.ontop) then
        Table.onGrab(self, player, foods)
        self.actionNumber = 0
    end
end

function ActionTable:onAction (player)
    if (player.carrying == nil and self.ontop and self.ontop:canAction(self.action)) then
        self.actionNumber = self.actionNumber + 1

        if (self.actionNumber >= self.actionLimit) then
            self.ontop:doAction(self.action)
            self.actionNumber = 0
        end
    end
end

function ActionTable:update(dt)
    Table.update(self, dt)
end

function ActionTable:render(adjacentOffsetX, adjacentOffsetY)
    Table.render(self, adjacentOffsetX, adjacentOffsetY)
end