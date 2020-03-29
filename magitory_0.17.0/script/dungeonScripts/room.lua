FIELD_SCALE = 8 --inside scale + 1

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
	Room:createStructure(starting_field,fields)
end


function Room:createStructure(starting_field,relativ_fields)
	local absolute_fields = {}
	for int,field in pairs(relativ_fields) do
		table.insert(absolute_fields,field+starting_field)
	end
	local surface = game.surfaces["dungeon"]
	--print(surface.name)
	local bulid_hor = {}
	local bulid_vert = {}
	local bulit_hor = {}
	local bulit_vert = {}
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
		
		
		table.insert(bulid_hor, hor_build_top)
		table.insert(bulid_hor, hor_build_bottom)
		table.insert(bulid_vert, vert_build_left)
		table.insert(bulid_vert, vert_build_right)
	end
	game.surfaces["dungeon"].request_to_generate_chunks({0, 0}, 3)
	game.surfaces["dungeon"].force_generate_chunk_requests()

	game.surfaces["dungeon"].set_tiles(tiles)
	for int,wall in pairs(bulid_hor) do
		local built = self:build_walls("hor",wall)
		if built then 
			table.insert(bulit_hor,wall)
		end
	end
	for int,wall in pairs(bulid_vert) do
		local built = self:build_walls("vert",wall)
		if built then 
			table.insert(bulit_vert,wall)
		end
	end
	print(#bulit_vert + #bulit_hor)
	
end

function Room:build_walls(vert_or_hor,location)
	print(vert_or_hor) --- printet ein table und kein string
	local surface = game.surfaces["dungeon"]
	--treate hor and vert in its own way
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