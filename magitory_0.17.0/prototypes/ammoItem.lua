air_spell = 
{
	type = "ammo",
	name = "air_spell",
	icon = "__magitory__/graphics/icons/liquid-mana.png",
	icon_size = 32,
	order = "ad",
	stack_size = 50,
	ammo_type = {
		category = "spell",
		range = 1000,
		cooldown = 1,
	}
}


data:extend({
	air_spell,
})