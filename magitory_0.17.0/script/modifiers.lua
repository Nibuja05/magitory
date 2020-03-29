
Modifier = {}
Modifier.__index = Modifier
Modifier_mt = {__call = function(_, ...) return Modifier.new(...) end }
setmetatable(Modifier, Modifier_mt)

function Modifier.new(name, caster, parent, duration, optArgs)
	return setmetatable({
		id=create_unique_string(), 
		name = name, caster = caster, 
		parent = parent, 
		duration = duration, 
		lifetime = 0, 
		optArgs = optArgs,
		thinkInterval = false,
		thinkTime = 0,
	}, Modifier)
end

function Modifier:__eq(mod)
	return self.id == mod.id
end

function Modifier:__tostring()
	local remaining = self.duration - self.lifetime
	if self.duration < 0 then remaining = -1 end
	return "Modifier ["..tostring(self.name)..", Time remaining: "..tostring(remaining).."]"
end

function Modifier:tick(time)
	self.lifetime = self.lifetime + time
	if self.duration >= 0 then
		if self.lifetime >= self.duration then
			self:destroy()
		end
	end
	if self.thinkInterval then
		if self.lifetime >= self.thinkTime then
			self.thinkTime = self.thinkTime + self.thinkInterval
			if self["on_interval_think"] then
				self:on_interval_think()
			end
		end
	end
end

function Modifier:create()
	if self["on_created"] then
		self:on_created(self.optArgs)
	end
end

function Modifier:start_interval_think(interval)
	self.thinkInterval = interval
	self.thinkTime = self.lifetime + interval
end

function Modifier:destroy()
	if self["on_destroy"] then
		self:on_destroy()
	end
	remove_modifier(self)
	self = nil
end

if not modifiers then
	modifiers = {}
end

function create_modifier(caster, target, modifierName, optArgs)
	local duration = -1
	if optArgs.duration then duration = optArgs.duration end
	local newModifier = Modifier(modifierName, caster, target, duration, optArgs)
	table.insert(modifiers, newModifier)
	local modifierFuncs = _G[modifierName]
	for name,func in pairs(modifierFuncs) do
		if type(func) == "function" then
			newModifier[name] = func
		end
	end
	newModifier:create()
	return newModifier
end

function remove_modifier(modifier)
	modifiers = remove_from_table(modifiers, modifier)
end

function tick_modifiers(event)
	for _,modifier in pairs(modifiers) do
		modifier:tick(1/60)
	end
end

magitory:DefineEvent("on_tick", function(event) tick_modifiers(event) end)