wind_spell = 
{
	type = "ammo",
	name = "wind_spell",
	icon = "__magitory__/graphics/icons/wind-spell.png",
	icon_size = 32,
	order = "ad",
	stack_size = 50,
	ammo_type = 
	{
		category = "spell",
		action = 
		{
			type = "area",
			radius = 15,
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
						type = "magic_wind",
					}	
				}
			}
		}
		--range = 1000,
		--cooldown = 1,
		
	}
}

water_spell = 
{
	type = "ammo",
	name = "water_spell",
	icon = "__magitory__/graphics/icons/water_spell.png",
	icon_size = 32,
	order = "ad",
	stack_size = 50,
	ammo_type = 
	{
		category = "spell",
		action = 
		{
			type = "area",
			radius = 15,
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
						type = "magic_water",
					}	
				}
			}
		}
		--range = 1000,
		--cooldown = 1,
		
	}
}

void_spell = 
{
	type = "ammo",
	name = "void_spell",
	icon = "__magitory__/graphics/icons/void_spell.png",
	icon_size = 32,
	order = "ad",
	stack_size = 50,
	ammo_type = 
	{
		category = "spell",
		action = 
		{
			type = "area",
			radius = 15,
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
						type = "magic_void",
					}	
				}
			}
		}
		--range = 1000,
		--cooldown = 1,
		
	}
}

stone_spell = 
{
	type = "ammo",
	name = "stone_spell",
	icon = "__magitory__/graphics/icons/stone-spell.png",
	icon_size = 32,
	order = "ad",
	stack_size = 50,
	ammo_type = 
	{
		category = "spell",
		action = 
		{
			type = "area",
			radius = 15,
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
						type = "magic_stone",
					}	
				}
			}
		}
		--range = 1000,
		--cooldown = 1,
		
	}
}

fire_spell = 
{
	type = "ammo",
	name = "fire_spell",
	icon = "__magitory__/graphics/icons/fire-spell.png",
	icon_size = 32,
	order = "ad",
	stack_size = 50,
	ammo_type = 
	{
		category = "spell",
		action = 
		{
			type = "area",
			radius = 15,
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
						type = "magic_fire",
					}	
				}
			}
		}
		--range = 1000,
		--cooldown = 1,
		
	}
}

nature_spell = 
{
	type = "ammo",
	name = "nature_spell",
	icon = "__magitory__/graphics/icons/nature-spell.png",
	icon_size = 32,
	order = "ad",
	stack_size = 50,
	ammo_type = 
	{
		category = "spell",
		action = 
		{
			type = "area",
			radius = 15,
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
						type = "magic_nature",
					}	
				}
			}
		}
		--range = 1000,
		--cooldown = 1,
		
	}
}

ice_spell = 
{
	type = "ammo",
	name = "ice_spell",
	icon = "__magitory__/graphics/icons/ice-spell.png",
	icon_size = 32,
	order = "ad",
	stack_size = 50,
	ammo_type = 
	{
		category = "spell",
		action = 
		{
			type = "area",
			radius = 15,
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
						type = "magic_ice",
					}	
				}
			}
		}
		--range = 1000,
		--cooldown = 1,
		
	}
}




data:extend({
	wind_spell,
	water_spell,
	void_spell,
	stone_spell,
	fire_spell,
	nature_spell,
	ice_spell,
})