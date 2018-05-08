--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

PlayerIdleState = Class{__includes = EntityIdleState}

function PlayerIdleState:enter(params)
    -- render offset for spaced character sprite
    self.entity.offsetY = 5
    self.entity.offsetX = 0
end

function PlayerIdleState:update(dt)
    EntityIdleState.update(self, dt)
end

function PlayerIdleState:update(dt)
    if love.keyboard.isDown('left') or love.keyboard.isDown('right') or
       love.keyboard.isDown('up') or love.keyboard.isDown('down') then
        self.entity:changeState('walk')
    end

    if love.keyboard.wasPressed('z') then
        self.entity.action = true
        -- self.entity:changeState('swing-sword')
    end

    if love.keyboard.wasPressed('x') then
        self.entity.grab = true
        -- self.entity:changeState('swing-sword')
    end
end