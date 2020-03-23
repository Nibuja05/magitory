spellbook = {
    type = "item-with-inventory",
    name = "spellbook",
    icon = "__magitory__/graphics/icons/spellbook.png",
	icon_size = 32,
    stack_size = 1,
	inventory_size = 10,
	item_subgroup_filters = {"magic_spell"},
	subgroup = "magic_spell_book"
}


data:extend({
	spellbook
})