--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

Table = Class{__includes = GameObject}

function Table:init(def, state, x, y)
    GameObject.init(self, def, x, y)
    
    if (state) then
        self.defaultState = state or def.defaultState
        self.state = self.defaultState
    end
    self.ontop = def.ontop
end

function Table:onCollide(player)
    player.x = player.px
    player.y = player.py
end

function Table:onAction ()
end

function Table:onGrab (player, foods)
    if (player.carrying and self.ontop == nil) then
        self.ontop = player.carrying
        player.carrying = nil
    elseif (player.carrying == nil and self.ontop) then
        player.carrying = self.ontop
        self.ontop = nil
    elseif (player.carrying and self.ontop and self.ontop:canAdd(player.carrying)) then
        self.ontop:add(player, foods)
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