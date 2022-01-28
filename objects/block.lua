--Blocks

function blockLoad()
    blocks = {}
    fillthescreenwithgrass()
    wood.new(1,2)
    stone.new(2,2)
    grass.new(3,3)
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

function newBlock(sprite,x,y,hp,flags)
    return {
        x = x,
        y = y,
        sprite = sprite,
        hp = hp,
        flags = flags,

        draw = function()
            spr(tileset,sprite,x*sixteenth,y*sixteenth,false)
        end,

        update = function()
        end,
    }
end

wood = {}
stone = {}
tree = {}
grass = {}

function wood.new(x,y)
    local wood = newBlock(1,x,y,5,{"solid"})

    table.insert(blocks,wood)
end

function stone.new(x,y)
    local stone = newBlock(16,x,y,5,{"solid"})

    table.insert(blocks,stone)
end

function tree.new(x,y)
    local tree = newBlock(3,x,y,5,{"solid"})

    table.insert(blocks,tree)
end

function grass.new(x,y)
    local tree = newBlock(4,x,y,5,{})

    table.insert(blocks,tree)
end

function fillthescreenwithgrass()
    for o=0,31,1 do
        for g = 0,29,1 do
            grass.new(o,g)
        end
    end
end