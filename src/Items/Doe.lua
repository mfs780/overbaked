--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

Doe = Class{__includes = Item}

function Doe:init(def)
    Item.init(self, def)
end

function Doe:canAction (action)
    return (action == 'knead' and self.state == 'doe')
end

function Doe:doAction ()
    self.state = 'don'
end

function Doe:update(dt)
    Item.update(self, dt)
end

function Doe:render(x, y)
    Item.render(self, x, y)
end