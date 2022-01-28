--Collisions

function isSolid(x,y)
    local hit = false

    for i,v in ipairs(blocks) do
        if v.x == x and v.y == y then
            hit = true
        end
    end

    return hit
end