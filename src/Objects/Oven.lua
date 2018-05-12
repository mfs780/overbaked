--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

Oven = Class{__includes = ActionTable}

function Oven:init(def, x, y)
    ActionTable.init(self, def, x, y)

    self.cookingTimer = 1
    self.actionLimit = 10
    self.actionNumber = 0
    self.done = false
end

function Oven:onAction (player)
    ActionTable.onAction(self, player)
end

function Oven:update(dt)
    if (self.done == false and self.ontop) then
        self.state = 'oon'
        self.cookingTimer = self.cookingTimer - dt
        if (self.cookingTimer <= 0) then
            self.ontop:doAction(self.action)
            self.done = true
            self.cookingTimer = 1
            self.state = 'ood'
        end
    elseif (self.ontop) then
        self.cookingTimer = self.cookingTimer - dt
        if self.cookingTimer <= 0 then
            if (self.state == 'ood') then
                self.state = 'oof'
            else
                self.state = 'ood'
            end
            self.cookingTimer = 1
        end
    else
        self.state = 'oof'
        self.done = false
        self.cookingTimer = 10
    end

    ActionTable.update(self, dt)
end

function Oven:render(adjacentOffsetX, adjacentOffsetY)
    if (self.ontop) then
        self.ontop:render(self.x + adjacentOffsetX, self.y + adjacentOffsetY)
    end

    love.graphics.draw(gTextures[self.texture], gFrames[self.texture][self.states[self.state].frame or self.frame],
        self.x + adjacentOffsetX, self.y + adjacentOffsetY)
end