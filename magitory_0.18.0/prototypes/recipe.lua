hazelnut_ward_recipe = 
{
	type = "recipe",
	name = "hazelnut_ward_recipe",
	category = "crafting",
	enabled = true,
	
	ingredients =
	{
		{
			type="item",
			name="wood",
			amount=1
		}
	},
	results=
	{
		{
			type="item",
			name="hazelnut_wand",
			amount=1
		}
	}	,
	--subgroup = "magic_spell",
}

spellbook_recipe = 
{
	type = "recipe",
	name = "spellbook_recipe",
	category = "crafting",
	enabled = true,
	
	ingredients =
	{
		{
			type="item",
			name="wood",
			amount=1
		}
	},
	results=
	{
		{
			type="item",
			name="spellbook",
			amount=1
		}
	}	,
	--subgroup = "magic_spell",
}

data:extend({
	hazelnut_ward_recipe,
	spellbook_recipe
})


liquid_mana_recipe = 
{
	type = "recipe",
	name = "liquid-mana-refining",
	category = "chemistry",
	enabled = true,
	energy_required = 2,
	ingredients =
	{
		{
			type="fluid",
			name="unrefined-mana",
			amount=50
		},
		{
			type="fluid",
			name="water",
			amount=10
		}
	},
	results=
	{
		{
			type="fluid",
			name="liquid-mana",
			amount=50
		}
	},
	main_product= "",
	icon = "__base__/graphics/icons/fluid/heavy-oil-cracking.png",
	icon_size = 32,
	subgroup = "magitory_mana",
	-- order = "b[fluid-chemistry]-a[heavy-oil-cracking]",
	order = "ab",
	crafting_machine_tint =
	{
	  primary = {r = 0.0, g = 0.0, b = 0.28, a = 0.000}, -- #49060000
	  secondary = {r = 0.18, g = 0.4, b = 0.172, a = 0.000}, -- #b8763000
	  tertiary = {r = 0.0, g = 0.216, b = 0.866, a = 0.000}, -- #dd5d0000
	}
}

alien_science_pack_mk1_recipe = 
{
	type = "recipe",
	name = "alien-science-pack-mk1-recipe",
	category = "basic-crafting",
	enabled = true,
	energy_required = 2,
	ingredients =
	{
		{
			type="item",
			name="alien-artefact",
			amount=1
		},
		{
			type="fluid",
			name="liquid-mana",
			amount=10
		}
	},
	results=
	{
		{
			type="item",
			name="alien-science-pack-mk1",
			amount=10
		}
	},
	icon = "__magitory__/graphics/icons/SciencePackMk1.png",
	icon_size = 32,
	-- order = "b[fluid-chemistry]-a[heavy-oil-cracking]",
	order = "ab",
	crafting_machine_tint =
	{
	  primary = {r = 0.0, g = 0.0, b = 0.28, a = 0.000}, -- #49060000
	  secondary = {r = 0.18, g = 0.4, b = 0.172, a = 0.000}, -- #b8763000
	  tertiary = {r = 0.0, g = 0.216, b = 0.866, a = 0.000}, -- #dd5d0000
	}
}

alien_science_pack_mk2_recipe = 
{
	type = "recipe",
	name = "alien-science-pack-mk2-recipe",
	category = "basic-crafting",
	enabled = true,
	energy_required = 2,
	ingredients =
	{
		{
			type="item",
			name="alien-artefact",
			amount=1
		},
		{
			type="fluid",
			name="liquid-mana",
			amount=10
		}
	},
	results=
	{
		{
			type="item",
			name="alien-science-pack-mk2",
			amount=10
		}
	},
	icon = "__magitory__/graphics/icons/SciencePackMk2.png",
	icon_size = 32,
	-- order = "b[fluid-chemistry]-a[heavy-oil-cracking]",
	order = "ab",
	crafting_machine_tint =
	{
	  primary = {r = 0.0, g = 0.0, b = 0.28, a = 0.000}, -- #49060000
	  secondary = {r = 0.18, g = 0.4, b = 0.172, a = 0.000}, -- #b8763000
	  tertiary = {r = 0.0, g = 0.216, b = 0.866, a = 0.000}, -- #dd5d0000
	}
}

data:extend({
	liquid_mana_recipe,
	alien_science_pack_mk1_recipe,
	alien_science_pack_mk2_recipe,
})