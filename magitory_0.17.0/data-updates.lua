function AddArtefactLoot()
	for k, unitSpawner in pairs(data.raw["unit-spawner"]) do
    
    if unitSpawner.loot == nil then 

        unitSpawner.loot = {}
                    
    end
    
    if data.raw.item["alien-artefact"] then
         table.insert(unitSpawner.loot, {  item = "alien-artefact",  count_min = 5,  count_max = 10,  probability = 1 } )
    end
	end
end

AddArtefactLoot()