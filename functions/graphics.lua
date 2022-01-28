--Graphics

function spr(image, num ,x,y,f)
    local sx = num * 8
    local sy = 0
    local div = image:getWidth()/64
    if num > 7 then
        sy = num - 8
        sx = sx - sx
    end

    local frame = love.graphics.newQuad(sx*div,sy*div,8*div,8*div,image:getDimensions())

    if f == false then love.graphics.draw(image,frame,x,y,0,sixteenth/8/div,sixteenth/8/div)
    elseif f == true then love.graphics.draw(image,frame,x+sixteenth,y,0,(sixteenth/8*-1)/div,(sixteenth/8)/div) end
end