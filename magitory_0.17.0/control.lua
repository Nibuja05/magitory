-------------------------------------------------------------------------------
--FACTORIO MOD: Magitory
--Factorio + Magic = WOW!
--Authors: Nibuja, HanniWalter
--Date: 14.03.2020
-------------------------------------------------------------------------------

if not magitory then magitory = {} end
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

function magitory:DefineEvent(name, func)
	if not self.eventList then self.eventList = {} end
	if not self.eventList[name] then self.eventList[name] = {} end
	table.insert(self.eventList[name], func)
end

function magitory:ReloadEvents()
	if self.eventList then
		for eventName,events in pairs(self.eventList) do
			script.on_event(defines.events[eventName], function(event)
				for _,func in pairs(magitory.eventList[eventName]) do
					func(event)
				end
			end)
		end 
	end	
end



--===================================================
-- REQUIREMENTS

require("script.weaponScript")
require("script.developmentScript")
require("script.spellScript")


magitory:ReloadEvents()
