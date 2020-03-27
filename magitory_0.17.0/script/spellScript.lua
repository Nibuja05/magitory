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


function colition(unit,newX,newY)
	if(unit.surface.can_place_entity({name= unit.name, position={x=newX ,y = newY}, direction=unit.direction, force=unit.force}))
	then 
		unit.teleport({x = newX , y = newY})
		return false 
	else
		local hits = unit.surface.find_entities_filtered({area = {{newX-1 ,newY-1},{newX+1 ,newY+1}}})
		
		for int, hit in pairs(hits) do
			if not (hit == unit) then
				--game.print(hit.type)
				stun_init(hit)
				killed = clean_damage(hit,5,unit)
			end
		end
		
		stun_init(unit)
		--game.print(hits[1])
		--game.print(hits[1].force)
		
		for int, hit in pairs(hits) do
			clean_damage(unit, 5, hit)
			break
		end
	end
end



function dash_on_tick(event)
	if not directionlist then directionlist = {} end	
	for unit, direction in pairs(directionlist) do
		if unit.valid then
			distancelist[unit] = distancelist[unit]*0.6
			local distance = distancelist[unit]
			local newX = unit.position.x + (math.sin(direction) *distance) 
			local newY = unit.position.y + (math.cos(direction) *distance) 
			
			colition(unit,newX,newY)
			
			
			if (distance<0.00001)then
				distancelist[unit] = nil
				directionlist[unit] = nil
				if not stunlist then stunlist = {} end
				if not stunlist[unit] then
					unit.active = true
				end
			end		
		end
	end
end

function air_on_spell(event) --on_player_used_capsule 
	--game.print("test")
	local player = game.players[event.player_index]
	local surface = player.surface
	local sourceX = player.position.x
	local sourceY = player.position.y
	local units = {}
	local units = surface.find_entities_filtered{position = {sourceX, sourceY}, radius = 10, type = "unit"}
	--count = 0
	--for _ in pairs(units) do count = count + 1 end
	--game.print(count)
	for int,unit in pairs(units) do 
		local targetX = unit.position.x
		local targetY = unit.position.y
		local distance = math.max(10-(((sourceX-targetX)^2 + (sourceY-targetY)^2)^0.5),0)
		local direction = math.atan2((targetX-sourceX), (targetY-sourceY) )		
		dash_init(unit,distance/2,direction)
	end
end

function stone_on_spell(event)
	local player = game.players[event.player_index]
	local surface = player.surface
	surface.create_entity{name="pylon", position=event.position}
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