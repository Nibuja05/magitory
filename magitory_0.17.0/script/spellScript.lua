
function dash_init(unit, distance, direction)
	if not directionlist then directionlist = {} end
	if not distancelist then distancelist = {} end

	directionlist[unit] = direction 
	distancelist[unit] = distance
	unit.active = false
end


function stun_init(unit)
	if not stunlist then stunlist = {} end
	stunlist[unit] = 60*3
	unit.active = false
end



function dash_on_tick()
	if not stunlist then stunlist = {} end
	for unit, int in pairs(stunlist) do
		stunlist[unit] = stunlist[unit] -1
		if(stunlist[unit] == 0)then 
			unit.active=true 
			stunlist[unit] = nil
		end
	end
end

function collition(unit, newLoc)
	local hits = unit.surface.find_entities_filtered({area = {newLoc - 1, newLoc + 1}})
	
	for int, hit in pairs(hits) do
		if not (hit == unit) then
			-- stun_init(hit)
			create_modifier(nil, hit, "modifier_knockback_stun", {duration=3})
			killed = clean_damage(hit,5,unit)
		end
	end
	-- stun_init(unit)
	create_modifier(nil, unit, "modifier_knockback_stun", {duration=3})
	for int, hit in pairs(hits) do
		clean_damage(unit, 5, hit)
		break
	end
end

function air_on_spell(event) --on_player_used_capsule 
	--game.print("test")
	local player = game.players[event.player_index]
	local surface = player.surface
	local sourceLoc = Vector(player.position)
	local units = {}
	local units = surface.find_entities_filtered{position = sourceLoc, radius = 10, type = "unit"}

	local testTable = {}
	testTable.position = player.position
	testTable.otherTable = {name="hi", loc = {x=1,y=2}}
	print(testTable)

	for _,unit in pairs(units) do
		local targetLoc = Vector(unit.position)
		local distance = 10 - #(targetLoc - sourceLoc)
		local direction = (targetLoc - sourceLoc):normalized()

		motion_controller:add_motion(unit, direction, distance, true, nil, collition)
	end
end

function stone_on_spell(event)
	local player = game.players[event.player_index]
	local surface = player.surface
	surface.create_entity{name="pylon", position=event.position}

	local units = surface.find_entities_filtered{position = event.position, radius = 4, type = "unit"}
	for _,unit in pairs(units) do
		create_modifier(player.character, unit, "modifier_burn_test", {duration=3, damage=5})
	end
end

function void_on_spell(event)
	dungeon:tp(game.players[event.player_index])
end

function on_player_used_ward(event)
	local player = game.players[event.player_index]
	local consume_item = true
	if(event.item.subgroup.name == "magic_ward") then
		if spellGui:get_selected(player) == "no_spellbook" then
			player.print("no spellbook")
			consume_item = false
		elseif spellGui:get_selected(player) == "no_spell" then
			player.print("no_spell")
			consume_item = false
		elseif spellGui:get_selected(player) == "wind_spell" then
			air_on_spell(event)
		elseif spellGui:get_selected(player) == "stone_spell" then
			stone_on_spell(event)
		elseif spellGui:get_selected(player) == "void_spell" then
			void_on_spell(event)
		else
			player.print(spellGui:get_selected(player) .." is not supported yet")
		end
		if consume_item then
			spellGui:consumeSpell(player)
		end
	end
	spellGui:update(player)
end

function test(event)
--	game.print(event.position)
end


magitory:DefineEvent("on_tick", function(event) dash_on_tick() end)
magitory:DefineEvent("on_entity_died", function(event) clean_up(event.entity) end)
magitory:DefineEvent("on_player_used_capsule", on_player_used_ward)

modifier_burn_test = {}

function modifier_burn_test:on_created(event)
	self.damage = event.damage
	self:start_interval_think(1)
	clean_damage(self.parent, self.damage, self.caster)
end

function modifier_burn_test:on_interval_think()
	clean_damage(self.parent, self.damage, self.caster)
end

modifier_knockback_stun = {}

function modifier_knockback_stun:on_created(event)
	self.parent.active = false
end

function modifier_knockback_stun:on_destroy()
	self.parent.active = true
end