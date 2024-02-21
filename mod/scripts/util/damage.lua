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
	if not (entity.health) then 
		return false
	end
	
	local damagetaken = entity.damage(amount, source.force)
	if(health > damagetaken)
	then
		return false
	else
		clean_up(entity)
		return true
	end
end