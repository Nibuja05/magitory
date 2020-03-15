group = {
    type = "item-group",
	icon = "__magitory__/graphics/icons/SciencePackMk1.png",
	icon_size = 32,
	name = "testgroup"
}

subgroup = {
	group = "testgroup",
    type = "item-subgroup",
	name = "magic_ring"
}


testiteam = {
    type = "item-with-inventory",
    name = "test_gloves",
    icon = "__magitory__/graphics/icons/SciencePackMk1.png",
	icon_size = 32,
    stack_size = 1,
	inventory_size = 3,
	item_subgroup_filters = {"magic_ring"},
}

testrecipe = 
{
	type = "recipe",
	name = "testrecipe",
	category = "crafting",
	enabled = true,
	
	icon = "__magitory__/graphics/icons/SciencePackMk1.png",
	icon_size = 32,
	subgroup = "magic_ring",
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
			name="test_gloves",
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
	subgroup = "magic_ring",
}

testring2 = {
    type = "item",
    name = "test_ring_armor",
    icon = "__magitory__/graphics/icons/SciencePackMk1.png",
	icon_size = 32,
	--flags = {"goes-to-quickbar"},
    --subgroup = "science-pack",
    stack_size = 1,
	subgroup = "magic_ring",
}

testring3 = {
    type = "item",
    name = "test_ring_strengh",
    icon = "__magitory__/graphics/icons/SciencePackMk1.png",
	icon_size = 32,
	--flags = {"goes-to-quickbar"},
    --subgroup = "science-pack",
    stack_size = 1,
	subgroup = "magic_ring",
}

data:extend({
	testiteam,
	testrecipe,
	testring,
	testring2,
	testring3,
	subgroup,
	group,
})