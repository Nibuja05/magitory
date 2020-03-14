magitory_category = 
{
	type = "recipe-category",
	name = "magitory-refine"
}

magitory_group = 
{
	type = "item-group",
	name = "magitory-base",
	icon = "__magitory__/graphics/icons/liquid-mana.png",
	icon_size = 32,
	order = "ad"
	-- order_in_recipe=""
}

magitory_subgroup = 
{
	type = "item-subgroup",
	name = "magitory-fluids",
	group = "magitory-base",
}

wind_spell_recipe = 
{
	type = "recipe",
	name = "wind_spell_recipe",
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
			name="wind_spell",
			amount=1
		}
	}	
}

water_spell_recipe = 
{
	type = "recipe",
	name = "water_spell_recipe",
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
			name="water_spell",
			amount=1
		}
	}	
}

void_spell_recipe = 
{
	type = "recipe",
	name = "void_spell_recipe",
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
			name="void_spell",
			amount=1
		}
	}	
}

stone_spell_recipe = 
{
	type = "recipe",
	name = "stone_spell_recipe",
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
			name="stone_spell",
			amount=1
		}
	}	
}

fire_spell_recipe = 
{
	type = "recipe",
	name = "fire_spell_recipe",
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
			name="fire_spell",
			amount=1
		}
	}	
}

nature_spell_recipe = 
{
	type = "recipe",
	name = "nature_spell_recipe",
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
			name="nature_spell",
			amount=1
		}
	}	
}

ice_spell_recipe = 
{
	type = "recipe",
	name = "ice_spell_recipe",
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
			name="ice_spell",
			amount=1
		}
	}	
}

electric_spell_recipe = 
{
	type = "recipe",
	name = "electric_spell_recipe",
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
			name="electric_spell",
			amount=1
		}
	}	
}

hazelnut_ward_recipe = 
{
	type = "recipe",
	name = "hazelnut-ward_recipe",
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
			name="hazelnut-wand",
			amount=1
		}
	}	
}

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
	subgroup = "magitory-fluids",
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
	main_product= "",
	icon = "__magitory__/graphics/icons/SciencePackMk1.png",
	icon_size = 32,
	subgroup = "magitory-fluids",
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
	main_product= "",
	icon = "__magitory__/graphics/icons/SciencePackMk2.png",
	icon_size = 32,
	subgroup = "magitory-fluids",
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
	magitory_category,
	magitory_group,
	magitory_subgroup,
	liquid_mana_recipe,
	alien_science_pack_mk1_recipe,
	alien_science_pack_mk2_recipe,
	hazelnut_ward_recipe,
	wind_spell_recipe,
	water_spell_recipe,
	void_spell_recipe,
	stone_spell_recipe,
	fire_spell_recipe,
	nature_spell_recipe,
	ice_spell_recipe,
	electric_spell_recipe
})