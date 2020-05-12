data:extend({
    {
        type = "capsule",
        name = "hazelnut-wand"	,
		
        icon = "__magitory__/graphics/icons/hazelnut-ward.png",
		icon_size = 32,
		
        stack_size = 1,
		
		subgroup = "magic_ward",
		
		capsule_action = {
			type = "throw",
			uses_stack = false,
			attack_parameters ={
				type = "projectile",
				range = 1000,
				cooldown = 10,
				ammo_type = {
					category = "spell"
				}
		}
		
		--attack_parameters ={
			--type = "projectile",
			--range = 10,
			--cooldown = 30,
			--ammo_category = "spell",
			--movement_slow_down_factor = 0.5, --copied by bobswarefare rifle
			--projectile_creation_distance = 0.6,
			--damage_modifier = 7,--7.5
			--sound = make_heavy_gunshot_sounds(),
			--shell_particle =
			--{
			--	name = "shell-particle",
			--	direction_deviation = 0.1,
			--	speed = 0.1,
			--	speed_deviation = 0.03,
			--	center = {0, 0.6},
			--	creation_distance = 0.6,
				--starting_frame_speed = 0.4,
				--+starting_frame_speed_deviation = 0.1
		  },
		}
    })