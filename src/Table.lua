--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

Table = Class{__includes = GameObject}

function Table:init(def, x, y)
    GameObject.init(self, def, x, y)
    
    self.ontop = def.ontop
end

function Table:onCollide(player)
    player.x = player.px
    player.y = player.py
end

function Table:onGrab (player)
    if (not player.carrying == nil and self.ontop == nil) then
        self.ontop = player.carrying
        player.carrying = nil
    elseif (player.carrying == nil and not self.ontop == nil) then
        player.carrying = self.ontop
        self.ontop = nil
    elseif (not player.carrying == nil and not self.ontop == nil and self.ontop:canadd(player.carrying)) then
        local shouldRemove = self.ontop:add(player.carrying)
        player.carrying = nil
        return shouldRemove
    end
end

function Table:update(dt)
    GameObject.update(self, dt)
end

function Table:render(adjacentOffsetX, adjacentOffsetY)
    GameObject.render(self, adjacentOffsetX, adjacentOffsetY)

    if (self.ontop) then
        self.ontop:render(self.x + adjacentOffsetX, self.y + adjacentOffsetY)
    end
end