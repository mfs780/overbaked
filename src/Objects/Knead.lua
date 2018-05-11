--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

Knead = Class{__includes = ActionTable}

function Knead:init(def, state, tableState, x, y)
    ActionTable.init(self, def, x, y)

    self.defaultState = state or def.defaultState
    self.state = self.defaultState
    self.tableState = tableState
end

function Knead:update(dt)
    ActionTable.update(self, dt)
end

function Knead:render(adjacentOffsetX, adjacentOffsetY)
    local table = GAME_OBJECT_DEFS['table']
    love.graphics.draw(gTextures[table.texture], gFrames[table.texture][table.states[self.tableState].frame or self.frame],
        self.x + adjacentOffsetX, self.y + adjacentOffsetY)

        
    ActionTable.render(self, adjacentOffsetX, adjacentOffsetY)
end