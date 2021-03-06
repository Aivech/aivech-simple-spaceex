-- landfill
local landfill = data.raw.recipe["landfill"]
if not  settings.startup["aivech-ssx-aai-recipes"].value then
  landfill.normal = nil
  landfill.expensive = nil
  landfill.ingredients = {{"stone", 20}}
  landfill.result = "landfill"
  landfill.energy_required = 0.5
end

-- modules
local modules = {}
local ranks = {"","-2","-3"}
if not settings.startup["aivech-ssx-modules"].value then
  for _, type in ipairs({"productivity", "speed", "effectivity"}) do
    for rank, suffix in ipairs(ranks) do 
      log(type.."-module"..suffix)
      local mod = data.raw.recipe[type.."-module"..suffix]
      mod.normal = nil
      mod.expensive = nil
      mod.result = type.."-module"..suffix
      mod.enabled = false
      mod.energy_required = 15*2^(rank-1)
      if rank == 1 then
        mod.ingredients = {{"advanced-circuit", 5},{"electronic-circuit", 5}}
        -- mod.energy_required = 15
      --[[elseif rank == 2 then
        mod.ingredients = 
        {
          {type.."-module", 4},
          {"advanced-circuit", 5},
          {"processing-unit", 5}
        }
        -- mod.energy_required = 30]]--
      else
        mod.ingredients = 
        {
          {type.."-module"..ranks[rank-1], rank+2},
          {"advanced-circuit", 5},
          {"processing-unit", 5}
        }
        -- mod.energy_required = 60
      end
      modules[type..rank] = mod
    end
  end
end

-- nuke
local nuke = data.raw.recipe["atomic-bomb"]
if not settings.startup["aivech-ssx-expensive-nuke"].value then
  nuke.normal=nil
  nuke.expensive=nil
  nuke.ingredients = 
  {
    {"rocket-control-unit", 10},
    {"explosives", 10},
    {"uranium-235", 30}
  }
  nuke.energy_required=50
  nuke.result = "atomic-bomb"
end

data:extend({
  modules["speed1"], modules["speed2"], modules["speed3"],
  modules["productivity1"], modules["productivity2"], modules["productivity3"],
  modules["effectivity1"], modules["effectivity2"], modules["effectivity3"],
  landfill, nuke
})
