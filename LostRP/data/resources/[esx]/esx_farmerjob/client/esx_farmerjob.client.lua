ESX                           = nil
IsInService                   = false
local farmerQTE				        = 0
local farmer_breadQTE 		    = 0
local myJob 				          = nil
local PlayerData 			        = {}
local HasAlreadyEnteredMarker = false
local CurrentAction           = nil
local CurrentActionMsg        = ''
local CurrentActionData       = {}
local IsInShopMenu            = false


-- ====================================================================================================================
-- Citizen thread
-- ====================================================================================================================
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


tableauVehicule = {"Véhicule",{["li"] = "defaut", ["h2"] = "defaut", ["ul"] = "defaut"},
                    {["name"] = "4x4",["type"] = "client", ["action"] = "farmer:getCar", ["arg"] = {["vehicle"] = "granger"}},
                }



function sendnotif(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(0,1)   
end

AddEventHandler('farmer:getCar', function(arg)
    sendnotif(tostring(arg.vehicle))
   local vehiculeDetected = GetClosestVehicle(424.00,6474.00,27.00, 6.0, 0, 70)
    if not DoesEntityExist(vehiculeDetected) then
        local myPed = GetPlayerPed(-1)
        local player = PlayerId()
        local vehicle = GetHashKey(tostring(arg.vehicle))
        RequestModel(vehicle)
        while not HasModelLoaded(vehicle) do
            Wait(1)
        end
        local plate = math.random(100, 900)
        existingVeh = CreateVehicle(vehicle,424.00,6474.00 - 5.00,27.00,90.0, true, false)
        SetVehicleHasBeenOwnedByPlayer(existingVeh,true)
        local id = NetworkGetNetworkIdFromEntity(existingVeh)
        SetNetworkIdCanMigrate(id, true)
        SetEntityInvincible(existingVeh, false)
        SetVehicleOnGroundProperly(existingVeh)
        SetVehicleNumberPlateText(existingVeh, "FARMER")
        
        local model = RequestModel(vehicle)


        SetEntityAsMissionEntity(existingVeh, true, true)
        plate = GetVehicleNumberPlateText(existingVeh)
        
        SetModelAsNoLongerNeeded(vehicle)
        Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(existingVeh))
        exports.menu_builder:CloseMenu()
    else
        sendnotif("Zone encombrée.")
    end
end)



Citizen.CreateThread(function()

    while true do

        Citizen.Wait(0)

      
        if GetDistanceBetweenCoords(424.00,6474.00,27.00,GetEntityCoords(GetPlayerPed(-1))) < 3 and PlayerData.job.name == "farmer" then
            sendnotif("~g~Appuyer sur ~b~E~g~ pour acceder au garage")
            if IsControlJustPressed(1,38) then
                exports.menu_builder:CreateMenu(tableauVehicule)
            end
        end
    end
end)



-- Render markers
Citizen.CreateThread(function()
	while true do
		
		Wait(0)
		
		local coords = GetEntityCoords(GetPlayerPed(-1))
		
		for k,v in pairs(Config.Zones) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.DrawDistance) then
        if k == 'BossAction' or k == 'VehicleAction' then
          DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.5, 1.5, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
        else
				  DrawMarker(Config.MarkerType, v.x, v.y, v.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
        end
      end
		end

	end
end)

  -- Create blips
Citizen.CreateThread(function()

	for k,v in pairs(Config.Zones) do
    if v.BlipSprite then
      local blip = AddBlipForCoord(v.x, v.y, v.z - Config.ZDiff)
      SetBlipSprite (blip, v.BlipSprite)
      SetBlipDisplay(blip, 4)
      SetBlipScale  (blip, 0.9)
      SetBlipColour (blip, Config.BlipColor)
      SetBlipAsShortRange(blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(_U(k))
      EndTextCommandSetBlipName(blip)
    end
	end

end)



-- Activate menu when player is inside marker
Citizen.CreateThread(function()
	while true do
		Wait(0)
		
		local coords      = GetEntityCoords(GetPlayerPed(-1))
		local isInMarker  = false
		local currentZone = nil

		for k,v in pairs(Config.Zones) do
			if(GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < Config.ZoneSize.x / 2) then
				isInMarker  = true
				currentZone = k
			end
		end

		if isInMarker and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
			lastZone                = currentZone
			TriggerServerEvent('esx_farmerjob:GetUserInventory', currentZone)
		end

		if not isInMarker and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_farmerjob:hasExitedMarker', lastZone)
		end

	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if CurrentAction ~= nil then
			SetTextComponentFormat('STRING')
			AddTextComponentString(CurrentActionMsg)
			DisplayHelpTextFromStringLabel(0, 0, 1, -1)
			if IsControlJustReleased(0, 38) then
				if CurrentAction == 'farmer_harvest' then
					if IsInService then
						TriggerServerEvent('esx_farmerjob:startHarvestFarmer')
					else
						ESX.ShowNotification('~r~Vous devez être en service pour récolter du blé')
					end
				end
				if CurrentAction == 'farmer_process' then
					if IsInService then
						TriggerServerEvent('esx_farmerjob:startTransformFarmer')
					else
						ESX.ShowNotification('~r~Vous devez être en service pour transformer le blé')
					end
				end
				if CurrentAction == 'farmer_resell' then
					if IsInService then
						TriggerServerEvent('esx_farmerjob:startSellFarmer')
					else
						ESX.ShowNotification('~r~Vous devez être en service pour vendre du pain')
					end
				end

	

		        if CurrentAction == 'farmer_boss_action' then
		          OpenBossMenu(PlayerData)
		        end

		        if CurrentAction == 'farmer_vehicle_action' then
							if IsInService then
		          	OpenGarageMenu()
							else
								ESX.ShowNotification('~r~Vous devez être en service pour prendre un véhicule')
							end
		        end
						CurrentAction = nil				
					end
				end
	end
end)


-- ====================================================================================================================
-- Basic event handler
-- ====================================================================================================================
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
	 if PlayerData.job.name == "farmer" then
	  	for k,v in pairs(Config.Zones) do
	    if v.BlipSprite then
	      local blip = AddBlipForCoord(v.x, v.y, v.z - Config.ZDiff)
	      SetBlipSprite (blip, v.BlipSprite)
	      SetBlipDisplay(blip, 4)
	      SetBlipScale  (blip, 0.9)
	      SetBlipColour (blip, Config.BlipColor)
	      SetBlipAsShortRange(blip, true)
	      BeginTextCommandSetBlipName("STRING")
	      AddTextComponentString(_U(k))
	      EndTextCommandSetBlipName(blip)
	    end
		end
	end

end)


-- ====================================================================================================================
-- Event handler
-- ====================================================================================================================
AddEventHandler('esx_farmerjob:hasEnteredMarker', function(zone)

	ESX.UI.Menu.CloseAll()

  if PlayerData.job ~= nil and PlayerData.job.name == "farmer" then
    if zone == 'HarvestFarmer' then
      CurrentAction     = 'farmer_harvest'
      CurrentActionMsg  = _U('press_collect_farmer')
      CurrentActionData = {}
    end

    if zone == 'ProcessFarmer' then
      if farmerQTE then
        CurrentAction     = 'farmer_process'
        CurrentActionMsg  = _U('press_process_farmer')
        CurrentActionData = {}
      end
    end

    if zone == 'ResellFarmer' then
      if farmer_breadQTE then
        CurrentAction     = 'farmer_resell'
        CurrentActionMsg  = _U('press_sell_bread')
        CurrentActionData = {}
      end
    end

    if zone == 'BossAction' then
      CurrentAction     = 'farmer_boss_action'
      CurrentActionMsg  = _U('boss_action_menu')
      CurrentActionData = {}
    end

    if zone == 'VehicleAction' then
      CurrentAction     = 'farmer_vehicle_action'
      CurrentActionMsg  = _U('vehicle_action_menu')
      CurrentActionData = {}
    end


  end

end)

AddEventHandler('esx_farmerjob:hasExitedMarker', function(zone)

	CurrentAction = nil
	ESX.UI.Menu.CloseAll()

	TriggerServerEvent('esx_farmerjob:stopHarvestFarmer')
	TriggerServerEvent('esx_farmerjob:stopTransformFarmer')
	TriggerServerEvent('esx_farmerjob:stopSellFarmer')
end)

-- Return number of items from server
RegisterNetEvent('esx_farmerjob:ReturnInventory')
AddEventHandler('esx_farmerjob:ReturnInventory', function(farmerNbr, farmerpNbr, jobName, currentZone)
	farmerQTE       = farmerNbr
	farmer_breadQTE = farmerpNbr	
	myJob           = jobName
	TriggerEvent('esx_farmerjob:hasEnteredMarker', currentZone)
end)

RegisterNetEvent('esx_farmerjob:eat')
AddEventHandler('esx_farmerjob:eat', function()  
  RequestAnimDict("mp_player_inteat@burger")
	while not HasAnimDictLoaded("mp_player_inteat@burger") do
		Citizen.Wait(0)
	end

  TaskPlayAnim(pid, 'mp_player_inteat@burger', 'mp_player_int_eat_burger', 1.0, -1.0, 2000, 0, 1, true, true, true)

end)