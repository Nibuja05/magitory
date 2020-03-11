function dash(unit, distance, direction)

		if not directionlist then directionlist = {} end
		if not distancelist then distancelist = {} end

		directionlist[unit] = direction 
		distancelist[unit] = distance
		unit.active = false
    end

script.on_event(defines.events.on_tick, function(event)
  	if not directionlist then directionlist = {} end
	if not distancelist then distancelist = {} end
	
	for unit, direction in pairs(directionlist) do
		distancelist[unit] = distancelist[unit]/2
		distance = distancelist[unit]
		unit.teleport({x = unit.position.x + (math.sin(direction) *distance) , y = unit.position.y + (math.cos(direction) *distance)})
		if (distance<0.3)then
			distancelist[unit] = nil
			directionlist[unit] = nil
			unit.active = true
		end		
	end
end
)


script.on_event({defines.events.on_entity_damaged},
	function(event)
		if(event.damage_type.name == "air")
		then
		
			if(event.entity.type == "unit")
			then
				sourceX = event.cause.position.x
				sourceY = event.cause.position.y
				targetX = event.entity.position.x
				targetY = event.entity.position.y
				distance = math.max(10-(((sourceX-targetX)^2 + (sourceY-targetY)^2)^0.5),0)
				direction = math.atan2((targetX-sourceX), (targetY-sourceY) )		
				dash(event.entity,distance,direction)
			end
		end
	end
)