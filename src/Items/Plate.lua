--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

Plate = Class{__includes = Item}

function Plate:init(def, state)
    Item.init(self, def, state)
end

function Plate:canAction (action)
    return (action == 'bake' and not self.state == 'pen')
end

function Plate:update(dt)
    Item.update(self, dt)
end

function Plate:render(x, y)
    Item.render(self, x, y)
end