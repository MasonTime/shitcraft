--Main

require"functions/collision"
require "functions/graphics"
require "objects/player"
require "objects/block"

function love.load()
    sixteenth = love.graphics.getWidth()/16
    tileset = love.graphics.newImage("graphics/tile.png")
    tileset:setFilter("nearest","nearest")

    blockLoad()
    playerLoad()
end

function love.update(dt)
    blockUpdate()
    playerUpdate()
end


function love.draw()
    blockDraw()
    playerDraw()
end

--test to see if the repo on github is working