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

    self:getItemType()
end

function Chest:getItemType()
    print(self.state)
    if (self.state == 'cdo') then
        self.item = Doe
        self.type = 'doe'
        self.typeState = 'doe'
    elseif (self.state == 'cst') then
        self.item = Frosting
        self.type = 'frosting'
        self.typeState = 'fst'
    elseif (self.state == 'cch') then
        self.item = Frosting
        self.type = 'frosting'
        self.typeState = 'fch'
    end
end

function Chest:onGrab (player, foods)
    print(self.type, self.typeState)
    if (player.carrying == nil and self.ontop == nil and self.type) then
        print('chest grab')
        table.insert(foods, self.item(
            GAME_OBJECT_DEFS[self.type],
            self.typeState
        ))

        local food = foods[table.maxn(foods)]
        food.index = table.maxn(foods)

        self.ontop = food
    end
    print('chest grab on top', self.ontop)
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