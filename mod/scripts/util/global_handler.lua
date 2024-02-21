if not global then global = {} end

function magitory:GetGlobal(key)
	if not global[key] then global[key] = {} end
	return global[key]
end

function magitory:SetGlobal(key, val)
	state = true
	if not global[key] then state = false end
	global[key] = val
end