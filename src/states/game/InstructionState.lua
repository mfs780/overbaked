--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

InstructionState = Class{__includes = BaseState}

function InstructionState:init()

end

function InstructionState:enter(params)

end

function InstructionState:update(dt)
    if love.keyboard.wasPressed('escape') then
        love.event.quit()
    end

    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('play')
    end
end

function InstructionState:render()
    love.graphics.draw(gTextures['instructions'], 0, 0, 0, 
        VIRTUAL_WIDTH / gTextures['instructions']:getWidth(),
        VIRTUAL_HEIGHT / gTextures['instructions']:getHeight())

    -- love.graphics.setFont(gFonts['gothic-medium'])
    -- love.graphics.printf('Legend of', 0, VIRTUAL_HEIGHT / 2 - 32, VIRTUAL_WIDTH, 'center')

    -- love.graphics.setFont(gFonts['gothic-large'])
    -- love.graphics.printf('50', 0, VIRTUAL_HEIGHT / 2 - 16, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(gFonts['zelda-small'])
    love.graphics.setColor(255, 0, 0, 255)
    love.graphics.printf('INSTRUCTIONS', 2, 30, VIRTUAL_WIDTH, 'right')

    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.printf('INSTRUCTIONS', 0, 32, VIRTUAL_WIDTH, 'right')

    love.graphics.setColor(255, 255, 255, 255)
    love.graphics.setFont(gFonts['zelda-small'])
    love.graphics.printf('continue', 0, VIRTUAL_HEIGHT / 2 + 75, VIRTUAL_WIDTH, 'center')
end