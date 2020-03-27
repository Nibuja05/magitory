function clean_up(entity)
	if not directionlist then directionlist = {} end
	if not distancelist then distancelist = {} end
	if not stunlist then stunlist = {} end
	if not hits then hits = {} end
	
	for int, hit in pairs(hits) do
		if (hit == entity) then
			hits[int] = nil
		end
	end
	
	for entity_, value in pairs(directionlist) do
		if (entity_ == entity) then
			directionlist[entity_] = nil
		end
	end
	for entity_, value in pairs(distancelist) do
		if (entity_ == entity) then
			distancelist[entity_] = nil
		end
	end
	for entity_, value in pairs(stunlist) do
		if (entity_ == entity) then
			stunlist[entity_] = nil
		end
	end	
end


function clean_damage(entity, amount, source)
	if not entity.valid then
		return false
	end
	if not (entity.destructible) then
		return false
	end
	local health = entity.health
	--game.print (health)
	if not (entity.health) then 
		return false
	end
	
	local damagetaken = entity.damage(amount, source.force)
	if(health > damagetaken)
	then
		-- life
		return false
	else
		--kill
		clean_up(entity)
		return true
	end
	
end


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
			stun_init(hit)
			killed = clean_damage(hit,5,unit)
		end
	end
	stun_init(unit)
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