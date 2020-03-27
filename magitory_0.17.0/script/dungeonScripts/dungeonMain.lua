
Room = {}
Room.__index = Room
Room_mt = {__call = function(_, ...) return Room.new(...) end }
setmetatable(Room, Room_mt)

function Room.new(position,size,exits)
	return setmetatable({position=position, size=size, exits=exits, locked=false}, Room)
end

function Room:__tostring()
	return "Room at "..self.position
end

function Room:create()
	local surface = game.surfaces["dungeon"]
	local tiles = {}
	for i=self.position.x-self.size,self.position.x+self.size do
		for j=self.position.y-self.size,self.position.y+self.size do
			table.insert(tiles, {name="dungeon_floor", position={i, j}})
		end
	end
	surface.set_tiles(tiles)
	for i=self.position.x-self.size,self.position.x+self.size do
		if i == -1 then 
		elseif i == 0 then
				surface.create_entity{name="dungeon_gate_horizontal", position=	{i,self.size}}
				surface.create_entity{name="dungeon_gate_horizontal", position=	{i,-self.size}}
				surface.create_entity{name="dungeon_gate_vertical", position=	{self.size,i}}
				surface.create_entity{name="dungeon_gate_vertical", position=	{-self.size,i}}
		elseif i == 1 then
		else
			surface.create_entity{name="stone-wall", position=	{i,self.size}}
			surface.create_entity{name="stone-wall", position=	{i,-self.size}}
			surface.create_entity{name="stone-wall", position=	{self.size,i}}
			surface.create_entity{name="stone-wall", position=	{-self.size,i}}
		end
	end
end

if not dungeon then 
	dungeon = {}
	count =  0
	starting_room = nil
end

-- room {hight, with, N1,N2,N3, E1,E2,E3, S1, S2, S3, W1, W2, W3}

function createWalls(var)
	local surface = game.surfaces["dungeon"]
	if var.is_starting_room then
		local startRoom = Room(Vector(0,0),13,{"N", "S", "W", "E"})
		startRoom:create()
		-- local tiles = {}
		-- for i = -13, 13,1 do
		-- 	for j = -13, 13,1 do
		-- 		table.insert(tiles, {name="dungeon_floor", position={i, j}})
		-- 	end
		-- end
		-- surface.set_tiles(tiles)
		-- for i = -13, 13,1 do
		-- 	if tostring(i) == "-1" then 
		-- 	elseif tostring(i) == "0" then
		-- 			surface.create_entity{name="dungeon_gate_horizontal", position=	{i,13}}
		-- 			surface.create_entity{name="dungeon_gate_horizontal", position=	{i,-13}}
		-- 			surface.create_entity{name="dungeon_gate_vertical", position=	{13,i}}
		-- 			surface.create_entity{name="dungeon_gate_vertical", position=	{-13,i}}
		-- 	elseif tostring(i) == "1" then
		-- 	else
		-- 		surface.create_entity{name="stone-wall", position=	{i,13}}
		-- 		surface.create_entity{name="stone-wall", position=	{i,-13}}
		-- 		surface.create_entity{name="stone-wall", position=	{13,i}}
		-- 		surface.create_entity{name="stone-wall", position=	{-13,i}}
		-- 	end
		-- end
	end
end

function create_starting_room()
	
	local surface = game.surfaces["dungeon"]
	--print (surface.is_chunk_generated{0,0})
	if surface.is_chunk_generated{0,0} then starting_room = {hight = 3, with = 3} end
	createWalls({is_starting_room = true})

end

function dungeon:on_tick()
	if not global.dungeon then 
		global.dungeon = {}
			game.create_surface("dungeon",{width = 0, height = 0})
			game.surfaces["dungeon"].request_to_generate_chunks({0, 0}, 3)
			game.surfaces["dungeon"].always_day = true --look for always night

			--if remote.interfaces["RSO"] then -- RSO compatibility
			--	pcall(remote.call, "RSO", "ignoreSurface", surface_name)
			--end
		--
	end
	if not starting_room then create_starting_room() end
end

function dungeon:on_chunk_generated(event)
    --Only handle chunks on our dungeon surface.
	if event.surface.name ~= "dungeon" then return end
	--Clear our the new chunk from everything. We just want empty space, and there is no way to have factorio generate an empty map.
    event.surface.destroy_decoratives({area= event.area})
	for i, entity in ipairs(event.surface.find_entities(event.area)) do
        if entity.type ~= "character" then
            entity.destroy()
        end
    end
	
	
	--Fill everything with deep space, except for the center area. Which we will fill with a bit of space platform so we have a starting area.
    local tiles = {}
    for x=event.area.left_top.x, event.area.right_bottom.x do
        for y=event.area.left_top.y, event.area.right_bottom.y do
            table.insert(tiles, {name="dungeon_void", position={x, y}})
        end
    end
    event.surface.set_tiles(tiles)
--	game.print(count)
--	game.print(event.surface.name)
--	game.print(event.position)
--	game.print("--")
	count = count + 1
	
end

function dungeon:tp(player)
	player.teleport({0,0},game.surfaces["dungeon"])
end

magitory:DefineEvent("on_tick", function(event) dungeon:on_tick() end)
magitory:DefineEvent("on_chunk_generated",function(event) dungeon:on_chunk_generated(event)end)