
local default_ended_in_water_trigger_effect = function()
  return
  {
	type = "create-entity",
	entity_name = "water-splash"
  }
end

local make_particle = function(params)

  if not params then error("No params given to make_particle function") end
  local name = params.name or error("No name given")

  local ended_in_water_trigger_effect = params.ended_in_water_trigger_effect or default_ended_in_water_trigger_effect();
  if params.ended_in_water_trigger_effect == false then
	ended_in_water_trigger_effect = nil
  end

  local particle =
  {

	type = "optimized-particle",
	name = name,

	life_time = params.life_time or 60 * 15,

	render_layer = params.render_layer or "projectile",
	render_layer_when_on_ground = params.render_layer_when_on_ground or "corpse",

	regular_trigger_effect_frequency = params.regular_trigger_effect_frequency or 2,
	regular_trigger_effect = params.regular_trigger_effect,
	ended_in_water_trigger_effect = ended_in_water_trigger_effect,

	pictures = params.pictures,
	shadows = params.shadows,

	movement_modifier_when_on_ground = params.movement_modifier_when_on_ground,
	movement_modifier = params.movement_modifier,

	mining_particle_frame_speed = params.mining_particle_frame_speed,

  }

  return particle
end

air_wave = {
	type = "optimized-particle",
	name = "air-wave",
	flags = {"not-on-map"},
	movement_modifier_when_on_ground = 0,
	life_time = 180,
	pictures =
	{
		{
			filename = "__magitory__/graphics/particles/air_wave/air_wave_2.png",
			priority = "extra-high",
			width = 159,
			height = 119,
			line_length = 6,
			frame_count = 33,
			scale = 3,
			-- shift = util.by_pixel(0,1),
		},
	},
}

air_wave_2 = make_particle
	{
		name = "air-wave-2",
		life_time = 180,
		pictures =
		{
			{
				filename = "__magitory__/graphics/particles/air_wave/air_wave_4.png",
				priority = "extra-high",
				width = 159,
				height = 119,
				line_length = 1,
				frame_count = 28,
				scale = 1,
				-- shift = util.by_pixel(0,1),
			},
		},
		shadows =
		{
			{
				filename = "__magitory__/graphics/particles/air_wave/air_wave_4.png",
				priority = "extra-high",
				width = 159,
				height = 119,
				line_length = 1,
				frame_count = 28,
				scale = 1,
				shift = util.by_pixel(1,0),
				tint = {r = 0, g = 0, b = 0},
			},
		},
		ended_in_water_trigger_effect = false,
	}

air_wave_emitter = {
	type = "particle-source",
	name = "air-wave-emitter",
	particle = "air-wave",
	time_to_live = 10,
	time_to_live_deviation = 5,
	time_before_start = 0,
	time_before_start_deviation = 3,
	height = 0.4,
	height_deviation = 0.1,
	vertical_speed = 0.05,
	vertical_speed_deviation = 0.03,
	horizontal_speed = 0.025,
	horizontal_speed_deviation = 0.025
}

data:extend({
	air_wave,
	air_wave_emitter,
	air_wave_2,
})