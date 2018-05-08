--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

Player = Class{__includes = Entity}

function Player:init(def)
    Entity.init(self, def)
    
    self.carrying = nil

    self.room = nil
end

function Player:update(dt)
    Entity.update(self, dt)
end

function Player:collides(target)
    local selfY, selfHeight = self.y + self.height / 2, self.height - self.height / 2
    
    return not (self.x + self.width < target.x or self.x > target.x + target.width or
                selfY + selfHeight < target.y or selfY > target.y + target.height)
end

function Player:checkActionCollidesY(target, x, y)
    local selfY, selfHeight = self.y + self.height / 2, self.height - self.height / 2
    local selfX, selfWidth = self.x + self.width / 2, self.width - self.width / 1.1
    
    return not (selfX + selfWidth < x or selfX > x + target.width or
                selfY + selfHeight < y or selfY > y + target.height)
end

function Player:checkActionCollidesX(target, x, y)
    local selfY, selfHeight = self.y + self.height / 2, self.height - self.height / 1.1
    local selfX, selfWidth = self.x, self.width
    
    return not (selfX + selfWidth < x or selfX > x + target.width or
                selfY + selfHeight < y or selfY > y + target.height)
end

function Player:render()
    Entity.render(self)
end