--spells.recipes


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

data:extend({
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