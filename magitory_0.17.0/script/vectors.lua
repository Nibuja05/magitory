
Vector = {}
Vector_mt = { __index = Vector}

function Vector:new(x,y)
	return setmetatable( {x=x, y=y}, Vector_mt)
end

function Vector:__tostring()
	return "Vector("..tostring(self.x).." "..tostring(self.y) + ")"
end

function Vector:__add(v)
	return Vector(self.x + v.x, self.y + v.y)
end

function Vector:__sub(v)
	return Vector(self.x - v.x, self.y - v.y)
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