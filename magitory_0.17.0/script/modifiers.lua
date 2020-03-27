
Modifier = {}
Modifier.__index = Modifier
Modifier_mt = {__call = function(_, ...) return Modifier.new(...) end }
setmetatable(Modifier, Modifier_mt)

function Modifier.new(name, modType, unit, duration, optVals)
	return setmetatable({name = name, modType = modType, unit = unit, duration = duration, lifetime = 0, optVals = optVals}, Modifier)
end

function Modifier:__tostring()
	return "Modifier ["..tostring(self.name).."]('"..tostring(self.modType).."',duration:"..tostring(self.duration)..")"
end

if not modifiers then
	modifiers = {}
end

function create_modifier(unit, modifierTable)
	
end

function check_modifiers(event)

end

magitory:DefineEvent("on_tick", function(event) check_modifiers(event) end)