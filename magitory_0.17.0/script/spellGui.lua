NUMBERSTOTEN = {"1","2","3","4","5","6","7","8","9","10"}


if not spellGui then 
	spellGui = {}
	--spellGui.isInit = false
	spellGui.selected = 1
end

function spellGui:consumeSpell(player)
	if player.get_main_inventory().get_item_count("spellbook")==0 then return "no_spellbook" end
	if not player.get_main_inventory().find_item_stack("spellbook").get_inventory(defines.inventory.item_main)[spellGui.selected].valid_for_read then return "no_spell" end
	
	player.get_main_inventory().find_item_stack("spellbook").get_inventory(defines.inventory.item_main)[spellGui.selected].count = player.get_main_inventory().find_item_stack("spellbook").get_inventory(defines.inventory.item_main)[spellGui.selected].count -1
	
end

function spellGui:get_selected(player)
	if player.get_main_inventory().get_item_count("spellbook")==0 then return "no_spellbook" end
	if not player.get_main_inventory().find_item_stack("spellbook").get_inventory(defines.inventory.item_main)[spellGui.selected].valid_for_read then return "no_spell" end
	return player.get_main_inventory().find_item_stack("spellbook").get_inventory(defines.inventory.item_main)[spellGui.selected].name
end

function spellGui:update(player)
		local inventory = player.get_main_inventory()
		if(inventory.get_item_count("spellbook")==0) then
			player.gui.screen.spellGuiFrame.visible = false
		else
			player.gui.screen.spellGuiFrame.visible = true
			local spellbook_inventory = inventory.find_item_stack("spellbook").get_inventory(defines.inventory.item_main)
			player.gui.screen.spellGuiFrame.clear()
			for int,numb in pairs(NUMBERSTOTEN) do
				if spellbook_inventory[int].valid_for_read then
					self:add_sprite_button(player,spellbook_inventory[int].name,int)
				else
					self:add_sprite_button(player,nil,int)
				end 
			end
		end
end

function spellGui:add_sprite_button(player,item,int)
	if int == self.selected then

		player.gui.screen.spellGuiFrame.add{type="line", name="left1"}
		player.gui.screen.spellGuiFrame.add{type="line", name="left2"}
		player.gui.screen.spellGuiFrame.add{type="line", name="left3"}
	end

	--print(self.selected)
	if item then
		player.gui.screen.spellGuiFrame.add{type="sprite", name=int, sprite = "item/"..item}
	else
		player.gui.screen.spellGuiFrame.add{type="sprite", name=int , sprite = "no_spell"}
	end
	if int == self.selected then 
		player.gui.screen.spellGuiFrame.add{type="line", name="right1"}
		player.gui.screen.spellGuiFrame.add{type="line", name="right2"}
		player.gui.screen.spellGuiFrame.add{type="line", name="right3"}
	end
end

function spellGui:init(player)
	if not player.gui.screen.spellGuiFrame then player.gui.screen.add{type="frame", name="spellGuiFrame"} end
	player.gui.screen.spellGuiFrame.location = {0,1000}
	self:update(player)
end


function spellGui:on_gui_click(event)
	if event.element.parent == game.players[event.player_index].gui.screen.spellGuiFrame then
		self.selected = tonumber(event.element.name)
	end
	for _,player in pairs(game.players)do
		self:update(player)
	end
end

function spellGui:test()
	--game.print("test")
end 

magitory:DefineEvent("on_gui_closed", function(event) spellGui:update(game.players[event.player_index]) end)
magitory:DefineEvent("on_gui_opened", function(event) spellGui:update(game.players[event.player_index]) end)
magitory:DefineEvent("on_picked_up_item", function(event) spellGui:update(game.players[event.player_index]) end)
magitory:DefineEvent("on_player_crafted_item", function(event) spellGui:update(game.players[event.player_index]) end)
magitory:DefineEvent("on_player_dropped_item", function(event) spellGui:update(game.players[event.player_index]) end)
magitory:DefineEvent("on_player_main_inventory_changed", function(event) spellGui:update(game.players[event.player_index]) end)
magitory:DefineEvent("on_player_trash_inventory_changed", function(event) spellGui:update(game.players[event.player_index]) end)
--magitory:DefineEvent("on_tick", function(event) spellGui:on_tick() end)
magitory:DefineEvent("on_gui_click",function(event) spellGui:on_gui_click(event) end)
magitory:DefineEvent("on_player_joined_game",function(event) spellGui:init(game.players[event.player_index]) end)