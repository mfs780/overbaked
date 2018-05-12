--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

Finish = Class{__includes = ActionTable}

function Finish:init(def, state, tableState, x, y)
    ActionTable.init(self, def, x, y)

    self.defaultState = state or def.defaultState
    self.state = self.defaultState
    self.tableState = tableState
end

function Finish:onGrab (player, foods)
    if (player.carrying and player.carrying.ingredients and (player.carrying.state == 'pvb' or player.carrying.state == 'psb' or player.carrying.state == 'pcb')) then

        local removeIndex = nil
        for k, object in pairs(player.orders) do
            if (removeIndex == nil and object.state == player.carrying.state) then
                player.score = player.score + 20 + math.floor((object.x / (VIRTUAL_WIDTH)) * 10)
                player.complete = player.complete + 1
                player.tips = player.tips + math.floor((object.x / (VIRTUAL_WIDTH)) * 10)
                removeIndex = k
            end
        end

        if (player.orders[removeIndex] ~= nil and removeIndex > 0) then
            table.remove(player.orders, removeIndex)
        end

        player.carrying.ingredients = {}
        player.carrying.state = 'pen'
    end
end

function Finish:update(dt)
    ActionTable.update(self, dt)
end

function Finish:render(adjacentOffsetX, adjacentOffsetY)
    local table = GAME_OBJECT_DEFS['table']
    love.graphics.draw(gTextures[table.texture], gFrames[table.texture][table.states[self.tableState].frame or self.frame],
        self.x + adjacentOffsetX, self.y + adjacentOffsetY)

    ActionTable.render(self, adjacentOffsetX, adjacentOffsetY)
end