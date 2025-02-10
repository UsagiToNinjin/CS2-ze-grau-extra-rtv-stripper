function GlitchCredits()
    local count = math.random(4, 9)
    local title = { "T", "e", "m", "p", "e", "s", "t", "i", "s", "s", "i", "m", "o" }
    local ascii = { "!", "\"", "#", "$", "%", "&", "'", "(", ")", "*", "+", ",", "-", "_", "/", ":", ";", "<", "=", ">", "?", "@" }

    for i = 1, count do
        local char = math.random(1, #title)
        title[char] = ascii[math.random(1, #ascii)]
    end

    local ent = Entities:FindByName(nil, "world_text_credit_MUSIC4")
    local text = table.concat(title, "")
    ent:SetKeyValue("message", text)
end

function SpawnRandomGear()
    local arc = math.random(0, 360)
    local vec = Vector(-5784 + 1280 * math.cos(math.rad(arc)) * math.random(), 
                       -10760 + 1280 * math.sin(math.rad(arc)) * math.random(), 
                       -9588)
    local ang = Vector(0.0, math.random(0.0, 360.0), 0.0)

    local index = math.random(1, 8)
    local ent = Entities:FindByName(nil, "st3_last_maker_gear" .. index)
    ent:SpawnEntityAtLocation(vec, ang)
end

function SpawnLaser()
    local arc = math.random(0, 360)
    local vec = Vector(-5784 + 176 * math.cos(math.rad(arc)), 
                       -10760 + 176 * math.sin(math.rad(arc)), 
                       -11744)
    local vec_r = Vector(-5784 - 172 * math.cos(math.rad(arc)), 
                         -10760 - 172 * math.sin(math.rad(arc)), 
                         -11744)

    local ent = Entities:FindByName(nil, "rtv_maker_1")
    ent:SpawnEntityAtLocation(vec, Vector(0.0, arc, 0.0))

    ent = Entities:FindByName(nil, "rtv_maker_2")
    ent:SpawnEntityAtLocation(vec_r, Vector(0.0, arc + 180.0, 0.0))
end

function SpawnCube()
    local arc = math.random(0, 360)
    local vec = Vector(-5784 + 1280 * math.cos(math.rad(arc)), 
                       -10760 + 1280 * math.sin(math.rad(arc)), 
                       -11564)

    local ent = Entities:FindByName(nil, "rtv_ta_cube_maker")
    ent:SpawnEntityAtLocation(vec, Vector(0.0, 0.0, 0.0))
    ent:SetAngles(0.0, arc, 0.0)
end

function SetCubePathOrigin()
    local ent = Entities:FindByName(nil, "rtv_ta_cube_maker")
    local vec_r = ent:GetAngles()
    ent:SetAngles(0.0, 0.0, 0.0)

    local arc = math.random(vec_r.y + 60.0, vec_r.y + 240.0)
    local vec = Vector(-5784 + 1280 * math.cos(math.rad(arc)), 
                       -10760 + 1280 * math.sin(math.rad(arc)), 
                       -11564)

    self:SetOrigin(vec)
end

function SpawnSatelite()
    local arc = math.random(0, 360)
    local vec = Vector(-5784 + 1024 * math.cos(math.rad(arc)) * math.random(0.12, 1.0), 
                       -10760 + 1024 * math.sin(math.rad(arc)) * math.random(0.12, 1.0), 
                       -11588)

    local ent = Entities:FindByName(nil, "rtv_ta_satelite_smoke_maker")
    ent:SpawnEntityAtLocation(vec, Vector(0.0, 0.0, 0.0))
end

function SpawnMultiCircles()
    local ent = Entities:FindByName(nil, "rtv_rng_circle_maker")

    for i = 1, 5 do
        local arc = math.random(0, 360)
        local vec = Vector(-5784 + 1088 * math.cos(math.rad(arc)) * math.random(0.15, 1.0), 
                           -10760 + 1088 * math.sin(math.rad(arc)) * math.random(0.15, 1.0), 
                           -11600)

        ent:SpawnEntityAtLocation(vec, Vector(0.0, 0.0, 0.0))
    end
end
