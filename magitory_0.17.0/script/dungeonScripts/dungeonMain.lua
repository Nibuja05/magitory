
DOOR_CHECK_INTERVAL_CONST = 18000
if not global.dungeon then
	global.dungeon = {}
	global.dungeon.rooms = {} -- is this really needed
	global.dungeon.areas = {} -- needed for room finding
	global.dungeon.doors = {} --{entity_1::entity,entity_2::entity,entity_3::entity,open::boolean}
	dungeon = {}
--	count =  0
end

function dungeon.get_closed_doors()
	returnList={}
	for int,door in pairs(global.dungeon.doors) do
		if not door.open
		then
			table.insert(returnList,door)
		end
	end	
	return returnList
end

function dungeon.get_min_door_count()
	return 3
end 

function dungeon.get_max_door_count()
	return 5
end 
--[[function Room:create_walls(vert_or_hor,location)
	if vert_or_hor == "vert" then
		for i = location.y,location.y + FIELD_SCALE do
			self:create_wall(surface, {location.x,i})
		end
	elseif vert_or_hor == "hor" then
		for i = location.x,location.x + FIELD_SCALE do
			self:create_wall(surface, {i,location.y})
		end
	end
end]]



--function Room.new(position,size,exits)
--	return setmetatable({position=position, size=size, exits=exits, locked=false, doors={}}, Room)
--end

--[[function Room.from_table(tab)
	return setmetatable(tab, Room)
end]]

--[[function Room:__tostring()
	return "Room at "..self.position
end]]

--[[function Room:create()
	local surface = game.surfaces["dungeon"]
	local tiles = {}
	for i=self.position.x-self.size,self.position.x+self.size do
		for j=self.position.y-self.size,self.position.y+self.size do
			table.insert(tiles, {name="dungeon_floor", position={i,j}})
		end
	end
	surface.set_tiles(tiles)
	for i=self.position.x-self.size,self.position.x+self.size do
		if i == -1 then 
		elseif i == 0 then
			if FindValueInTable(self.exits, "S") then
				self:create_door(Vector(self.size,i-1), Vector(self.size,i+1), true, true)
			else
				self:create_wall(surface, {self.size,i-1})
				self:create_wall(surface, {self.size,i})
				self:create_wall(surface, {self.size,i+1})
			end
			if FindValueInTable(self.exits, "N") then
				self:create_door(Vector(-self.size,i-1), Vector(-self.size,i+1), true, true)
			else
				self:create_wall(surface, {-self.size,i-1})
				self:create_wall(surface, {-self.size,i})
				self:create_wall(surface, {-self.size,i+1})
			end
			if FindValueInTable(self.exits, "W") then
				self:create_door(Vector(i-1,-self.size), Vector(i+1,-self.size), true, false)
			else
				self:create_wall(surface, {i-1,-self.size})
				self:create_wall(surface, {i,-self.size})
				self:create_wall(surface, {i+1,-self.size})
			end
			if FindValueInTable(self.exits, "E") then
				self:create_door(Vector(i-1,self.size), Vector(i+1,self.size), true, false)
			else
				self:create_wall(surface, {i-1,self.size})
				self:create_wall(surface, {i,self.size})
				self:create_wall(surface, {i+1,self.size})
			end
		elseif i == 1 then
		else
			self:create_wall(surface, {i,self.size})
			self:create_wall(surface, {i,-self.size})
			self:create_wall(surface, {self.size,i})
			self:create_wall(surface, {-self.size,i})
		end
	end
end]]

--[[function Room:create_door(startPos, endPos, isBlocked, turn)
	local surface = game.surfaces["dungeon"]
	if not isBlocked then isBlocked = false end
	for i=startPos.x,endPos.x do
		for j=startPos.y,endPos.y do
			local direction = defines.direction.east
			if turn then direction = defines.direction.north end
			local door = surface.create_entity{name="dungeon-gate", position={i,j}, direction=direction}
			if door then
				door.destructible = false
				door.minable = false
				table.insert(self.doors, {entity=door, open=not isBlocked})

				if not isBlocked then
					door.request_to_open("enemy", DOOR_CHECK_INTERVAL_CONST)
				end
			end
		end
	end
end]]

--[[function Room:create_wall(surface, position)
	local surface = game.surfaces["dungeon"]
	local wall = surface.create_entity{name="stone-wall", position=position}
	if wall then
		wall.destructible = false
		wall.minable = false
	end
end]]

--[[function Room:check_doors()
	for _,door in pairs(self.doors) do
		if door.open then
			if door.entity and door.entity.valid then
				door.entity.request_to_open("enemy",DOOR_CHECK_INTERVAL_CONST)
				-- door.entity.request_to_open("enemy",1)
				-- door.entity.active = false
			end
		end
	end
end]]

--[[function dungeon:unlock_doors(ent)
	if not ent then
		for _,door in pairs(self.doors) do
			door.open = true
		end
	else
		for _,door in pairs(self.doors) do
			if door.entity == ent then
				door.open = true
			end
		end
	end
	self:check_doors()
end]]

--[[function Room:has_door(ent)
	for _,door in pairs(self.doors) do
		if door.entity == ent then
			return true
		end
	end
	return false
end]]


--[[function dungeon:createWalls(var)
	local surface = game.surfaces["dungeon"]
	if var.is_starting_room then
		--local startRoom = Room(Vector(0,0),10,{"S", "W", "E", "N"})
		local three_times_three = {Vector(0,0),Vector(0,1),Vector(0,2),Vector(1,0),Vector(1,1),Vector(1,2),Vector(2,0),Vector(2,1),Vector(2,2)}
		local startRoom = Room(Vector(-1,-1),three_times_three)
		--startRoom:create()
		dungeon.startRoom = startRoom
		table.insert(global.dungeon.rooms, startRoom)
	end
end]]

function dungeon:create_starting_room()
	
	local surface = game.surfaces["dungeon"]
	--local startRoom = Room(Vector(0,0),10,{"S", "W", "E", "N"})
	local three_times_three = {Vector(0,0),Vector(0,1),Vector(0,2),Vector(1,0),Vector(1,1),Vector(1,2),Vector(2,0),Vector(2,1),Vector(2,2)}
	local startRoom = Room(Vector(-1,-1),three_times_three)
	
	--Room(Vector(2,1),three_times_three)
	--print(startRoom)
	--startRoom:create()
	global.dungeon.startRoom = startRoom
	--table.insert(global.dungeon.rooms, startRoom)
end

function dungeon:create_room(startPos)
	--print(startPos)
	local new_room = Room(startPos,{Vector(0,0)})
end

function dungeon:on_tick(event)
	
		


	-- if event.tick % 1200 == 0 and event.tick ~= 0 then
	-- 	for _,room in pairs(global.dungeon.rooms) do
	-- 		room:unlock_doors()
	-- 	end
	-- end
end

function dungeon:on_chunk_generated(event)

	--Only handle chunks on our dungeon surface.
	if event.surface.name ~= "dungeon" then return end
	--print(event.area)
	--Clear our the new chunk from everything. We just want empty space, and there is no way to have factorio generate an empty map.
	event.surface.destroy_decoratives({area= event.area})
	for i, entity in ipairs(event.surface.find_entities(event.area)) do
		if entity.type ~= "character" then
			entity.destroy()
		end
	end
	
	
	local tiles = {}
	for x=event.area.left_top.x, event.area.right_bottom.x do
		for y=event.area.left_top.y, event.area.right_bottom.y do
			table.insert(tiles, {name="dungeon_void", position={x, y}})
		end
	end
	event.surface.set_tiles(tiles)
	--count = count + 1
	
end

function dungeon:tp(player)

	game.create_surface("dungeon",{width = 0, height = 0})	
	player.teleport({0,0},game.surfaces["dungeon"])
	

	--game.surfaces["dungeon"].request_to_generate_chunks({0, 0}, 3)
	--game.surfaces["dungeon"].always_day = true --look for always night
	--print("test init")
		--if remote.interfaces["RSO"] then -- RSO compatibility
		--	pcall(remote.call, "RSO", "ignoreSurface", surface_name)
		--end
		--	
	if not global.dungeon.startRoom then
		self:create_starting_room() 
	end
end

---[[function dungeon:refresh_rooms(event) 
	if event.tick % DOOR_CHECK_INTERVAL_CONST == 0 then
		--print("Refresh Doors")
		for _,door in pairs(global.dungeon.doors) do
			if door.open then
				door.
			end 
		end
	end
end]]

function dungeon:reload_rooms()
	if global and global.dungeon and global.dungeon.rooms then
		for i,room in pairs(global.dungeon.rooms) do
			local newRoom = Room.from_table(room)
			global.dungeon.rooms[i] = newRoom
		end
	end
end

function dungeon:check_doors()
	for _,door in pairs(global.dungeon.doors) do
		if door.open then
			if door.entity_1 and door.entity_1.valid then
				door.entity_1.request_to_open("enemy",DOOR_CHECK_INTERVAL_CONST)
				-- door.entity.request_to_open("enemy",1)
				-- door.entity.active = false
			end
		end
	end
end

function dungeon:open_gate(event)
	if not game then return end
	local player = game.players[event.player_index]
	local ent = player.selected
	
	if ent and ent.valid and player.can_reach_entity(ent) then
		if ent.name == "dungeon-gate" then
			for _,door in pairs(global.dungeon.doors) do
				if not (door.open) and (door.entity_1 == ent or door.entity_2 == ent or door.entity_3 == ent) then
					--print("Room found!")
					--room:unlock_doors(ent)
					door.open = true
					--if(door.entity_1) then end
					local room_1 = get_room_location(Vector(door.entity_1.position.x-1,door.entity_1.position.y-1))
					local room_2 = get_room_location(Vector(door.entity_1.position.x+1,door.entity_1.position.y+1))
					--print ("room 1")
					--print (room_1)
					--print ("room 2")
					--print (room_2)
					
					
					
					if not find_vector_in_table(global.dungeon.areas, room_1)
					then
						--print ("room 1")
						self:create_room(room_1)
					end
					if not find_vector_in_table(global.dungeon.areas, room_2)
					then
						--print ("room 2")
						self:create_room(room_2)
					end
					
					
					
					
					self:check_doors()
				end
			end
		end
	end
end

script.on_load(function() dungeon:reload_rooms() end)

--magitory:DefineEvent("on_tick", function(event) dungeon:on_tick(event) end)
magitory:DefineEvent("on_chunk_generated",function(event) dungeon:on_chunk_generated(event)end)
magitory:DefineEvent("on_tick", function(event) dungeon:check_doors() end)

magitory:DefineEvent("on_player_created", function(event) dungeon:reload_rooms() end)
magitory:DefineEvent("on_player_joined_game", function(event) dungeon:reload_rooms() end)

script.on_event("open-gate-key", function(event) dungeon:open_gate(event) end)

--utils its here until there is a util.lua

