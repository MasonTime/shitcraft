--Graphics

function spr(image, num ,x,y,f)
    local sx = num * 8
    local sy = 0

    if num > 7 then
        sy = num - 8
        sx = sx - sx
    end

    local frame = love.graphics.newQuad(sx,sy,8,8,image:getDimensions())

    if f == false then love.graphics.draw(image,frame,x,y,0,sixteenth/8,sixteenth/8)
    elseif f == true then love.graphics.draw(image,frame,x+sixteenth,y,0,sixteenth/8*-1,sixteenth/8) end
end