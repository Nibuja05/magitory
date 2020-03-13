testiteam = {
    type = "item-with-inventory",
    name = "test_gloves",
    icon = "__magitory__/graphics/icons/SciencePackMk1.png",
	icon_size = 32,
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
		},
		{
			type="item",
			name="test_ring_speed",
			amount=1
		},
		{
			type="item",
			name="test_ring_armor",
			amount=1
		},
		{
			type="item",
			name="test_ring_strengh",
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
}

testring2 = {
    type = "item",
    name = "test_ring_armor",
    icon = "__magitory__/graphics/icons/SciencePackMk1.png",
	icon_size = 32,
	--flags = {"goes-to-quickbar"},
    --subgroup = "science-pack",
    stack_size = 1,
}

testring3 = {
    type = "item",
    name = "test_ring_strengh",
    icon = "__magitory__/graphics/icons/SciencePackMk1.png",
	icon_size = 32,
	--flags = {"goes-to-quickbar"},
    --subgroup = "science-pack",
    stack_size = 1,
}

data:extend({
	testiteam,
	testrecipe,
	testring,
	testring2,
	testring3,
})