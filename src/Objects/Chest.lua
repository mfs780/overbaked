--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

Chest = Class{__includes = ActionTable}

function Chest:init(def, x, y)
    ActionTable.init(self, def, x, y)
end

function Chest:onGrab (player, foods)
    print('chest grab')
    if (player.carrying == nil and self.ontop == nil) then
        table.insert(foods, Item(
            GAME_OBJECT_DEFS[self.data]
        ))

        local food = foods[table.maxn(foods)]
        food.index = table.maxn(foods)

        self.ontop = food
    end
end

function Chest:update(dt)
    ActionTable.update(self, dt)
end

function Chest:render(adjacentOffsetX, adjacentOffsetY)
    ActionTable.render(self, adjacentOffsetX, adjacentOffsetY)
end