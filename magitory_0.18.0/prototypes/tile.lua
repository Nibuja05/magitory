dungeon_floor={
    type = "tile",
    name = "dungeon_floor",
    needs_correction = false,
    collision_mask = {"ground-tile"},
    walking_speed_modifier = 1,
    layer = 61,
    variants =
    {
      main =
      {
        {
          picture = "__base__/graphics/terrain/concrete/concrete.png",
          count = 1,
          size = 1
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete.png",
          count = 1,
          size = 2,
          probability = 0.39
        },
        {
          picture = "__base__/graphics/terrain/concrete/concrete.png",
          count = 1,
          size = 4,
          probability = 1
        }
      },
	  empty_transitions = true,
	  --[[
      inner_corner =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-inner-corner.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-inner-corner.png",
          count = 16,
          scale = 0.5
        }
      },
      inner_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-inner-corner-mask.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-inner-corner-mask.png",
          count = 16,
          scale = 0.5
        }
      },

      outer_corner =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-outer-corner.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-outer-corner.png",
          count = 8,
          scale = 0.5
        }
      },
      outer_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-outer-corner-mask.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-outer-corner-mask.png",
          count = 8,
          scale = 0.5
        }
      },

      side =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-side.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-side.png",
          count = 16,
          scale = 0.5
        }
      },
      side_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-side-mask.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-side-mask.png",
          count = 16,
          scale = 0.5
        }
      },

      u_transition =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-u.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-u.png",
          count = 8,
          scale = 0.5
        }
      },
      u_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-u-mask.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-u-mask.png",
          count = 8,
          scale = 0.5
        }
      },

      o_transition =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-o.png",
        count = 4,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-o.png",
          count = 4,
          scale = 0.5
        }
      },
      o_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-o-mask.png",
        count = 4,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-o-mask.png",
          count = 4,
          scale = 0.5
        }
      },

]]
      material_background =
      {
        picture = "__magitory__/graphics/terrain/dungeon_concrete.png",
        count = 8,
      }
    },

    transitions = concrete_transitions,
    transitions_between_transitions = concrete_transitions_between_transitions,

    walking_sound =
    {
      {
        filename = "__base__/sound/walking/concrete-01.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-02.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-03.ogg",
        volume = 1.0
      },
      {
        filename = "__base__/sound/walking/concrete-04.ogg",
        volume = 1.0
      }
    },
    map_color={r=100, g=100, b=100},
    pollution_absorption_per_second = 0,
  }
  
  dungeon_void={
    type = "tile",
    name = "dungeon_void",
    needs_correction = false,
    collision_mask = {"ground-tile"},
    walking_speed_modifier = 1,
    layer = 61,
    variants =
    {
      main =
      {
        {
          picture = "__magitory__/graphics/terrain/dungeon_void.png",
          count = 1,
          size = 1
        },
        {
          picture = "__magitory__/graphics/terrain/dungeon_void.png",
          count = 1,
          size = 2,
          probability = 0.39
        },
        {
          picture = "__magitory__/graphics/terrain/dungeon_void.png",
          count = 1,
          size = 4,
          probability = 1
        }
      },
	  empty_transitions = true,
	  --[[
      inner_corner =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-inner-corner.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-inner-corner.png",
          count = 16,
          scale = 0.5
        }
      },
      inner_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-inner-corner-mask.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-inner-corner-mask.png",
          count = 16,
          scale = 0.5
        }
      },

      outer_corner =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-outer-corner.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-outer-corner.png",
          count = 8,
          scale = 0.5
        }
      },
      outer_corner_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-outer-corner-mask.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-outer-corner-mask.png",
          count = 8,
          scale = 0.5
        }
      },

      side =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-side.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-side.png",
          count = 16,
          scale = 0.5
        }
      },
      side_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-side-mask.png",
        count = 16,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-side-mask.png",
          count = 16,
          scale = 0.5
        }
      },

      u_transition =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-u.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-u.png",
          count = 8,
          scale = 0.5
        }
      },
      u_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-u-mask.png",
        count = 8,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-u-mask.png",
          count = 8,
          scale = 0.5
        }
      },

      o_transition =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-o.png",
        count = 4,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-o.png",
          count = 4,
          scale = 0.5
        }
      },
      o_transition_mask =
      {
        picture = "__base__/graphics/terrain/concrete/concrete-o-mask.png",
        count = 4,
        hr_version =
        {
          picture = "__base__/graphics/terrain/concrete/hr-concrete-o-mask.png",
          count = 4,
          scale = 0.5
        }
      },

]]
      material_background =
      {
        picture = "__magitory__/graphics/terrain/dungeon_void.png",
        count = 8,
      }
    },

    --transitions = concrete_transitions,
    --transitions_between_transitions = concrete_transitions_between_transitions,
    map_color={r=0, g=0, b=0},
    pollution_absorption_per_second = 0,
  }
  
data:extend({
	dungeon_floor,
	dungeon_void
})