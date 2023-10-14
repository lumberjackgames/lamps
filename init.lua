lamps = {}
lamps.bases = {}
lamps.frames = {}

local modpath = minetest.get_modpath("lamps")
dofile(modpath .. "/functions.lua")
dofile(modpath .. "/registrations.lua")


-- local lamp_post_materials = {
-- 	["default:wood"] = {"orange", "yellow", "green", "red", "cyan"},
-- 	["default:pine_wood"] = {"white", "orange", "yellow", "green", "pink"},
-- 	["default:acacia_wood"] = {"white", "orange", "purple", "pink", "magenta"},
-- 	["default:aspen_wood"] = {"white", "orange", "blue", "purple", "cyan"},
-- 	["default:junglewood"] = {"green", "purple", "cyan", "red", "orange", "blue"}
-- }

-- for material, color_options in pairs(lamp_post_materials) do
-- 	local material_name = string.match(material, ":(.*)")
-- 	local base_texture = "default_fence_" .. material_name .. ".png"
-- 	for _, color in ipairs(color_options) do
-- 		local color_overlay = "lamps_post_" .. color .. ".png^lamps_post_wood_frame.png"
-- 		local post_name = "lamps:post_"..color.."_"..material_name
-- 		local post_def = {
-- 			description = "Lamp Post",
-- 			tiles = {base_texture, base_texture,
-- 				base_texture.."^"..color_overlay.."^lamps_post_dark_side.png",
-- 				base_texture.."^"..color_overlay.."^lamps_post_dark_side.png",
-- 				base_texture.."^"..color_overlay,
-- 				base_texture.."^"..color_overlay
-- 			},
-- 			drawtype = "nodebox",
-- 			node_box = {
-- 				type = "fixed",
-- 				fixed = {
-- 					{-2 / 16, -8 / 16, -2 / 16, 2 / 16, 8 / 16, 2 / 16},
-- 				},
-- 			},
-- 			paramtype = "light",
-- 			light_source = default.LIGHT_MAX-2,
-- 			sunlight_propagates = true,
-- 			is_ground_content = false,
-- 			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
-- 			sounds = default.node_sound_wood_defaults(),
-- 		}
-- 		minetest.register_node(post_name, post_def)
-- 	end
-- end
