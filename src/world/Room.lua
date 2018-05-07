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

    self.tiles = {}
    self:generateWallsAndFloors()

    self.map = {}
    self.layout = {
        {"E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E"},
        {"E", "T", "T", "C", "T", "T", "H", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "E"},
        {"E", "T", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "T", "E"},
        {"E", "T", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "T", "E"},
        {"E", "T", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "T", "E"},
        {"E", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "E", "E", "E", "T", "E"},
        {"E", "T", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "T", "E"},
        {"E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "T", "E"},
        {"E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "T", "E"},
        {"E", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "T", "E"},
        {"E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E"}
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
            
            if tile == 'T' then
                table.insert(self.map, GameObject(
                    GAME_MAP_DEFS['table'],
                    (x - 1) * TILE_SIZE + self.renderOffsetX + self.adjacentOffsetX,
                    (y - 1) * TILE_SIZE + self.renderOffsetY + self.adjacentOffsetY
                ))

                local wall = self.map[table.maxn(self.map)]

                -- left: x > && y >= && <= Y + TILE_SIZE
                -- 
                wall.onCollide = function()
                    self.player.x = self.player.px
                    self.player.y = self.player.py
                end
            end

            if tile == 'C' then
                table.insert(self.map, GameObject(
                    GAME_MAP_DEFS['chest'],
                    (x - 1) * TILE_SIZE + self.renderOffsetX + self.adjacentOffsetX,
                    (y - 1) * TILE_SIZE + self.renderOffsetY + self.adjacentOffsetY
                ))

                local chest = self.map[table.maxn(self.map)]

                -- left: x > && y >= && <= Y + TILE_SIZE
                -- 
                chest.onCollide = function()
                    print(self.player.action)
                    self.player.x = self.player.px
                    self.player.y = self.player.py
                end
            end

            if tile == 'H' then
                table.insert(self.map, GameObject(
                    GAME_MAP_DEFS['hole'],
                    (x - 1) * TILE_SIZE + self.renderOffsetX + self.adjacentOffsetX,
                    (y - 1) * TILE_SIZE + self.renderOffsetY + self.adjacentOffsetY
                ))

                local hole = self.map[table.maxn(self.map)]

                -- left: x > && y >= && <= Y + TILE_SIZE
                -- 
                hole.onCollide = function()
                    self.player.x = self.player.px
                    self.player.y = self.player.py
                end
            end
        end
    end
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
            object:onCollide()
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
end