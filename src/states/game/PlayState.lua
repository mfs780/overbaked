--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

PlayState = Class{__includes = BaseState}

function PlayState:init()
    self.player = Player {
        animations = ENTITY_DEFS['player'].animations,
        walkSpeed = ENTITY_DEFS['player'].walkSpeed,
        
        x = VIRTUAL_WIDTH / 2 - 8,
        y = VIRTUAL_HEIGHT / 2 - 1,
        
        width = 16,
        height = 22,

        -- rendering and collision offset for spaced sprites
        offsetY = 5,

        bumped = false,

        score = 0
    }

    self.currentRoom = Room(self.player)

    self.player.stateMachine = StateMachine {
        ['walk'] = function() return PlayerWalkState(self.player) end,
        ['idle'] = function() return PlayerIdleState(self.player) end
    }
    self.player:changeState('idle')

    self.gameTimer = 120
end

function PlayState:enter(params)

end

function PlayState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    self.currentRoom:update(dt)

    self.gameTimer = self.gameTimer - dt
    if (self.gameTimer <= 0) then
        gStateMachine:change('score', self.player)
    end
end

function PlayState:render()
    -- render dungeon and all entities separate from hearts GUI
    love.graphics.push()
    self.currentRoom:render()
    love.graphics.pop()

    
    love.graphics.setFont(gFonts['medium'])
    love.graphics.setColor(255, 215, 0, 255)
    love.graphics.printf(self.player.score, 10, VIRTUAL_HEIGHT - 18, 100, 'left')
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.printf(self.player.score, 11, VIRTUAL_HEIGHT - 18, 100, 'left')
    love.graphics.printf(math.floor(self.gameTimer), VIRTUAL_WIDTH - 40, VIRTUAL_HEIGHT - 18, 100, 'left')
end