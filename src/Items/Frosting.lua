--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

Frosting = Class{__includes = Item}

function Frosting:init(def, state)
    Item.init(self, def)
    self.state = state
end

function Frosting:canAction (action)
    return false
end