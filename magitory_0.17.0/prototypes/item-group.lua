magitory_group = 
{
	type = "item-group",
	name = "magitory_base",
	icon = "__magitory__/graphics/icons/liquid-mana.png",
	icon_size = 32,
	order = "ad"
	-- order_in_recipe=""
}

testgroup = {
    type = "item-group",
	icon = "__magitory__/graphics/icons/SciencePackMk1.png",
	icon_size = 32,
	name = "testgroup"
}


data:extend({
	magitory_group,
	testgroup,
})