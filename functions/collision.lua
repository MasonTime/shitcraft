--Collisions

function isSolid(x,y,flags)
    local hit = false
    
    for i,v in ipairs(blocks) do
        if v.x == x and v.y == y then
            for h,j in ipairs(v.flags) do
                if j == "solid" then
                    hit = true
                end
            end
        end
    end

    return hit
end