fluids = 
{
	type = "item-subgroup",
	name = "magitory_fluids",
	group = "magitory_base",
}

testgroup = {
	group = "magitory_base",
    type = "item-subgroup",
	name = "magic_ring"
}

ward = {
	group = "magitory_base",
    type = "item-subgroup",
	name = "magic_ward"
}

data:extend({
	fluids,
	testgroup,
	ward,
})