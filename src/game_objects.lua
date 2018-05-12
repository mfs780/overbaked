--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

GAME_OBJECT_DEFS = {
    ['table'] = {
        texture = 'kitchen',
        frame = 2,
        width = 16,
        height = 16,
        defaultState = 'tts',
        states = {
            ['ttl'] = {
                frame = 1
            },
            ['tts'] = {
                frame = 2
            },
            ['ttr'] = {
                frame = 3
            },
            ['tls'] = {
                frame = 6
            },
            ['trs'] = {
                frame = 8
            },
            ['tbl'] = {
                frame = 11
            },
            ['tbs'] = {
                frame = 12
            },
            ['tbr'] = {
                frame = 13
            }
        }
    },
    ['chest'] = {
        texture = 'kitchen',
        frame = 26,
        width = 16,
        height = 16,
        defaultState = 'cdo',
        data = 'tts',
        states = {
            ['cdo'] = {
                frame = 26
            },
            ['cst'] = {
                frame = 14
            },
            ['cch'] = {
                frame = 15
            }
        }
    },
    ['hole'] = {
        texture = 'kitchen',
        frame = 21,
        width = 16,
        height = 16,
        defaultState = 'hol',
        states = {
            ['hol'] = {
                frame = 21
            }
        }
    },
    ['knead'] = {
        action = 'knead',
        texture = 'kitchen',
        frame = 16,
        width = 16,
        height = 16,
        defaultState = 'knd',
        states = {
            ['knd'] = {
                frame = 16
            }
        }
    },
    ['oven'] = {
        action = 'bake',
        texture = 'kitchen',
        frame = 16,
        width = 16,
        height = 16,
        defaultState = 'oof',
        states = {
            ['oof'] = {
                frame = 4
            },
            ['oon'] = {
                frame = 5
            }
        }
    },
    ['frosting'] = {
        texture = 'kitchen',
        frame = 9,
        width = 16,
        height = 16,
        defaultState = 'fst',
        states = {
            ['fst'] = {
                frame = 9
            },
            ['fch'] = {
                frame = 10
            }
        }
    },
    ['doe'] = {
        texture = 'kitchen',
        frame = 27,
        width = 16,
        height = 16,
        defaultState = 'doe',
        states = {
            ['doe'] = {
                frame = 27
            },
            ['don'] = {
                frame = 28
            }
        }
    },
    ['plate'] = {
        texture = 'kitchen',
        frame = 17,
        width = 16,
        height = 16,
        defaultState = 'doe',
        states = {
            ['pen'] = {
                frame = 17
            },
            ['pvn'] = {
                frame = 18
            },
            ['psn'] = {
                frame = 19
            },
            ['pcn'] = {
                frame = 20
            },
            ['pvb'] = {
                frame = 23
            },
            ['psb'] = {
                frame = 24
            },
            ['pcb'] = {
                frame = 25
            }
        }
    },
}