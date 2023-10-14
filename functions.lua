
lamps.register_base = function(base_name, base_definition)
	assert(base_definition.tiles, "base_definition must have a tiles field")
	lamps.bases[base_name] = base_definition
end

lamps.register_frame = function(frame_name, frame_definition)
	assert(frame_definition.texture, "frame_definition must have a texture")
	lamps.frames[frame_name] = frame_definition
end

lamps.register_lamps = function()
	-- Register lamp bases as their own lamp
	for base_name, def in pairs(lamps.bases) do
		minetest.register_node("lamps:"..base_name.."_lamp", {
			description = def.description,
			tiles = def.tiles,
			paramtype = "light",
			light_source = def.light_source or default.LIGHT_MAX,
			groups = {lamp=1, snappy=2, cracky=3, oddly_breakable_by_hand=3},
			sounds = default.node_sound_glass_defaults(),
		})
	end
	-- Register lamps with frames
	for base_name, base_def in pairs(lamps.bases) do
		for frame_name, frame_def in pairs(lamps.frames) do
			local tiles = table.copy(base_def.tiles)
			local texture = frame_def.texture
			if frame_def.opacity ~= nil then
				texture = texture .. "^[opacity:" .. frame_def.opacity
			end
			for i, tile in ipairs(tiles) do
				tiles[i] = tile .. "^" .. texture
			end
			minetest.register_node("lamps:"..frame_name .. "_" .. base_name .. "_lamp", {
				description = frame_def.description .. " ".. base_def.description,
				tiles = tiles,
				paramtype = "light",
				light_source = base_def.light_source or default.LIGHT_MAX,
				groups = {lamp=1, snappy=2, cracky=3, oddly_breakable_by_hand=3},
				sounds = default.node_sound_glass_defaults(),
			})
		end
	end
end

-- for _, color in ipairs(lamp.bases) do
-- 	for __, design in ipairs(lamp_frames) do
-- 		local frame = design[1]
-- 		local frame_desc = design[2]
-- 		local color_desc = color:gsub("^%l", string.upper)

-- 		minetest.register_node("lamps:" .. frame .. "_" .. color .. "_lamp", {
-- 			description = frame_desc .. " " .. color_desc .. " Lamp",
-- 			tiles = {"lamps_"..color.."_lamp.png^lamps_" .. frame .. "_frame.png"},
-- 			paramtype = "light",
-- 			light_source = default.LIGHT_MAX,
-- 			groups = {snappy=2, cracky=3, oddly_breakable_by_hand=3},
-- 			sounds = default.node_sound_glass_defaults(),
-- 		})
-- 	end
-- end
-- 			end
-- 			for _, tile in ipairs(tiles) do
-- 				tile = tile .. frame_def.texture
-- 			end
-- 			minetest.register_node("lamps:" .. frame_name .. "_" .. base_name .. "_lamp", {
-- 				description = frame_def.description .. " " .. base_def.description .. " Lamp",
-- 				tiles = tiles,
-- 				paramtype = "light",
-- 				light_source = base_def.light_source or default.LIGHT_MAX,
-- 				groups = {lamp=1, snappy=2, cracky=3, oddly_breakable_by_hand=3},
-- 				sounds = default.node_sound_glass_defaults(),
-- 			})
-- 		end
-- 	end
-- end


-- -- Adapted from default.register_mesepost
-- function lamps.register_lamppost(name, def)
-- 	minetest.register_craft({
-- 		output = name .. " 4",
-- 		recipe = {
-- 			{'', 'default:glass', ''},
-- 			{'default:mese_crystal', 'default:mese_crystal', 'default:mese_crystal'},
-- 			{'', def.material, ''},
-- 		}
-- 	})

-- 	local post_texture = def.texture .. "^default_mese_post_light_side.png^[makealpha:0,0,0"
-- 	local post_texture_dark = def.texture .. "^default_mese_post_light_side_dark.png^[makealpha:0,0,0"
-- 	-- Allow almost everything to be overridden
-- 	local default_fields = {
-- 		wield_image = post_texture,
-- 		drawtype = "nodebox",
-- 		node_box = {
-- 			type = "fixed",
-- 			fixed = {
-- 				{-2 / 16, -8 / 16, -2 / 16, 2 / 16, 8 / 16, 2 / 16},
-- 			},
-- 		},
-- 		paramtype = "light",
-- 		tiles = {def.texture, def.texture, post_texture_dark, post_texture_dark, post_texture, post_texture},
-- 		use_texture_alpha = "opaque",
-- 		light_source = default.LIGHT_MAX,
-- 		sunlight_propagates = true,
-- 		is_ground_content = false,
-- 		groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
-- 		sounds = default.node_sound_wood_defaults(),
-- 	}
-- 	for k, v in pairs(default_fields) do
-- 		if def[k] == nil then
-- 			def[k] = v
-- 		end
-- 	end

-- 	def.texture = nil
-- 	def.material = nil

-- 	minetest.register_node(name, def)
-- end
