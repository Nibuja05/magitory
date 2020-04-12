FIELD_SCALE = 10 --inside scale + 1

Room = {}
Room.__index = Room
Room_mt = {__call = function(_, ...) return Room.new(...) end }
setmetatable(Room, Room_mt)

function get_bounding_box(field)
	local x = field.x 
	local y = field.y
	
	local leftTop = Vector{x=-FIELD_SCALE/2+FIELD_SCALE*x,y=-FIELD_SCALE/2+FIELD_SCALE*y}
	local rightBottom = Vector{x=FIELD_SCALE/2+FIELD_SCALE*x,y=FIELD_SCALE/2+FIELD_SCALE*y}
	return {leftTop = leftTop,rightBottom = rightBottom}
end	

function Room.new(starting_field,fields)
	starting_field=starting_field:int()
	--print(starting_field)
	Room:createStructure(starting_field,fields)
	return setmetatable({},Room)
end

function Room:createStructure(starting_field,relative_fields)
	local absolute_fields = {}
	for int,field in pairs(relative_fields) do
		table.insert(absolute_fields,field+starting_field)
		table.insert(global.dungeon.areas,field+starting_field)
	end
	local surface = game.surfaces["dungeon"]
	--print(surface.name)
	local build_hor = {}
	local build_vert = {}
	local built_hor = {}
	local built_vert = {}
	local tiles = {}
	for int,field in pairs(absolute_fields) do

		--- build floor get_bounding_box(field)
		for i = get_bounding_box(field).leftTop.x,get_bounding_box(field).rightBottom.x do
			for j = get_bounding_box(field).leftTop.y,get_bounding_box(field).rightBottom.y do
				--print(i,"/",j)
				table.insert(tiles, {name="dungeon_floor", position={i,j}})
			end
		end
				
		--get the possible localtion for a wall
		local vert_build_left = Vector(get_bounding_box(field).leftTop)
		local vert_build_right = Vector{x = get_bounding_box(field).rightBottom.x,y = get_bounding_box(field).leftTop.y}
		local hor_build_top = Vector(get_bounding_box(field).leftTop)
		local hor_build_bottom = Vector{y = get_bounding_box(field).rightBottom.y,x = get_bounding_box(field).leftTop.x}
		
		
		table.insert(build_hor, hor_build_top)
		table.insert(build_hor, hor_build_bottom)
		table.insert(build_vert, vert_build_left)
		table.insert(build_vert, vert_build_right)
	end
	game.surfaces["dungeon"].request_to_generate_chunks({0, 0}, 3)
	game.surfaces["dungeon"].force_generate_chunk_requests()

	game.surfaces["dungeon"].set_tiles(tiles)
	for int,wall in pairs(build_hor) do
		local built = self:build_walls("hor",wall)
		if built then 
			table.insert(built_hor,wall)
		end
	end
	for int,wall in pairs(build_vert) do
		local built = self:build_walls("vert",wall)
		if built then 
			table.insert(built_vert,wall)
		end
	end
	
	--calculate the number of doors to build
	local wanted_number_of_doors_to_build = math.min(get_table_length(built_vert) + get_table_length(built_hor), math.max(math.random(dungeon.get_min_door_count(),dungeon.get_max_door_count())-#dungeon.get_closed_doors(),0))
	--print(wanted_number_of_doors_to_build)
	for i = 1, wanted_number_of_doors_to_build do 
		--print("arange",get_table_length(built_vert) + get_table_length(built_hor))
		local a = math.random(1,get_table_length(built_vert) + get_table_length(built_hor))
		--print("a" ,a)
		if a <= get_table_length(built_vert) then 
			--find in vert
			--print("ver"	,tostring(built_vert[a]))
			
			self:build_door("vert",built_vert[a])
			
			built_vert = remove_vector_from_table(built_vert,built_vert[a])
		else 
			--print("hor",tostring(built_hor[a- get_table_length(built_vert)]))
			--find in hor
			--print(a- get_table_length(built_vert))
			self:build_door("hor",built_hor[a- get_table_length(built_vert)])
		
			built_hor = remove_vector_from_table(built_hor,built_hor[a- get_table_length(built_vert)])
		end
	end
	
	--#built_vert + #built_hor
end

function Room:build_door_entity(direction,position)
	local surface = game.surfaces["dungeon"]
	surface.find_entities({position,{position.x+1,position.y+1}})[1].destroy()
	if(surface.find_entity("stone-wall", position))
	then
		local wall = surface.find_entity('stone-wall', position)
		
	end
	local door = surface.create_entity{name="dungeon-gate", position=position, direction=direction}
	if door then
		door.destructible = false
		door.minable = false	
		return door
	end
	return nil
end

function Room:build_door(vert_or_hor,location)
	local surface = game.surfaces["dungeon"]
	if vert_or_hor == "vert" then
		local direction = defines.direction.north
		door_1 = self:build_door_entity(direction,{x=location.x,y=location.y + (FIELD_SCALE/2)-1})
		door_2 = self:build_door_entity(direction,{x=location.x,y=location.y + (FIELD_SCALE/2)})
		door_3 = self:build_door_entity(direction,{x=location.x,y=location.y + (FIELD_SCALE/2)+1})
	elseif vert_or_hor == "hor" then
		local direction = defines.direction.east
		door_1 = self:build_door_entity(direction,{x=location.x+ (FIELD_SCALE/2)-1,y=location.y})
		door_2 = self:build_door_entity(direction,{x=location.x+ (FIELD_SCALE/2),y=location.y})
		door_3 = self:build_door_entity(direction,{x=location.x+ (FIELD_SCALE/2)+1,y=location.y})
	end
	--print(global.dungeon)
	--print(global.dungeon.doors)
	
	door = {entity_1=door_1,entity_2=door_2,entity_3=door_3,open=false}
	table.insert(global.dungeon.doors,door)
end

function Room:build_walls(vert_or_hor,location)
	local surface = game.surfaces["dungeon"]
	if vert_or_hor == "vert" then
		--check if there are no tiles at both sides
		if(surface.get_tile(location.x-1, location.y + (FIELD_SCALE/2)).name == "dungeon_void")or(surface.get_tile(location.x+1, location.y + (FIELD_SCALE/2)).name == "dungeon_void")
		then
			for i = location.y,location.y + FIELD_SCALE do
				self:build_wall(surface, {location.x,i})
			end
			return true
		else
			return false
		end
	elseif vert_or_hor == "hor" then
		if(surface.get_tile(location.x + (FIELD_SCALE/2), location.y -1).name == "dungeon_void")or(surface.get_tile(location.x+ (FIELD_SCALE/2), location.y + 1).name == "dungeon_void")
		then
			for i = location.x,location.x + FIELD_SCALE do
				self:build_wall(surface, {i,location.y})
			end
			return true
		else
			return false
		end
	end
end

function Room:build_wall(surface, position)
	local surface = game.surfaces["dungeon"]
	local wall = surface.create_entity{name="stone-wall", position=position}
	if wall then
		wall.destructible = false
		wall.minable = false
	end
end