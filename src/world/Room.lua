--[[
    OverBaked

    Author: Mohammad Fahad Sheikh
    fahadsheikh780@gmail.com
]]

Room = Class{}

function Room:init(player)
    self.width = MAP_WIDTH
    self.height = MAP_HEIGHT

    -- used for centering the dungeon rendering
    self.renderOffsetX = MAP_RENDER_OFFSET_X
    self.renderOffsetY = MAP_RENDER_OFFSET_Y

    -- used for drawing when this room is the next room, adjacent to the active
    self.adjacentOffsetX = 0
    self.adjacentOffsetY = 0

    -- reference to player for collisions, etc.
    self.player = player

    self.player.room = self

    self.orders = {'pvb', 'psb', 'pcb'}

    self.orderTimer = 3

    self.foods = {}

    self.tiles = {}
    self:generateWallsAndFloors()

    self.map = {}
    self.layout = {
        {"emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp"},
        {"emp", "ttl", "tts", "cdo", "tts", "tts", "tts", "tts", "tts", "oof", "tts", "oof", "tts", "oof", "tts", "tts", "tts", "tts", "tts", "tts", "ttr", "emp"},
        {"emp", "tls", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "trs", "emp"},
        {"emp", "tls", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "trs", "emp"},
        {"emp", "tls", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "trs", "emp"},
        {"emp", "tls", "emp", "emp", "tts", "tts", "tts", "tts", "tts", "pen", "tts", "pen", "tts", "pen", "tts", "tts", "tts", "tts", "emp", "emp", "trs", "emp"},
        {"emp", "tls", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "doe", "emp", "emp", "emp", "trs", "emp"},
        {"emp", "fin", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "trs", "emp"},
        {"emp", "tls", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "hol", "emp"},
        {"emp", "tbl", "tbs", "tbs", "knd", "tbs", "knd", "tbs", "tbs", "tbs", "tbs", "tbs", "tbs", "tbs", "cst", "tbs", "cch", "tbs", "tbs", "tbs", "tbr", "emp"},
        {"emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp", "emp"}
    }
    self:generateMap()
end

--[[
    Randomly creates an assortment of obstacles for the player to navigate around.
]]
function Room:generateMap()
    for y = 1, self.height do
        for x = 1, self.width do
            local tile = self.layout[y][x]
            local first = string.sub(tile, 1, 1)

            -- Base Tables
            
            if first == 't' then
                table.insert(self.map, Table(
                    GAME_OBJECT_DEFS['table'],
                    tile,
                    (x - 1) * TILE_SIZE + self.renderOffsetX + self.adjacentOffsetX,
                    (y - 1) * TILE_SIZE + self.renderOffsetY + self.adjacentOffsetY
                ))
            end

            if first == 'c' then
                table.insert(self.map, Chest(
                    GAME_OBJECT_DEFS['chest'],
                    tile,
                    self:getBaseTable(x, y),
                    (x - 1) * TILE_SIZE + self.renderOffsetX + self.adjacentOffsetX,
                    (y - 1) * TILE_SIZE + self.renderOffsetY + self.adjacentOffsetY
                ))
            end

            if first == 'f' then
                table.insert(self.map, Finish(
                    GAME_OBJECT_DEFS['finish'],
                    tile,
                    self:getBaseTable(x, y),
                    (x - 1) * TILE_SIZE + self.renderOffsetX + self.adjacentOffsetX,
                    (y - 1) * TILE_SIZE + self.renderOffsetY + self.adjacentOffsetY
                ))
            end

            if first == 'h' then
                table.insert(self.map, Hole(
                    GAME_OBJECT_DEFS['hole'],
                    (x - 1) * TILE_SIZE + self.renderOffsetX + self.adjacentOffsetX,
                    (y - 1) * TILE_SIZE + self.renderOffsetY + self.adjacentOffsetY
                ))
            end

            if first == 'k' then
                table.insert(self.map, Knead(
                    GAME_OBJECT_DEFS['knead'],
                    nil,
                    self:getBaseTable(x, y),
                    (x - 1) * TILE_SIZE + self.renderOffsetX + self.adjacentOffsetX,
                    (y - 1) * TILE_SIZE + self.renderOffsetY + self.adjacentOffsetY
                ))
            end

            if first == 'o' then
                table.insert(self.map, Oven(
                    GAME_OBJECT_DEFS['oven'],
                    (x - 1) * TILE_SIZE + self.renderOffsetX + self.adjacentOffsetX,
                    (y - 1) * TILE_SIZE + self.renderOffsetY + self.adjacentOffsetY
                ))
            end

            if first == 'p' then
                table.insert(self.map, Table(
                    GAME_OBJECT_DEFS['table'],
                    self:getBaseTable(x, y),
                    (x - 1) * TILE_SIZE + self.renderOffsetX + self.adjacentOffsetX,
                    (y - 1) * TILE_SIZE + self.renderOffsetY + self.adjacentOffsetY
                ))

                local ptable = self.map[table.maxn(self.map)]
                table.insert(self.foods, Plate(
                    GAME_OBJECT_DEFS['plate'],
                    tile
                ))

                local food = self.foods[table.maxn(self.foods)]
                food.index = table.maxn(self.foods)

                ptable.ontop = food
            end
        end
    end
end

function Room:getBaseTable(x, y)
    if (string.sub(self.layout[y][x - 1], 1, 1) == 't') then
        return self.layout[y][x - 1]
    elseif (string.sub(self.layout[y][x + 1], 1, 1) == 't') then 
        return self.layout[y][x + 1]
    elseif (string.sub(self.layout[y - 1][x], 1, 1) == 't') then 
        return self.layout[y - 1][x]
    elseif (string.sub(self.layout[y + 1][x], 1, 1) == 't') then 
        return self.layout[y + 1][x]
    end
    return 'tts'
end

--[[
    Generates the walls and floors of the room, randomizing the various varieties
    of said tiles for visual variety.
]]
function Room:generateWallsAndFloors()

    for y = 1, self.height do
        table.insert(self.tiles, {})

        for x = 1, self.width do
            local id = TILE_EMPTY

            if x == 1 and y == 1 then
                id = TILE_TOP_LEFT_CORNER
            elseif x == 1 and y == self.height then
                id = TILE_BOTTOM_LEFT_CORNER
            elseif x == self.width and y == 1 then
                id = TILE_TOP_RIGHT_CORNER
            elseif x == self.width and y == self.height then
                id = TILE_BOTTOM_RIGHT_CORNER
            
            -- random left-hand walls, right walls, top, bottom, and floors
            elseif x == 1 then
                id = TILE_LEFT_WALLS[math.random(#TILE_LEFT_WALLS)]
            elseif x == self.width then
                id = TILE_RIGHT_WALLS[math.random(#TILE_RIGHT_WALLS)]
            elseif y == 1 then
                id = TILE_TOP_WALLS[math.random(#TILE_TOP_WALLS)]
            elseif y == self.height then
                id = TILE_BOTTOM_WALLS[math.random(#TILE_BOTTOM_WALLS)]
            else
                id = TILE_FLOORS[math.random(#TILE_FLOORS)]
            end
            
            table.insert(self.tiles[y], {
                id = id
            })
        end
    end
end

function Room:update(dt)
    self.player:update(dt)

    for k, object in pairs(self.map) do
        object:update(dt)

        -- trigger collision callback on object
        if self.player:collides(object) then
            object:onCollide(self.player)
        end

        if self.player.action and self.player:actionable(object) then
            object:onAction(self.player)
        end

        if self.player.grab and self.player:actionable(object) then
            object:onGrab(self.player, self.foods)
        end
    end

    self.player.action = false
    self.player.grab = false

    self.orderTimer = self.orderTimer - dt
    if (self.orderTimer <= 0) then
        table.insert(self.player.orders, Plate(
            GAME_OBJECT_DEFS['plate'],
            self.orders[math.random(3)]
        ))
        self.orderTimer = 10
    end

    for k, object in pairs(self.player.orders) do
        object.x = object.x + (10 * dt)

        if (object.x > VIRTUAL_WIDTH - 19) then
            table.remove(self.player.orders, k)
            self.player.score = self.player.score - 10
            self.player.missed = self.player.missed + 1

            if (self.player.score < 0) then
                self.player.score = 0
            end
        end
    end
end

function Room:render()
    for y = 1, self.height do
        for x = 1, self.width do
            local tile = self.tiles[y][x]
            love.graphics.draw(gTextures['tiles'], gFrames['tiles'][tile.id],
                (x - 1) * TILE_SIZE + self.renderOffsetX + self.adjacentOffsetX, 
                (y - 1) * TILE_SIZE + self.renderOffsetY + self.adjacentOffsetY)
        end
    end

    for k, object in pairs(self.map) do
        object:render(self.adjacentOffsetX, self.adjacentOffsetY)
    end


    if self.player then
        self.player:render()
    end

    for k, object in pairs(self.player.orders) do
        object:render(VIRTUAL_WIDTH - 19 - math.floor(object.x), 2)
    end
end