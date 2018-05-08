--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

GAME_OBJECT_DEFS = {
    ['table'] = {
        texture = 'tiles',
        frame = TILE_TABLE,
        width = 16,
        height = 16,
        defaultState = 'table',
        states = {
            ['table'] = {
                frame = TILE_TABLE
            }
        }
    },
    ['chest'] = {
        texture = 'tiles',
        frame = TILE_CHEST,
        width = 16,
        height = 16,
        defaultState = 'chest',
        data = 'pot',
        states = {
            ['chest'] = {
                frame = TILE_CHEST
            }
        }
    },
    ['hole'] = {
        texture = 'tiles',
        frame = TILE_HOLE,
        width = 16,
        height = 16,
        defaultState = 'hole',
        states = {
            ['hole'] = {
                frame = TILE_HOLE
            }
        }
    },
    ['cut'] = {
        action = 'cut',
        texture = 'tiles',
        frame = TILE_HOLE,
        width = 16,
        height = 16,
        defaultState = 'cut',
        states = {
            ['cut'] = {
                frame = TILE_CUT
            }
        }
    },
    ['wash'] = {
        action = 'wash',
        texture = 'tiles',
        frame = TILE_HOLE,
        width = 16,
        height = 16,
        defaultState = 'wash',
        states = {
            ['wash'] = {
                frame = TILE_WASH
            }
        }
    },
    ['pot'] = {
        texture = 'tiles',
        frame = TILE_POT,
        width = 16,
        height = 16,
        defaultState = 'pot',
        states = {
            ['pot'] = {
                frame = TILE_POT
            }
        }
    }
}