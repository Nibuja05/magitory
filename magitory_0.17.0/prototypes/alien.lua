


function AddArtefactLoot()
	--entityType, entityName, probability, countMin, countMax
	for _, spawner in pairs(data.raw["unit-spawner"]) do
		if not spawner.loot then spawner.loot = {} end
		table.insert(spawner, { item = "alien_artefact", probability = 0.5, count_min = 1, count_max = 3})
	end
end

data:extend({AddArtefactLoot()})