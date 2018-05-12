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
    return (action == 'bake' and self.state ~= 'pen')
end

function Plate:doAction()
    print('PLATE ACTION')
    if self.state == 'pcn' then
        self.state = 'pcb'
    elseif self.state == 'pvn' then
        self.state = 'pvb'
    elseif self.state == 'psn' then
        self.state = 'psb'
    end
end

function Plate:canAdd(item)
    local hasDon = Item.hasIngredient(self, 'don')
    local hasFst = Item.hasIngredient(self, 'fst')
    local hasFch = Item.hasIngredient(self, 'fch')
    local canAddDon = hasDon == false and item.state == 'don'
    local canAddFst = hasDon == true and hasFch == false and hasFst == false and item.state == 'fst'
    local canAddFch = hasDon == true and hasFch == false and hasFst == false and item.state == 'fch'
    
    return canAddDon or canAddFst or canAddFch
end

function Plate:add(player, foods)
    Item.add(self, player, foods)
    
    if (Item.hasIngredient(self, 'don')) then
        self.state = 'pvn'
    end
    if (Item.hasIngredient(self, 'fst')) then
        self.state = 'psn'
    end
    if (Item.hasIngredient(self, 'fch')) then
        self.state = 'pcn'
    end
end

function Plate:update(dt)
    Item.update(self, dt)
end

function Plate:render(x, y)
    Item.render(self, x, y)
end