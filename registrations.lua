
-- Color lamps
--
local lamp_colors = {
	"white",
	"blue",
	"orange",
	"red",
	"violet",
	"yellow",
	"cyan",
	"green",
	"magenta",
	"pink"
}


local lamp_frames = {
	{"wood", "Wood"},
	{"medieval_obsidian", "Medieval Obsidian"},
	{"floral_obsidian", "Floral Obsidian"},
}

for _, color in ipairs(lamp_colors) do
    lamps.register_base(color, {
        description = color:gsub("^%l", string.upper) .. " Lamp",
        tiles = {"lamps_" .. color .. "_lamp.png"},
    })
end

for _, frame_table in ipairs(lamp_frames) do
    local def = {
        description = frame_table[2],
        texture = "lamps_" .. frame_table[1] .. "_frame.png",
    }
    local opacity = frame_table[3]
    if opacity ~= nil then
        def.opacity = opacity
    end
    lamps.register_frame(frame_table[1], def)
end

lamps.register_lamps()

-- crafts
for _, color in ipairs(lamp_colors) do
    -- base lamp recipe
    minetest.register_craft({
        output = "lamps:"..color.."_lamp 9",
        recipe = {
            {"default:glass", "default:glass", "default:glass"},
            {"dye:" .. color, "default:mese_crystal", "dye:" .. color},
            {"default:glass", "default:glass", "default:glass"},
        }
    })

    for _, frame_table in ipairs(lamp_frames) do
        local material = ""
        local material_pattern = "+"
        local recipe = {
            {"", "", ""},
            {"", "lamps:" .. color .. "_lamp", ""},
            {"", "", ""}
        }

        if frame_table[1] == "wood" then
            material = "default:stick"
        elseif frame_table[1] == "floral_obsidian" then
            material = "default:obsidian_shard"
        elseif frame_table[1] == "medieval_obsidian" then
            material = "default:obsidian_shard"
            material_pattern = "x"
        end

        if material_pattern == "+" then
            recipe[1][2] = material
            recipe[2][1] = material
            recipe[2][3] = material
            recipe[3][2] = material
        elseif material_pattern == "x" then
            recipe[1][1] = material
            recipe[1][3] = material
            recipe[3][1] = material
            recipe[3][3] = material
        end

        minetest.register_craft({
            output = "lamps:" .. frame_table[1] .. "_" .. color .. "_lamp",
            recipe = recipe
        })
    end
end