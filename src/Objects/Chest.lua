--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

Chest = Class{__includes = ActionTable}

function Chest:init(def, state, tableState, x, y)
    ActionTable.init(self, def, x, y)

    self.defaultState = state or def.defaultState
    self.state = self.defaultState
    self.tableState = tableState

    self:getItemfood()
end

function Chest:getItemfood()
    if (self.state == 'cdo') then
        self.item = Doe
        self.food = 'doe'
        self.foodState = 'doe'
    elseif (self.state == 'cst') then
        self.item = Frosting
        self.food = 'frosting'
        self.foodState = 'fst'
    elseif (self.state == 'cch') then
        self.item = Frosting
        self.food = 'frosting'
        self.foodState = 'fch'
    end
end

function Chest:onGrab (player, foods)
    if (player.carrying == nil and self.ontop == nil and self.food) then
        table.insert(foods, self.item(
            GAME_OBJECT_DEFS[self.food],
            self.foodState
        ))

        local food = foods[table.maxn(foods)]
        food.index = table.maxn(foods)

        self.ontop = food
    end
    ActionTable.onGrab(self, player, foods)
end

function Chest:update(dt)
    ActionTable.update(self, dt)
end

function Chest:render(adjacentOffsetX, adjacentOffsetY)
    local table = GAME_OBJECT_DEFS['table']
    love.graphics.draw(gTextures[table.texture], gFrames[table.texture][table.states[self.tableState].frame or self.frame],
        self.x + adjacentOffsetX, self.y + adjacentOffsetY)

    ActionTable.render(self, adjacentOffsetX, adjacentOffsetY)
end