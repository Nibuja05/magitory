function AddSpell(name)
    data:extend({{
    type = "item",
    name = name.."_spell",
    icon = "__magitory__/graphics/icons/spells/"..name.."_spell.png",
    icon_size = 64, icon_mipmaps = 4,
    stack_size = 50,
    subgroup = "magitory_spell"
    }})
    end
function AddEssence(name)
    data:extend({{
    type = "item",
    name = name.."_essence",
    icon = "__magitory__/graphics/icons/essences/"..name.."_essence.png",
    icon_size = 64, icon_mipmaps = 4,
    stack_size = 50,
    subgroup = "magitory_essence"
    }})
    end

function AddCrystal(name)
    data:extend({{
        type = "item",
        name = name.."_crystal",
        icon = "__magitory__/graphics/icons/crystal/"..name.."_crystal.png",
        icon_size = 64, icon_mipmaps = 4,
        stack_size = 50,
        subgroup = "magitory_crystal"
    }})
    end

AddEssence("water")
AddEssence("wind")
AddEssence("earth")
AddEssence("fire")
AddCrystal("water")
AddCrystal("wind")
AddCrystal("earth")
AddCrystal("fire")
AddCrystal("mana")
AddCrystal("energized_mana")
AddSpell("wind")
AddSpell("water")
AddSpell("earth") 
AddSpell("fire")

--hazelnut-wand
data:extend({
    {
        type = "capsule",
        name = "hazelnut_wand"  ,
        
        icon = "__magitory__/graphics/icons/hazelnut_ward.png",
        icon_size = 64, icon_mipmaps = 4,
        
        stack_size = 1,
        
        subgroup = "magitory_wand",
        
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
          },
        }
    })

--spellbook
data:extend({
    {
    type = "item-with-inventory",
    name = "spellbook",
    icon = "__magitory__/graphics/icons/spellbook.png",
    icon_size = 64, icon_mipmaps = 4,
    stack_size = 1,
    inventory_size = 10,
    item_subgroup_filters = {"magitory_spell"},
    subgroup = "magitory_spell_book"
    }
    })

--papyrus
data:extend({
    {
    type = "item",
    name = "papyrus",
    icon = "__magitory__/graphics/icons/spellbook.png",
    icon_size = 64, icon_mipmaps = 4,
    stack_size = 1,
    subgroup = "magitory_item"
    }
    })

--science and alien-artefact 
data:extend({
    {
        type = "item",
        name = "alien-science-pack-mk1"	,
        icon = "__magitory__/graphics/icons/SciencePackMk1.png",
		icon_size = 64, icon_mipmaps = 4,
        subgroup = "science-pack",
        stack_size = 50
    },{
        type = "item",
        name = "alien-science-pack-mk2",
        icon = "__magitory__/graphics/icons/SciencePackMk2.png",
		icon_size = 64, icon_mipmaps = 4,
        subgroup = "science-pack",
        stack_size = 50
    },
	{
        type = "item",
        name = "alien-artefact",
		icon = "__magitory__/graphics/icons/alien_artefact.png",
		icon_size = 64, icon_mipmaps = 4,
        subgroup = "magitory_item",
        stack_size = 200
    }
    })

--relic
data:extend({
    {
        type = "item",
        name = "alien-relic",
        icon = "__magitory__/graphics/icons/relic.png",
        icon_size = 64, icon_mipmaps = 4,
        subgroup = "magitory_item",
        stack_size = 200
    }
    })