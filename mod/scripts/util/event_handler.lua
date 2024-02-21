if not magitory then magitory = {} end

function magitory:DefineEvent(name, func)
	if not self.eventList then self.eventList = {} end
	if not self.eventList[name] then self.eventList[name] = {} end
	table.insert(self.eventList[name], func)
end

function magitory:ReloadEvents()
	if self.eventList then
		for eventName,events in pairs(self.eventList) do
			script.on_event(eventName, function(event)
				for _,func in pairs(magitory.eventList[eventName]) do
					func(event)
				end
			end)
		end 
	end	
end