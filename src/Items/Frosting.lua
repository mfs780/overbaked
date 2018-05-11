--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

Frosting = Class{__includes = Item}

function Frosting:init(def)
    Item.init(self, def)
end

function Frosting:canAction (action)
    return false
end