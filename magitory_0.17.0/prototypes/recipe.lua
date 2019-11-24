magitory_category = 
{
	type = "recipe-category",
	name = "magitory_refine"
}

magitory_group = 
{
	type = "item-group",
	name = "magitory_base",
	icon = "__magitory__/graphics/icons/liquid_mana.png",
	icon_size = 32,
	order = "ad"
	-- order_in_recipe=""
}

magitory_subgroup = 
{
	type = "item-subgroup",
	name = "magitory_fluids",
	group = "magitory_base",
}

liquid_mana_recipe = 
{
	type = "recipe",
	name = "liquid_mana_refining",
	category = "chemistry",
	enabled = true,
	energy_required = 2,
	ingredients =
	{
		{
			type="fluid",
			name="unrefined_mana",
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
			name="liquid_mana",
			amount=50
		}
	},
	main_product= "",
	icon = "__base__/graphics/icons/fluid/heavy-oil-cracking.png",
	icon_size = 32,
	subgroup = "magitory_fluids",
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
})