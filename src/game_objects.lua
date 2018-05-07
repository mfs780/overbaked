--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

GAME_MAP_DEFS = {
    ['table'] = {
        type = 'table',
        texture = 'tiles',
        frame = TILE_TABLE,
        width = 16,
        height = 16,
        solid = false,
        defaultState = 'table',
        states = {
            ['table'] = {
                frame = TILE_TABLE
            }
        }
    },
    ['chest'] = {
        type = 'chest',
        texture = 'tiles',
        frame = TILE_CHEST,
        width = 16,
        height = 16,
        solid = false,
        defaultState = 'chest',
        states = {
            ['chest'] = {
                frame = TILE_CHEST
            }
        }
    },
    ['hole'] = {
        type = 'hole',
        texture = 'tiles',
        frame = TILE_HOLE,
        width = 16,
        height = 16,
        solid = false,
        defaultState = 'hole',
        states = {
            ['hole'] = {
                frame = TILE_HOLE
            }
        }
    },
    ['pot'] = {
        type = 'pot',
        texture = 'tiles',
        frame = TILE_POT,
        width = 16,
        height = 16,
        solid = false,
        defaultState = 'pot',
        states = {
            ['pot'] = {
                frame = TILE_POT
            }
        }
    }
}