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
	if not (entity.destructible) then
		return false
	end
	health = entity.health
	game.print (health)
	if not (entity.health) then 
		return false
	end
	
	damagetaken = entity.damage(amount, source.force)
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
		hits = unit.surface.find_entities_filtered({area = {{newX-1 ,newY-1},{newX+1 ,newY+1}}})
		
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



function dash_on_tick()
	if not directionlist then directionlist = {} end
	
	for unit, direction in pairs(directionlist) do
		if unit.valid then
			distancelist[unit] = distancelist[unit]*0.6
			distance = distancelist[unit]
			newX = unit.position.x + (math.sin(direction) *distance) 
			newY = unit.position.y + (math.cos(direction) *distance) 
			
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

function air_on_entity_damaged(event)
	if(event.damage_type.name == "magic_wind")
	then
		if(event.entity == event.cause)
		then
			surface = event.entity.surface
			sourceX = event.cause.position.x
			sourceY = event.cause.position.y
			units = {}
			units = surface.find_entities_filtered{position = {sourceX, sourceY}, radius = 10, type = "unit"}
			for int,unit in pairs(units) do 
				targetX = unit.position.x
				targetY = unit.position.y
				distance = math.max(10-(((sourceX-targetX)^2 + (sourceY-targetY)^2)^0.5),0)
				direction = math.atan2((targetX-sourceX), (targetY-sourceY) )		
				dash_init(unit,distance/2,direction)
			end
		end
		-- old code over ammoitem.lua insteat of find_entities_filtered
		--if(event.entity.type == "unit")
		--then
		--	sourceX = event.cause.position.x
		--	sourceY = event.cause.position.y
		--	targetX = event.entity.position.x
		--	targetY = event.entity.position.y
		--	distance = math.max(10-(((sourceX-targetX)^2 + (sourceY-targetY)^2)^0.5),0)
		--	direction = math.atan2((targetX-sourceX), (targetY-sourceY) )		
		--	dash_init(event.entity,distance,direction)
		--end
	end
end

script.on_event(defines.events.on_tick, 
function(event)
  	dash_on_tick()
end
)

script.on_event(defines.events.on_entity_died, 
function(event)
  	clean_up(entity)
end
)

script.on_event(defines.events.on_entity_damaged,
	function(event)
		air_on_entity_damaged(event)
	end
)