--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

Oven = Class{__includes = ActionTable}

function Oven:init(def, x, y)
    ActionTable.init(self, def, x, y)

    self.cookingTimer = 1
end

function Oven:onAction (player)
end

function Oven:update(dt)
    ActionTable.update(self, dt)

    if (self.ontop) then
        self.state = 'oon'
        cookingTimer = cookingTimer - dt
        if cookingTimer <= 0 then
            self.ontop:doAction(self.action)
            local leftover = math.abs(cookingTimer)
            cookingTimer = 1 - leftover
        end
    else 
        self.state = 'oof'
    end
end

function Oven:render(adjacentOffsetX, adjacentOffsetY)
    if (self.ontop) then
        self.ontop:render(self.x + adjacentOffsetX, self.y + adjacentOffsetY)
    end

    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.states[self.state].frame or self.frame],
        self.x + adjacentOffsetX, self.y + adjacentOffsetY)
end