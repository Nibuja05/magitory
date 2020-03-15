
function update(player)
	
	
end


script.on_event(defines.events.on_gui_closed,
	function(event)
	
		if event.gui_type== defines.gui_type.item then
		
			update(event.player)
			contents = event.item.get_inventory(defines.inventory.item_main).get_contents()
			
			for pair1,pair2 in pairs(contents) do
				game.print(pair1)
			end
		end
	end
)

