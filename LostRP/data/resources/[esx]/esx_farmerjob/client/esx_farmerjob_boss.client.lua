-- ====================================================================================================================
-- Local function
-- ====================================================================================================================
function OpenBossMenu(PlayerData)
  ESX.UI.Menu.CloseAll()

  local elements = {
    { label = 'Tenue de travail', value = 'cloakroom'  },
    { label = 'Tenue civile',     value = 'cloakroom2' }
  }

  if Config.EnablePlayerManagement and PlayerData.job ~= nil and PlayerData.job.grade_name == 'boss' then
    table.insert(elements, { label = 'Acheter un véhicule d\'entreprise', value = 'buy_vehicle'            })
    table.insert(elements, { label = 'Retirer des fonds',                 value = 'withdraw_society_money' })
    table.insert(elements, { label = 'Déposer des fonds',                 value = 'deposit_society_money'  })
    table.insert(elements, { label = 'Blanchir de l\'argent',             value = 'wash_society_money'     })
  end

  ESX.UI.Menu.Open(
    'default', GetCurrentResourceName(), 'boss_menu', {
      title = 'Fermier',
      align = 'top-left',
      elements = elements
    }, function(data, menu)
      if data.current.value == 'cloakroom' then
        menu.close()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
          if skin.sex == 0 then
            TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_male)
          else
            TriggerEvent('skinchanger:loadClothes', skin, jobSkin.skin_female)
          end

          IsInService = true
        end)
      end

      if data.current.value == 'cloakroom2' then
        menu.close()
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
    			TriggerEvent('skinchanger:loadSkin', skin)
				end)

        IsInService = false
      end

      if data.current.value == 'buy_vehicle' then
        VehicleMenu()
      end

      if data.current.value == 'withdraw_society_money' then
				WithdrawMenu()
			end

      if data.current.value == 'deposit_society_money' then
				DepositMenu()
			end

      if data.current.value == 'wash_society_money' then
				WashMoney()
			end
    end, function(data, menu)
      menu.close()
      CurrentAction     = 'farmer_boss_action'
			CurrentActionMsg  = _U('boss_action_menu')
			CurrentActionData = {}
    end
  )
end

function VehicleMenu()
  IsInShopMenu = true
  ESX.UI.Menu.CloseAll()

  ESX.TriggerServerCallback('esx_society_vehicle:getBuyableVehicles', function(elements)
    ESX.UI.Menu.Open(
      'default', GetCurrentResourceName(), 'society_vehicle', {
        title    = 'Véhicule d\'entreprise',
        align    = 'top-left',
        elements = elements
      }, function(data, menu)
        ESX.TriggerServerCallback('esx_society_vehicle:getVehiclesByCategory', function(vehiclesByCategory)
          local vehicleData = vehiclesByCategory[data.current.name][data.current.value + 1]
          ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'society_vehicle_confirm', {
              title    = 'Acheter ' .. vehicleData.name .. ' pour $' .. vehicleData.price .. ' ?',
              align    = 'top-left',
              elements = {
                { label = 'Oui', value = 'yes' },
                { label = 'Non', value = 'no'  }
              }
            }, function(data2, menu2)
              if data2.current.value == 'yes' then
                if Config.EnablePlayerManagement then
                  ESX.TriggerServerCallback('esx_society_vehicle:buyVehicle', function(hasEnoughMoney)
                    if hasEnoughMoney then
                      menu2.close()
                      ESX.ShowNotification('Vous avez acheté un véhicule.')
                    else
                      ESX.ShowNotification('Vous n\'avez pas assez d\'argent sur votre compte société')
                    end
                  end, 'farmer', vehicleData.model, GetHashKey(vehicleData.model))
                end
              end
            end, function(data2, menu2)
              menu2.close()
          end)
        end, 'farmer')
      end, function(data, menu)
        menu.close()
        IsInShopMenu = false
      end
    )
  end, 'farmer')
end

function WithdrawMenu()
  ESX.UI.Menu.Open(
    'dialog', GetCurrentResourceName(), 'withdraw_society_money_amount', {
      title = 'Montant du retrait'
    }, function(data, menu)
      local amount = tonumber(data.value)
      if amount == nil then
        ESX.ShowNotification('Montant invalide')
      else
        menu.close()
        TriggerServerEvent('esx_society:withdrawMoney', 'farmer', amount)
      end
    end, function(data, menu)
      menu.close()
    end
  )
end

function DepositMenu()
  ESX.UI.Menu.Open(
    'dialog', GetCurrentResourceName(), 'deposit_society_money_amount', {
      title = 'Montant du dépôt'
    }, function(data, menu)
      local amount = tonumber(data.value)
      if amount == nil then
        ESX.ShowNotification('Montant invalide')
      else
        menu.close()
        TriggerServerEvent('esx_society:depositMoney', 'farmer', amount)
      end
    end, function(data, menu)
      menu.close()
    end
  )
end

function WashMoney()
  ESX.UI.Menu.Open(
    'dialog', GetCurrentResourceName(), 'wash_society_money_amount', {
      title = 'Montant à blanchir'
    }, function(data, menu)
      local amount = tonumber(data.value)
      if amount == nil then
        ESX.ShowNotification('Montant invalide')
      else
        menu.close()
        TriggerServerEvent('esx_society:washMoney', 'farmer', amount)
      end
    end, function(data, menu)
      menu.close()
    end
  )
end

function OpenGarageMenu()
  ESX.UI.Menu.CloseAll()

  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'garage_menu', {
      title    = 'Bûcheron - Garage',
      align    = 'top-left',
      elements = {
        { label = 'Sortir un véhicule',  value = 'vehicle_out' },
        { label = 'Rentrer un véhicule', value = 'vehicle_in'  }
      }
    }, function(data, menu)
      if data.current.value == 'vehicle_out' then
        ESX.TriggerServerCallback('esx_society_vehicle:getSocietyVehicles', function(vehicles)
          local elements = {}

          for i = 1, #vehicles, 1 do
            table.insert(elements, { label = vehicles[i].name, value = vehicles[i] })
          end

          ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_menu', {
              title    = 'Véhicules de l\'entreprise',
              align    = 'top-left',
              elements = elements
            }, function(data2, menu2)
              local playerPed   = GetPlayerPed(-1)
              local vehicleData = data2.current.value

              menu2.close()
              menu.close()

              TriggerServerEvent('esx_society_vehicle:exitVehicle', 'farmer', GetHashKey(vehicleData.model))

              ESX.Game.SpawnVehicle(vehicleData.model, {
                x = Config.Zones.VehicleGarage.x,
                y = Config.Zones.VehicleGarage.y,
                z = Config.Zones.VehicleGarage.z
              }, 50.00, function(vehicle)
                ESX.Game.SetVehicleProperties(vehicle, vehicleData)
              end)
            end, function(data2, menu2)
              menu2.close()
              menu.close()
            end
          )
        end, 'farmer')
      end

      if data.current.value == 'vehicle_in' then
        menu.close()

        local vehicle = ESX.Game.GetClosestVehicle({
          x = Config.Zones.VehicleGarage.x,
          y = Config.Zones.VehicleGarage.y,
          z = Config.Zones.VehicleGarage.z
        })

        local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
        TriggerServerEvent('esx_society_vehicle:takeVehicle', 'farmer', vehicleData.model)

        ESX.Game.DeleteVehicle(vehicle)
      end
    end, function(data, menu)
      menu.close()
      CurrentAction     = 'farmer_vehicle_action'
			CurrentActionMsg  = _U('vehicle_action_menu')
			CurrentActionData = {}
    end
  )
end