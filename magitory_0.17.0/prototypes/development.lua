testiteam = {
    type = "item-with-inventory",
    name = "test-item-with-inventory",
    icon = "__magitory__/graphics/icons/SciencePackMk1.png",
	icon_size = 32,
	flags = {"mod-openable"},
    --subgroup = "science-pack",
    stack_size = 1,
	inventory_size = 3,
}

testrecipe = 
{
	type = "recipe",
	name = "testrecipe",
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
			name="test-item-with-inventory",
			amount=1
		}
	}	
}

testring = {
    type = "item",
    name = "test_ring_speed",
    icon = "__magitory__/graphics/icons/SciencePackMk1.png",
	icon_size = 32,
	--flags = {"goes-to-quickbar"},
    --subgroup = "science-pack",
    stack_size = 1,
	inventory_size = 3,
}


data:extend({
	testiteam,
	testrecipe,
	testring,
})