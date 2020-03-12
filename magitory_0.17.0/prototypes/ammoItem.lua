testentity =
{
	type = "particle-source",
	name = "test-entity",
	icon = "__magitory__/graphics/icons/liquid-mana.png",
	icon_size = 32,
	
	height = 10,
	horizontal_speed = 0,
	height = 10,
	height = 10,
	height = 10,
	
	
}

damage_type = {
	type = "damage-type",
	name = "air",
}

air_spell = 
{
	type = "ammo",
	name = "air_spell",
	icon = "__magitory__/graphics/icons/liquid-mana.png",
	icon_size = 32,
	order = "ad",
	stack_size = 50,
	ammo_type = 
	{
		category = "spell",
		action = 
		{
			type = "area",
			radius = 0,
			collision_mode = "distance-from-center",
			action_delivery =
			{
				type = "instant",
				target_effects = 
				{
					type = "damage",
					damage = 
					{
						amount = 0,
						type = "air",
					}	
				}
			}
		}
		--range = 1000,
		--cooldown = 1,
		
	}
}




data:extend({
	air_spell,
	damage_type,
})