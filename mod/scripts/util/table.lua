
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