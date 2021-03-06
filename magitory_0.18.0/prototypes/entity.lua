
unrefined_mana_resource =    
{ 
	type = "resource",
	name = "unrefined-mana",
	icon = "__magitory__/graphics/icons/unrefined-mana.png",
	icon_size = 32,
	flags = {"placeable-neutral"},
	category = "basic-fluid",
	order="a-b-a",
	infinite = true,
	highlight = true,
	minimum = 60000,
	normal = 300000,
	infinite_depletion_amount = 10,
	resource_patch_search_radius = 12,
	tree_removal_probability = 0.7,
	tree_removal_max_distance = 32 * 32,
	minable =
	{
		mining_time = 1,
		results =
		{
			{
				type = "fluid",
				name = "unrefined-mana",
				amount_min = 10,
				amount_max = 10,
				probability = 1
			}
		}
	},
	collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
	selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
	autoplace = resource_autoplace.resource_autoplace_settings{
		name = "unrefined-mana",
		order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
		base_density = 8.2,
		base_spots_per_km2 = 1.8,
		random_probability = 1/48,
		random_spot_size_minimum = 1,
		random_spot_size_maximum = 1, -- don't randomize spot size
		additional_richness = 220000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
		has_starting_area_placement = false,
		-- resource_index = resource_autoplace.resource_indexes["crude-oil"],
		regular_rq_factor_multiplier = 1
	},
	stage_counts = {0},
	stages =
	{
		sheet =
		{
			filename = "__base__/graphics/entity/crude-oil/crude-oil.png",
			priority = "extra-high",
			width = 75,
			height = 61,
			frame_count = 4,
			variation_count = 1
		}
	},
	tint = {r = 0.0, g = 0.0, b = 0.6},
	map_color = {r=0.0, g=0.2, b=1.0},
	map_grid = false
}

unrefined_mana = 
{
	type = "fluid",
	name = "unrefined-mana",
	default_temperature = 15,
	max_temperature = 100,
	heat_capacity = "0.2KJ",
	base_color = {r=0, g=0.0, b=0.6},
	flow_color = {r=0.7, g=0.7, b=0.7},
	icon = "__magitory__/graphics/icons/unrefined-mana.png",
	icon_size = 32,
	order = "a[fluid]-b[unrefined-mana]",
	pressure_to_speed_ratio = 0.4,
	flow_to_energy_ratio = 0.59
}

liquid_mana = 
{
	type = "fluid",
	name = "liquid-mana",
	default_temperature = 15,
	max_temperature = 100,
	heat_capacity = "0.2KJ",
	base_color = {r=0.1, g=0.5, b=1.0},
	flow_color = {r=0.0, g=0.0, b=0.7},
	icon = "__magitory__/graphics/icons/liquid-mana.png",
	icon_size = 32,
	order = "a[fluid]-b[liquid_mana]",
	pressure_to_speed_ratio = 0.4,
	flow_to_energy_ratio = 0.59
}
  
unrefined_mana_autoplace =
{
	type = "autoplace-control",
	name = "unrefined-mana",
	richness = true,
	order = "b-a",
	category = "resource"
}

pylon = {
	name = "pylon",
	type = "simple-entity",
	icon = "__magitory__/graphics/icons/unrefined-mana.png",
	icon_size = 32,
	count_as_rock_for_filtered_deconstruction = true,
	picture = {type = "SpriteVariations",filename = "__magitory__/graphics/entity/pylon.png",	size = {32,46},},
	tile_width = 1,
	tile_height = 1,
	minable = {
		type = "MinableProperties",
		mining_time = 1,
		result = "stone",
		count = 5,
		mining_particle = "stone-particle",
		},
	collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
	selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
}

dungeon_gate_vertical = {
	name = "dungeon_gate_vertical",
	type = "simple-entity",
	icon = "__magitory__/graphics/icons/unrefined-mana.png",--
	icon_size = 32,--
	count_as_rock_for_filtered_deconstruction = false,
	max_health = 0.1,
	pictures = 
	{
		type = "SpriteVariations",
		filename = "__magitory__/graphics/entity/dungeon_gate_vertical.png",
		size = {49,101},
	},
	tile_width = 1,
	tile_height = 3,
	
	minable = {
		type = "MinableProperties",
		mining_time = 1,
		result = "stone",
		count = 5,
		mining_particle = "stone-particle",
		},
	collision_box = {{-0.5, -1.5}, {0.5, 1.5}},
	selection_box = {{-0.5, -1.5}, {0.5, 1.5}},
}

dungeon_gate_horizontal = {
	name = "dungeon_gate_horizontal",
	type = "simple-entity",
	icon = "__magitory__/graphics/icons/unrefined-mana.png",--
	icon_size = 32,--
	count_as_rock_for_filtered_deconstruction = false,
	max_health = 0.1,
	picture = 
	{
		--type = "SpriteVariations",
		filename = "__magitory__/graphics/entity/dungeon_gate_horizontal.png",
		size = {101,49},
	},
	tile_width = 3,
	tile_height = 1,
	
	minable = {
		type = "MinableProperties",
		mining_time = 1,
		result = "stone",
		count = 5,
		mining_particle = "stone-particle",
		},
	collision_box = {{-1.5, -0.5}, {1.5, 0.5}},
	selection_box = {{-1.5, -0.5}, {1.5, 0.5}},
}

dungeon_gate = table.deepcopy(data.raw.gate.gate)
dungeon_gate.name = "dungeon-gate"
dungeon_gate.order = "a"

data:extend({
	unrefined_mana,
	unrefined_mana_resource,
	unrefined_mana_autoplace,
	liquid_mana,
	pylon,
	dungeon_gate_vertical,
	dungeon_gate_horizontal,
	dungeon_gate,
})