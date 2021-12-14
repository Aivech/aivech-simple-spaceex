function replace_tech_prerequisites(tech, prereq_names) 
  if tech then 
    tech.prerequisites = {}
    for _,name in pairs(prereq_names) do
      if data.raw.technology[name] then
        table.insert(tech.prerequisites, name)
      end
    end
  end
end

function replace_tech_cost(tech, normal_unit, expensive_unit) 
  if tech then
    if not tech.normal then
      tech.unit = normal_unit
    else
      tech.normal.unit = normal_unit
      tech.expensive.unit = expensive_unit
    end
  end
end

function create_tech_unit(count, time, ingredients)
  local unit = {}
  unit.count = count
  unit.time = time
  unit.ingredients = {}
  for _, item in pairs(ingredients) do
    table.insert(unit.ingredients, {item,1})
  end
  return unit
end

local automation_science_ingredients = {"automation-science-pack"}
local logistics_science_ingredients = {"automation-science-pack","logistic-science-pack"}
local military_science_ingredients = {"automation-science-pack","logistic-science-pack","military-science-pack"}
local chemical_science_ingredients = {"automation-science-pack","logistic-science-pack","chemical-science-pack"}
local military_chemical_science_ingredients = {"automation-science-pack","logistic-science-pack","military-science-pack","chemical-science-pack"}
local production_science_ingredients = {"automation-science-pack","logistic-science-pack","chemical-science-pack","production-science-pack"}
local utility_science_ingredients = {"automation-science-pack","logistic-science-pack","chemical-science-pack","utility-science-pack"}
local utility_military_science_ingredients = {"automation-science-pack","logistic-science-pack","military-science-pack","chemical-science-pack","utility-science-pack"}
local production_utility_science_ingredients = {"automation-science-pack","logistic-science-pack","chemical-science-pack","production-science-pack","utility-science-pack"}
local production_utility_military_science_ingredients = {"automation-science-pack","logistic-science-pack","military-science-pack","chemical-science-pack","production-science-pack","utility-science-pack"}

if not settings.startup["aivech-ssx-equipment-research"].value then
  
  --burner inserters locked behind basic automation
  
  --inserters locked behind electricity
  
  --small electric pole locked behind electricity
  
  --fuel refining was locked behind its own tech - petroleum gas should be behind oil processing, the other 2 behind advanced oil
  
  --electronics shouldn't unlock any items, but still shows as unlocking electronic circuits (though they're unlocked from the start)
  
  --radar is locked behind its own tech
  
  local automation = data.raw.technology["automation"]
  replace_tech_cost(automation, create_tech_unit(10,10, automation_science_ingredients), nil)
  
  local physical_projectile_damage4 = data.raw.technology["physical-projectile-damage-4"]
  replace_tech_prerequisites(physical_projectile_damage4, {
                                                           "physical-projectile-damage-3"
                                                          })  
  replace_tech_cost(physical_projectile_damage4, create_tech_unit(400,60, military_science_ingredients), nil)
  
  local physical_projectile_damage5 = data.raw.technology["physical-projectile-damage-5"]
  replace_tech_prerequisites(physical_projectile_damage5, {
                                                           "physical-projectile-damage-4"
                                                          })  
  replace_tech_cost(physical_projectile_damage5, create_tech_unit(500,60, military_chemical_science_ingredients), nil)
  
  local physical_projectile_damage6 = data.raw.technology["physical-projectile-damage-6"]
  replace_tech_prerequisites(physical_projectile_damage6, {
                                                           "physical-projectile-damage-5"
                                                          })  
  replace_tech_cost(physical_projectile_damage6, create_tech_unit(600,60, utility_military_science_ingredients), nil)
  
  local weapon_shooting_speed4 = data.raw.technology["weapon-shooting-speed-4"]
  replace_tech_prerequisites(weapon_shooting_speed4, {
                                                      "weapon-shooting-speed-3"
                                                     })
  replace_tech_cost(weapon_shooting_speed4, create_tech_unit(400,60, military_science_ingredients), nil)
  
  local weapon_shooting_speed5 = data.raw.technology["weapon-shooting-speed-5"]
  replace_tech_prerequisites(weapon_shooting_speed5, {
                                                      "weapon-shooting-speed-4"
                                                     })  
  replace_tech_cost(weapon_shooting_speed5, create_tech_unit(500,60, military_chemical_science_ingredients), nil)
  
  local weapon_shooting_speed6 = data.raw.technology["weapon-shooting-speed-6"]
  replace_tech_prerequisites(weapon_shooting_speed6, {
                                                      "weapon-shooting-speed-5"
                                                     })  
  replace_tech_cost(weapon_shooting_speed6, create_tech_unit(600,60, utility_military_science_ingredients), nil)
  
  local logistics2 = data.raw.technology["logistics-2"]
  replace_tech_prerequisites(logistics2, {
                                           "logistic-science-pack",
                                           "logistics"
                                          })
  
  local advanced_material_processing = data.raw.technology["advanced-material-processing"]
  replace_tech_prerequisites(advanced_material_processing, {
                                                            "logistic-science-pack",
                                                            "steel-processing"
                                                           })
  
  local engine = data.raw.technology["engine"]
  replace_tech_prerequisites(engine, {
                                      "logistic-science-pack",
                                      "steel-processing"
                                     })
  
  local automation2 = data.raw.technology["automation-2"]
  replace_tech_prerequisites(automation2, {
                                           "electronics",
                                           "logistic-science-pack",
                                           "steel-processing"
                                          })
  replace_tech_cost(automation2, create_tech_unit(40,15, logistics_science_ingredients), nil)
  
  -- fast filter inserter was split into another tech
  
  local solar_energy = data.raw.technology["solar-energy"]
  replace_tech_prerequisites(solar_energy, {
                                            "electronics",
                                            "logistic-science-pack",
                                            "optics",
                                            "steel-processing"
                                           })
  
  --medium pole was split off into another (less expensive) tech
  local electric_energy_distribution1 = data.raw.technology["electric-energy-distribution-1"]
  replace_tech_prerequisites(electric_energy_distribution1, {
                                                             "electronics",
                                                             "logistic-science-pack",
                                                             "steel-processing"
                                                            })
  
  -- toolbelt was turned into a sequential research (like shooting speed, for example) with the first step lower than the original
  -- toolbelt tech
  
  local concrete = data.raw.technology["concrete"]
  replace_tech_prerequisites(concrete, {
                                        "advanced-material-processing",
                                        "automation-2"
                                       })
  
  -- basic, researchless items (pipe, pipe-to-ground, offshore pump) were locked behind Basic fluid handling
  local fluid_handling = data.raw.technology["fluid-handling"]
  replace_tech_prerequisites(fluid_handling, {
                                              "automation-2",
                                              "engine"
                                             })
  
  local research_speed5 = data.raw.technology["research-speed-5"]
  replace_tech_prerequisites(research_speed5, {
                                                   "research-speed-4"
                                                  })
  replace_tech_cost(research_speed5, create_tech_unit(500,30, production_science_ingredients), nil)
  
  local research_speed6 = data.raw.technology["research-speed-6"]
  replace_tech_prerequisites(research_speed6, {
                                                   "research-speed-5"
                                                  })
  replace_tech_cost(research_speed6, create_tech_unit(500,30, production_utility_science_ingredients), nil)
  
  local gate = data.raw.technology["gate"]
  replace_tech_prerequisites(gate, {
                                    "military-2",
                                    "stone-wall"
                                   })
  
  local stronger_explosives5 = data.raw.technology["stronger-explosives-5"]
  replace_tech_prerequisites(stronger_explosives5, {
                                                    "stronger-explosives-4"
                                                   })
  replace_tech_cost(stronger_explosives5, create_tech_unit(500,60, utility_military_science_ingredients), nil)
  
  local stronger_explosives6 = data.raw.technology["stronger-explosives-6"]
  replace_tech_prerequisites(stronger_explosives6, {
                                                    "stronger-explosives-5"
                                                   })
  replace_tech_cost(stronger_explosives6, create_tech_unit(600,60, utility_military_science_ingredients), nil)
  
  local oil_processing = data.raw.technology["oil-processing"]
  replace_tech_prerequisites(oil_processing, {
                                              "fluid-handling"
                                             })
  
  local advanced_electronics = data.raw.technology["advanced-electronics"]
  replace_tech_prerequisites(advanced_electronics, {
                                                    "plastics"
                                                   })
  
  -- stack filter inserter was split into its own tech
  
  -- mining productivity 3's research costs no longer include utility science packs, unlike vanilla
  
  local modules = data.raw.technology["modules"]
  replace_tech_prerequisites(modules, {
                                       "advanced-electronics"
                                      })
  
  local chemical_science_pack = data.raw.technology["chemical-science-pack"]
  replace_tech_prerequisites(chemical_science_pack, {
                                                     "advanced-electronics",
                                                     "sulfur-processing"
                                                    })
  
  local inserter_capacity_bonus5 = data.raw.technology["inserter-capacity-bonus-5"]
  replace_tech_prerequisites(inserter_capacity_bonus5, {
                                                        "inserter-capacity-bonus-4"
                                                       })
  replace_tech_cost(inserter_capacity_bonus5, create_tech_unit(300,30, production_science_ingredients), nil)
  
  local inserter_capacity_bonus6 = data.raw.technology["inserter-capacity-bonus-6"]
  replace_tech_prerequisites(inserter_capacity_bonus6, {
                                                        "inserter-capacity-bonus-5"
                                                       })
  replace_tech_cost(inserter_capacity_bonus6, create_tech_unit(400,30, production_science_ingredients), nil)
  
  local inserter_capacity_bonus7 = data.raw.technology["inserter-capacity-bonus-7"]
  replace_tech_prerequisites(inserter_capacity_bonus7, {
                                                        "inserter-capacity-bonus-6"
                                                       })
  replace_tech_cost(inserter_capacity_bonus7, create_tech_unit(600,30, production_utility_science_ingredients), nil)
  
  local refined_flammables5 = data.raw.technology["refined-flammables-5"]
  replace_tech_prerequisites(refined_flammables5, {
                                                   "refined-flammables-4"
                                                  })
  replace_tech_cost(refined_flammables5, create_tech_unit(500,60, utility_military_science_ingredients), nil)
  
  local refined_flammables6 = data.raw.technology["refined-flammables-6"]
  replace_tech_prerequisites(refined_flammables6, {
                                                   "refined-flammables-5"
                                                  })
  replace_tech_cost(refined_flammables6, create_tech_unit(600,60, utility_military_science_ingredients), nil)
  
  local follower_robot_count5 = data.raw.technology["follower-robot-count-5"]
  replace_tech_prerequisites(follower_robot_count5, {
                                                     "follower-robot-count-4",
                                                     "destroyer"
                                                    })
  replace_tech_cost(follower_robot_count5, create_tech_unit(800,30, utility_military_science_ingredients), nil)
  
  local follower_robot_count6 = data.raw.technology["follower-robot-count-6"]
  replace_tech_prerequisites(follower_robot_count6, {
                                                     "follower-robot-count-5"
                                                    })
  replace_tech_cost(follower_robot_count6, create_tech_unit(1000,30, utility_military_science_ingredients), nil)
  
  --local energy_shield_equipment = data.raw.technology["energy-shield-equipment"]
  --replace_tech_prerequisites(energy_shield_equipment, {
  --                                                     "military-science-pack",
  --                                                     "solar-panel-equipment"
  --                                                    })
  --replace_tech_cost(energy_shield_equipment, create_tech_unit(150,15, military_science_ingredients), nil)
  
  local advanced_material_processing2 = data.raw.technology["advanced-material-processing-2"]
  replace_tech_prerequisites(advanced_material_processing2, {
                                                             "advanced-material-processing",
                                                             "chemical-science-pack"
                                                            })
  
  local laser = data.raw.technology["laser"]
  replace_tech_prerequisites(laser, {
                                     "battery",
                                     "chemical-science-pack",
                                     "optics"
                                    })
  
  local nuclear_power = data.raw.technology["nuclear-power"]
  replace_tech_prerequisites(nuclear_power, {
                                             "uranium-processing"
                                            })
  
  local rocket_fuel = data.raw.technology["rocket-fuel"]
  replace_tech_prerequisites(rocket_fuel, {
                                           "advanced-oil-processing",
                                           "flammables"
                                          })
  
  local laser_turret = data.raw.technology["laser-turret"]
  replace_tech_prerequisites(laser_turret, {
                                            "laser",
                                            "military-science-pack"
                                           })
  
  local braking_force5 = data.raw.technology["braking-force-5"]
  replace_tech_prerequisites(braking_force5, {
                                              "braking-force-4"
                                             })
  replace_tech_cost(braking_force5, create_tech_unit(450,35, production_science_ingredients), nil)
  
  local braking_force6 = data.raw.technology["braking-force-6"]
  replace_tech_prerequisites(braking_force6, {
                                              "braking-force-5"
                                             })
  replace_tech_cost(braking_force6, create_tech_unit(550,45, production_utility_science_ingredients), nil)
  
  local braking_force7 = data.raw.technology["braking-force-7"]
  replace_tech_prerequisites(braking_force7, {
                                              "braking-force-6"
                                             })
  replace_tech_cost(braking_force7, create_tech_unit(650,60, production_utility_science_ingredients), nil)
  
  local electric_engine = data.raw.technology["electric-engine"]
  replace_tech_prerequisites(electric_engine, {
                                               "lubricant"
                                              })
  
  local laser_shooting_speed5 = data.raw.technology["laser-shooting-speed-5"]
  replace_tech_prerequisites(laser_shooting_speed5, {
                                                     "laser-shooting-speed-4"
                                                    })
  replace_tech_cost(laser_shooting_speed5, create_tech_unit(200,60, utility_military_science_ingredients), nil)
  
  local laser_shooting_speed6 = data.raw.technology["laser-shooting-speed-6"]
  replace_tech_prerequisites(laser_shooting_speed6, {
                                                     "laser-shooting-speed-5"
                                                    })
  replace_tech_cost(laser_shooting_speed6, create_tech_unit(350,60, utility_military_science_ingredients), nil)
  
  local laser_shooting_speed7 = data.raw.technology["laser-shooting-speed-7"]
  replace_tech_prerequisites(laser_shooting_speed7, {
                                                     "laser-shooting-speed-6"
                                                    })
  replace_tech_cost(laser_shooting_speed7, create_tech_unit(450,60, utility_military_science_ingredients), nil)
  
  local energy_weapons_damage5 = data.raw.technology["energy-weapons-damage-5"]
  replace_tech_prerequisites(energy_weapons_damage5, {
                                                      "energy-weapons-damage-4"
                                                     })
  replace_tech_cost(energy_weapons_damage5, create_tech_unit(500,60,utility_military_science_ingredients), nil)
  
  local energy_weapons_damage6 = data.raw.technology["energy-weapons-damage-6"]
  replace_tech_prerequisites(energy_weapons_damage6, {
                                                      "energy-weapons-damage-5"
                                                     })
  replace_tech_cost(energy_weapons_damage6, create_tech_unit(600,60,utility_military_science_ingredients), nil)
  
  local worker_robots_speed3 = data.raw.technology["worker-robots-speed-3"]
  replace_tech_prerequisites(worker_robots_speed3, {
                                                    "worker-robots-speed-2"
                                                   })
  replace_tech_cost(worker_robots_speed3, create_tech_unit(150,60, utility_science_ingredients), nil)
  
  local worker_robots_speed4 = data.raw.technology["worker-robots-speed-4"]
  replace_tech_prerequisites(worker_robots_speed4, {
                                                    "worker-robots-speed-3"
                                                   })
  replace_tech_cost(worker_robots_speed4, create_tech_unit(250,60, utility_science_ingredients), nil)
  
  local worker_robots_speed5 = data.raw.technology["worker-robots-speed-5"]
  replace_tech_prerequisites(worker_robots_speed5, {
                                                    "worker-robots-speed-4"
                                                   })
  replace_tech_cost(worker_robots_speed5, create_tech_unit(500,60, production_utility_science_ingredients), nil)
  
  local worker_robots_storage1 = data.raw.technology["worker-robots-storage-1"]
  replace_tech_prerequisites(worker_robots_storage1, {
                                                      "robotics"
                                                     })
  replace_tech_cost(worker_robots_storage1, create_tech_unit(200,30, chemical_science_ingredients), nil)
  
  local worker_robots_storage2 = data.raw.technology["worker-robots-storage-2"]
  replace_tech_prerequisites(worker_robots_storage2, {
                                                      "worker-robots-storage-1"
                                                     })
  replace_tech_cost(worker_robots_storage2, create_tech_unit(300,60, production_science_ingredients), nil)
  
  local worker_robots_storage3 = data.raw.technology["worker-robots-storage-3"]
  replace_tech_prerequisites(worker_robots_storage3, {
                                                      "worker-robots-storage-2"
                                                     })
  replace_tech_cost(worker_robots_storage3, create_tech_unit(450,60, production_utility_science_ingredients), nil)
  
  --local energy_shield_mk2_equipment = data.raw.technology["energy-shield-mk2-equipment"]
  --replace_tech_prerequisites(energy_shield_mk2_equipment, {
  --                                                         "energy-shield-equipment",
  --                                                         "low-density-structure",
  --                                                         "military-3",
  --                                                         "power-armor"
  --                                                        })
  --replace_tech_cost(energy_shield_mk2_equipment, create_tech_unit(200,30, military_chemical_science_ingredients), nil)
  
  local automation3 = data.raw.technology["automation-3"]
  replace_tech_prerequisites(automation3, {
                                           "production-science-pack",
                                           "speed-module"
                                          })
  
  local productivity_module3 = data.raw.technology["productivity-module-3"]
  replace_tech_prerequisites(productivity_module3, {
                                                    "production-science-pack",
                                                    "productivity-module-2"
                                                   })
  
  local effectivity_module3 = data.raw.technology["effectivity-module-3"]
  replace_tech_prerequisites(effectivity_module3, {
                                                   "production-science-pack",
                                                   "effectivity-module-2"
                                                  })
  
  local speed_module3 = data.raw.technology["speed-module-3"]
  replace_tech_prerequisites(speed_module3, {
                                             "production-science-pack",
                                             "speed-module-2"
                                            })
  
  local rocket_control_unit = data.raw.technology["rocket-control-unit"]
  replace_tech_prerequisites(rocket_control_unit, {
                                                   "speed-module",
                                                   "utility-science-pack"
                                                  })
  replace_tech_cost(rocket_control_unit, create_tech_unit(300,45, utility_science_ingredients), nil)
  
  local rocket_silo = data.raw.technology["rocket-silo"]
  replace_tech_prerequisites(rocket_silo, {
                                           "concrete",
                                           "productivity-module-3",
                                           "rocket-control-unit",
                                           "rocket-fuel",
                                           "speed-module-3"
                                          })
  replace_tech_cost(rocket_silo, create_tech_unit(1000,60, production_utility_science_ingredients), nil)
  
  --local fusion_reactor_equipment = data.raw.technology["fusion-reactor-equipment"]
  --replace_tech_prerequisites(fusion_reactor_equipment, {
  --                                                      "military-science-pack",
  --                                                      "power-armor",
  --                                                      "utility-science-pack"
  --                                                     })
  --replace_tech_cost(fusion_reactor_equipment, create_tech_unit(200,30, utility_military_science_ingredients), nil)
  
  local spidertron = data.raw.technology["spidertron"]
  replace_tech_prerequisites(spidertron, {
                                          "effectivity-module-3",
                                          "exoskeleton-equipment",
                                          "fusion-reactor-equipment",
                                          "military-4",
                                          "rocket-control-unit",
                                          "rocketry"
                                         })
  replace_tech_cost(spidertron, create_tech_unit(2500,30, production_utility_military_science_ingredients), nil)
  
  local roboport2 = data.raw.technology["personal-roboport-mk2-equipment"]
  replace_tech_prerequisites(roboport2, {
                                         "personal-roboport-equipment",
                                         "utility-science-pack"
                                        })  
  replace_tech_cost(roboport2, create_tech_unit(250,30, utility_science_ingredients), nil)
  
  local battery2 = data.raw.technology["battery-mk2-equipment"]
  replace_tech_prerequisites(battery2, {"battery-equipment", "low-density-structure", "power-armor"})
  replace_tech_cost(battery2, create_tech_unit(100,30, chemical_science_ingredients),nil)
  
  data:extend({
               automation,physical_projectile_damage4,physical_projectile_damage5,physical_projectile_damage6,
               weapon_shooting_speed4,weapon_shooting_speed5,weapon_shooting_speed6,logistics2,advanced_material_processing,
               engine,automation2,solar_energy,electric_energy_distribution1,concrete,fluid_handling,research_speed5,
               research_speed6,gate,stronger_explosives5,stronger_explosives6,oil_processing,advanced_electronics,modules,
               chemical_science_pack,inserter_capacity_bonus5,inserter_capacity_bonus6,inserter_capacity_bonus7,refined_flammables5,
               refined_flammables6,follower_robot_count5,follower_robot_count6,advanced_material_processing2,
               laser,nuclear_power,rocket_fuel,laser_turret,braking_force5,braking_force6,braking_force7,electric_engine,
               laser_shooting_speed5,laser_shooting_speed6,laser_shooting_speed7,energy_weapons_damage5,energy_weapons_damage6,
               worker_robots_speed3,worker_robots_speed4,worker_robots_speed5,worker_robots_storage1,worker_robots_storage2,
               worker_robots_storage3,automation3,productivity_module3,effectivity_module3,
               speed_module3,rocket_control_unit,rocket_silo,spidertron,roboport2,battery2})
end

  
