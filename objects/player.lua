--Player file

function playerLoad()
    p = {}

    --position vairables
    p.x = 0
    p.y = 0

    --new position variables
    p.dx = 0
    p.dy = 0

    --sliding animation variables
    p.ox = 0
    p.oy = 0

    --sprite position variables
    p.sx = 0
    p.sy = 0

    --height and width variables
    p.w = sixteenth
    p.h = sixteenth

    --sprite flipping variable
    p.flip = false

    --building position variable
    p.bx = 0
    p.by = 0

    p.bsx = 0
    p.bsy = 0
    --direction variable
    p.dir = "d"

    --inventory
    p.inv = {}
    p.inv[1] = wood
    p.inv[2] = stone
    p.selected = 2
end

function playerUpdate()

    function love.keypressed(key)

        --checks to see if a key was just pressed and then updates the delta position variable and sliding animation variable accordingly
        if key == "d" then
            p.dx = 1
            p.dir = "r"
            if isSolid(p.x+p.dx,p.y+p.dy) ~= true then
                p.ox = p.w * -1
                playerAnimate()
            end
        elseif key == "a" then
            p.dx = -1
            p.dir = "l"
            if isSolid(p.x+p.dx,p.y+p.dy) ~= true then    
                p.ox = p.w
                playerAnimate()
            end
        elseif key == "w" then
            p.dy = -1
            p.dir = "u"
            if isSolid(p.x+p.dx,p.y+p.dy) ~= true then    
                p.oy = p.h
                playerAnimate()
            end
        elseif key == "s" then
            p.dy = 1
            p.dir = "d"
            if isSolid(p.x+p.dx,p.y+p.dy) ~= true then
                p.oy = p.h * -1
                playerAnimate()
            end
        end
        
        --changing what you are holding
        if key == "i" then
            p.selected = p.selected + 1
        elseif key == "u" then
            p.selected = p.selected - 1
        end

        --breaking block
        if key == "j" then
            for i,v in ipairs(blocks) do
                if v.x == p.x + p.bx and v.y == p.y + p.by then
                    print("aaaaaaaa")
                    table.remove(blocks, i)
                end
            end
        end
        
        --adding object
        if key == "k" then
            if  isSolid(p.x + p.bx,p.y + p.by) == false then
                if p.inv[p.selected] ~= nil then
                    p.inv[p.selected].new(p.x+p.bx,p.y+p.by)
                end
            end
        end
    end

    --checking if selected is in parameters
    if p.selected > table.maxn(p.inv) then
        p.selected = table.maxn(p.inv)
    elseif p.selected < 1 then
        p.selected = 1
    end
    --updates the building cross hair
    if p.dir == "r" then
        p.bsx = p.sx+sixteenth
        p.bsy = p.sy

        p.bx = 1
        p.by = 0
    end
    if p.dir == "l" then
        p.bsx = p.sx+-sixteenth
        p.bsy = p.sy

        p.bx = -1
        p.by = 0
    end
    if p.dir == "u" then
        p.bsy = p.sy+-sixteenth
        p.bsx = p.sx

        p.bx = 0
        p.by = -1
    end
    if p.dir == "d" then
        p.bsy = p.sy+sixteenth
        p.bsx = p.sx

        p.bx = 0
        p.by = 1
    end

    --makes the sliding animation slide
    if p.ox < 0 then
        p.ox = p.ox + sixteenth/8
    end
    if p.ox > 0 then
        p.ox = p.ox - sixteenth/8
    end
    if p.oy < 0 then
        p.oy = p.oy + sixteenth/8
    end
    if p.oy > 0 then
        p.oy = p.oy - sixteenth/8
    end

    --sets the new position for the player
    if isSolid(p.x+p.dx,p.y+p.dy) ~= true then
        p.x = p.x + p.dx
        p.y = p.y + p.dy
    end

    --sets the new position for the sprite
    p.sx = p.x*p.w + p.ox
    p.sy = p.y*p.h + p.oy

    --resets the new position variables
    p.dx = 0
    p.dy = 0
end

function playerDraw()
    love.graphics.setColor(255,0,0)
    --love.graphics.rectangle("fill",p.sx,p.sy,p.w,p.h)
    love.graphics.setColor(255,255,255)
    spr(tileset,0,p.sx,p.sy,p.flip)
    spr(tileset,2,p.bsx,p.bsy,false)
    love.graphics.print(p.selected)
end

function playerAnimate()
    if p.flip == true then
        p.flip = false
    elseif p.flip == false then
        p.flip = true
    end
end