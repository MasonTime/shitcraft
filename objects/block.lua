--Blocks

function blockLoad()
    blocks = {}

    wood.new(1,2)
    stone.new(2,2)
end

function blockUpdate()

    for i,v in ipairs(blocks) do
        v:update()
    end
end

function blockDraw()
    for i,v in ipairs(blocks) do
        v:draw()
    end
end

function newBlock(sprite,x,y,hp)
    return {
        x = x,
        y = y,
        sprite = sprite,
        hp = hp,

        draw = function()
            spr(tileset,sprite,x*sixteenth,y*sixteenth,false)
        end,

        update = function()
        end,
    }
end

wood = {}
stone = {}

function wood.new(x,y)
    local wood = newBlock(1,x,y,5)

    table.insert(blocks,wood)
end

function stone.new(x,y)
    local stone = newBlock(16,x,y,5)

    table.insert(blocks,stone)
end