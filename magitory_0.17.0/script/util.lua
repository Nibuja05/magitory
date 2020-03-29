

function combine_tables(table1, table2)
	for key,val in pairs(table2) do
		if type(key) ~= "number" then
			table1[key] = val
		else
			table.insert(table1, val)
		end
	end
	return table1
end

function get_table_length(table)
	local index = 0
	for _,k in pairs(table) do
		index = index + 1
	end
	return index
end

function remove_from_table(tab, element)
	local newTable = {}
	local count = 0
	for _,elem in pairs(tab) do
		if not elem == element then
			table.insert(newTable, elem)
		else
			count = count + 1
		end
	end
	return newTable, count
end

function is_empty(tab)
	if GetTableLength(tab) == 0 then
		return true
	end
	return false
end

function find_value_in_table(tab, value)
	for _,val in pairs(tab) do
		if val == value then
			return true
		end
	end
	return false
end

function shuffle_table(tab)
	for i = #tab, 2, -1 do
		local j = math.random(i)
		tab[i], tab[j] = tab[j], tab[i]
	end
	return tab
end

charset = {}  do
	for c = 48, 57  do table.insert(charset, string.char(c)) end
	for c = 65, 90  do table.insert(charset, string.char(c)) end
	for c = 97, 122 do table.insert(charset, string.char(c)) end
end

function random_string(length)
	if not length or length <= 0 then return '' end
	if not generator then
		generator = game.create_random_generator()
	end
	return random_string(length - 1) .. charset[generator(1, #charset)]
end

unqiues = {}
generator = nil

function create_unique_string()
	local newString = random_string(12)
	if find_value_in_table(unqiues, newString) then
		return create_unique_string()
	end
	table.insert(unqiues, newString)
	return newString
end

-- damage stuff

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