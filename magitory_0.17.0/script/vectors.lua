Vector = {}
Vector.__index = Vector
Vector_mt = {__call = function(_, ...) return Vector.new(...) end }
setmetatable(Vector, Vector_mt)

function Vector.new(x,y)
	if type(x) == "table" then
		return setmetatable({x=x.x or 0, y=x.y or 0}, Vector)
	end
	return setmetatable({x=x or 0, y=y or 0}, Vector)
end

function Vector:__tostring()
	return "Vector ("..tostring(self.x).."   "..tostring(self.y)..")"
end

function Vector:__add(v)
	if type(v) == "table" then
		return Vector(self.x + v.x, self.y + v.y)
	elseif type(v) == "number" then
		return Vector(self.x + v, self.y + v)
	end
end

function Vector:__sub(v)
	if type(v) == "table" then
		return Vector(self.x - v.x, self.y - v.y)
	elseif type(v) == "number" then
		return Vector(self.x - v, self.y - v)
	end
end

function Vector:__mul(b)
	return Vector(self.x * b, self.y * b)
end

function Vector:__div(b)
	return Vector(self.x / b, self.y / b)
end

function Vector:__unm()
	return Vector(-self.x, -self.y)
end

function Vector:__pow(e)
	return Vector(self.x ^ e, self.y ^ e)
end

function Vector:__len()
	return math.sqrt(self.x ^ 2 + self.y ^ 2)
end

function Vector:__eq(v)
	return(self.x == v.x) and (self.y == v.y)
end

function Vector:normalized()
	return self / self:__len()
end

function Vector:rotate(v,angle)
	local theta = math.rad(angle)
	local xp = v.x*math.cos(theta)-v.y*math.sin(theta)
	local yp = v.x*math.sin(theta)+v.y*math.cos(theta)
	return Vector(xp,yp):normalized()
end

function Vector:rotate_right()
	local x = self.y
	local y = -self.x
	return Vector(x,y)
end

function Vector:rotate_left()
	return self:rotate_right():rotate_right():rotate_right()
end

function Vector:stretched(len)
	return self:normalized() * self:__len() * len
end

function Vector:int()
  return Vector(math.floor(self.x), math.floor(self.y))
end