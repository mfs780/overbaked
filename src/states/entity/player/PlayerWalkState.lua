--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

PlayerWalkState = Class{__includes = EntityWalkState}

function PlayerWalkState:init(player)
    self.entity = player

    -- render offset for spaced character sprite
    self.entity.offsetY = 5
    self.entity.offsetX = 0

    self.speed = PLAYER_WALK_SPEED
end

function PlayerWalkState:update(dt)
    self.entity.action = false

    if love.keyboard.isDown('lshift') then
        self.speed = PLAYER_RUN_SPEED
        self.entity.speed = PLAYER_RUN_SPEED
    else
        self.speed = PLAYER_WALK_SPEED
        self.entity.speed = PLAYER_WALK_SPEED
    end
    if love.keyboard.isDown('left') then
        self.entity.direction = 'left'
        self.entity:changeAnimation('walk-left')
    elseif love.keyboard.isDown('right') then
        self.entity.direction = 'right'
        self.entity:changeAnimation('walk-right')
    elseif love.keyboard.isDown('up') then
        self.entity.direction = 'up'
        self.entity:changeAnimation('walk-up')
    elseif love.keyboard.isDown('down') then
        self.entity.direction = 'down'
        self.entity:changeAnimation('walk-down')
    else
        self.entity:changeState('idle')
    end

    if love.keyboard.wasPressed('space') then
        self.entity.action = true
        -- self.entity:changeState('swing-sword')
    end

    -- perform base collision detection against walls
    EntityWalkState.update(self, dt)

    -- if we bumped something when checking collision, check any object collisions
    if self.bumped then
        if self.entity.direction == 'left' then
            
            -- temporarily adjust position
            self.entity.x = self.entity.x - self.speed * dt

            -- readjust
            self.entity.x = self.entity.x + self.speed * dt
        elseif self.entity.direction == 'right' then
            
            -- temporarily adjust position
            self.entity.x = self.entity.x + self.speed * dt

            -- readjust
            self.entity.x = self.entity.x - self.speed * dt
        elseif self.entity.direction == 'up' then
            
            -- temporarily adjust position
            self.entity.y = self.entity.y - self.speed * dt

            -- readjust
            self.entity.y = self.entity.y + self.speed * dt
        else
            
            -- temporarily adjust position
            self.entity.y = self.entity.y + self.speed * dt

            -- readjust
            self.entity.y = self.entity.y - self.speed * dt
        end
    end
end