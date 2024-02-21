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