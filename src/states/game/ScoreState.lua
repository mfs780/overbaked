--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

ScoreState = Class{__includes = BaseState}

function ScoreState:init()
end

function ScoreState:enter(params)
    self.player = params
end

function ScoreState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    end
end

function ScoreState:render()
    love.graphics.draw(gTextures['background'], 0, 0, 0, 
        VIRTUAL_WIDTH / gTextures['background']:getWidth(),
        VIRTUAL_HEIGHT / gTextures['background']:getHeight())

    -- love.graphics.setFont(gFonts['gothic-medium'])
    -- love.graphics.printf('Legend of', 0, VIRTUAL_HEIGHT / 2 - 32, VIRTUAL_WIDTH, 'center')

    -- love.graphics.setFont(gFonts['gothic-large'])
    -- love.graphics.printf('50', 0, VIRTUAL_HEIGHT / 2 - 16, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['large'])
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.printf('BAKING COMPLETE', 0, 10, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(0, 0, 255, 255)
    love.graphics.printf('BAKING COMPLETE', 1, 11, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['medium'])
    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.printf('Orders Delivered: ' .. tostring(self.player.complete) .. ' x 20 = ' .. tostring(self.player.complete * 20), 0, VIRTUAL_HEIGHT / 2 - 40, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(0, 0, 255, 255)
    love.graphics.printf('Orders Delivered: ' .. tostring(self.player.complete) .. ' x 20 = ' .. tostring(self.player.complete * 20), 1, VIRTUAL_HEIGHT / 2 - 39, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.printf('Tips Recieved: ' .. tostring(self.player.tips), 0, VIRTUAL_HEIGHT / 2 - 20, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.printf('Tips Recieved: ' .. tostring(self.player.tips), 1, VIRTUAL_HEIGHT / 2 - 19, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.printf('Orders Missed: ' .. tostring(self.player.missed) .. ' x 10 = ' .. tostring(self.player.missed * 10), 0, VIRTUAL_HEIGHT / 2 - 0, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.printf('Orders Missed: ' .. tostring(self.player.missed) .. ' x 10 = ' .. tostring(self.player.missed * 10), 1, VIRTUAL_HEIGHT / 2 + 1, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(0, 0, 0, 255)
    love.graphics.printf('Total: ' .. tostring(self.player.score), 0, VIRTUAL_HEIGHT / 2 + 20, VIRTUAL_WIDTH, 'center')
    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.printf('Total: ' .. tostring(self.player.score), 1, VIRTUAL_HEIGHT / 2 + 21, VIRTUAL_WIDTH, 'center')

    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.setFont(gFonts['zelda-small'])
    love.graphics.printf('Press Enter', 0, VIRTUAL_HEIGHT / 2 + 64, VIRTUAL_WIDTH, 'center')
end