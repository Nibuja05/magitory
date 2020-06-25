function AddSubgroup(name)
	data:extend({
	{
		type = "item-subgroup",
		name = name,
		group = "magitory_base",
	}
})
end

AddSubgroup("magitory_mana")
AddSubgroup("magitory_essence")
AddSubgroup("magitory_spell")
AddSubgroup("magitory_item")
AddSubgroup("magitory_wand")
AddSubgroup("magitory_crystal")
AddSubgroup("magitory_spell_book")