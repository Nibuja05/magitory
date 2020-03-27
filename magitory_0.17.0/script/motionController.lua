
DEFAULT_FORCE_CONST = 1.3
DEFAULT_STUN = true
-- force needs to be >= 1
-- force with >= 2 is fast, but it makes nearly no difference
-- lower force is slower

if not motion_controller then 
	motion_controller = {}
	motion_controller.velocities = {}
	motion_controller.forces = {}
	motion_controller.stunned = {}
	motion_controller.callbacks = {}
end

function motion_controller:add_motion(entity, direction, distance, stun, force, callback)
	if not force then force = DEFAULT_FORCE_CONST end
	velocity = direction * (distance - (distance / force))
	self:add_motion_with_velocity(entity, velocity, stun, force, callback)
end

function motion_controller:add_motion_to_position(entity, position, stun, force, callback)
	if not force then force = DEFAULT_FORCE_CONST end
	local entLoc = Vector(entity.position)
	direction = (position - entLoc):normalized()
	distance = #(position - entLoc)
	velocity = direction * (distance - (distance / force))
	self:add_motion_with_velocity(entity, velocity, stun, force, callback)
end

function motion_controller:add_motion_with_velocity(entity, velocity, stun, force, callback)
	if not force then force = DEFAULT_FORCE_CONST end
	self.forces[entity] = force
	if not self.velocities[entity] then self.velocities[entity] = Vector() end
	self.velocities[entity] = self.velocities[entity] + velocity

	if not stun then stun = DEFAULT_STUN end
	if stun and not entity.is_player() then
		self.stunned[entity] = true
		entity.active = false
	end

	if callback and type(callback) == "function" then
		self.callbacks[entity] = callback
	end
end

function motion_controller:stop_motion(entity)
	if self.velocities[entity] then
		self.velocities[entity] = nil
		self.forces[entity] = nil
		self.callbacks[entity] = nil
		if self.stunned[entity] then
			self.stunned[entity] = nil
			if entity.valid then entity.active = true end
		end
	end
end

function motion_controller:teleport(entity, position)
	if entity.surface.can_place_entity({name=entity.name, position=newLoc, force=entity.force}) then
		entity.teleport(position)
	end
end

function motion_controller:motion(event)
	local tick = event.tick
	for entity, velocity in pairs(self.velocities) do
		if #velocity < 0.01 then
			self:stop_motion(entity)
		end
	end
	for entity, velocity in pairs(self.velocities) do
		if entity.valid then
			local entLoc = Vector(entity.position)
			local newLoc = entLoc + velocity
			if entity.surface.can_place_entity({name=entity.name, position=newLoc, force=entity.force}) 
				and entity.valid then
				entity.teleport(newLoc)
				self.velocities[entity] = velocity:stretched(1 / self.forces[entity])
			else
				if self.callbacks[entity] then
					self.callbacks[entity](entity, entLoc)
				end
				self:stop_motion(entity)
			end
		end
	end
	-- self.velocities = {}
end

magitory:DefineEvent("on_tick", function(event) motion_controller:motion(event) end)
