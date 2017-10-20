TriggerEvent('esx_society:registerSociety', 'farmer', 'Fermier', 'society_farmer', 'society_farmer', 'society_farmer', {type = 'public'})

ESX                             = nil
local PlayersHarvestingFarmer   = {}
local PlayersTransformingFarmer = {}
local PlayersSellingFarmer      = {}
local PlayersSelledFarmer = {}



-- ====================================================================================================================
-- Basic event handler
-- ====================================================================================================================
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-- ====================================================================================================================
-- Local function
-- ====================================================================================================================
local function HarvestFarmer(source)

  SetTimeout(5000, function()
    if PlayersHarvestingFarmer[source] == true then
      local xPlayer = ESX.GetPlayerFromId(source)
      local farmer    = xPlayer.getInventoryItem('farmer')

      if farmer.limit == -1 and farmer.count >= 30 then
        TriggerClientEvent('esx:showNotification', source, _U('inv_full_farmer'))
      else
        xPlayer.addInventoryItem('farmer', 1)
        HarvestFarmer(source)
      end
    end
  end)

end

local function TransformFarmer(source)

  SetTimeout(10000, function()
    if PlayersTransformingFarmer[source] == true then
      local xPlayer       = ESX.GetPlayerFromId(source)
      local farmerQuantity  = xPlayer.getInventoryItem('farmer').count
      local poochQuantity = xPlayer.getInventoryItem('farmer_pooch')

      if poochQuantity ~= nil then
          print('passe')
          if poochQuantity.count >= 35 then
            TriggerClientEvent('esx:showNotification', source, _U('too_many_pouches'))
          elseif farmerQuantity < 1 then
            TriggerClientEvent('esx:showNotification', source, _U('not_enough_farmer'))
          else
            xPlayer.removeInventoryItem('farmer', 1)
            xPlayer.addInventoryItem('farmer_pooch', 1)
            TransformFarmer(source)
          end

        
      elseif poochQuantity == nil and farmerQuantity > 0 then
            xPlayer.removeInventoryItem('farmer', 1)
            xPlayer.addInventoryItem('farmer_pooch', 1)
      end
    end
  end)

end

local function SellFarmer(source)

  SetTimeout(7500, function()
    if PlayersSellingFarmer[source] == true then
      local xPlayer       = ESX.GetPlayerFromId(source)
      local poochQuantity = xPlayer.getInventoryItem('farmer_pooch').count

      if poochQuantity == 0 then
				TriggerClientEvent('esx:showNotification', source, _U('no_pouches_sale'))
      else
        xPlayer.removeInventoryItem('farmer_pooch', 1)
        xPlayer.addMoney(45)

       PlayersSelledFarmer[source].count = PlayersSelledFarmer[source].count + 1 

        SellFarmer(source)
      end
    end
  end)

end


-- ====================================================================================================================
-- Event handler
-- ====================================================================================================================
RegisterServerEvent('esx_farmerjob:startHarvestFarmer')
AddEventHandler('esx_farmerjob:startHarvestFarmer', function()
  local _source = source
  PlayersHarvestingFarmer[_source] = true
  TriggerClientEvent('esx:showNotification', _source, _U('pickup_in_prog'))
  HarvestFarmer(source)
end)

RegisterServerEvent('esx_farmerjob:stopHarvestFarmer')
AddEventHandler('esx_farmerjob:stopHarvestFarmer', function() 
  local _source = source
  PlayersHarvestingFarmer[_source] = false
end)

RegisterServerEvent('esx_farmerjob:startTransformFarmer')
AddEventHandler('esx_farmerjob:startTransformFarmer', function()
	local _source = source
	PlayersTransformingFarmer[_source] = true
	TriggerClientEvent('esx:showNotification', _source, _U('packing_in_prog'))
	TransformFarmer(source)
end)

RegisterServerEvent('esx_farmerjob:stopTransformFarmer')
AddEventHandler('esx_farmerjob:stopTransformFarmer', function()
	local _source = source
	PlayersTransformingFarmer[_source] = false
end)

RegisterServerEvent('esx_farmerjob:startSellFarmer')
AddEventHandler('esx_farmerjob:startSellFarmer', function()
  local _source = source
  PlayersSellingFarmer[_source] = true
  PlayersSelledFarmer[_source]    = { count = 0 }
  TriggerClientEvent('esx:showNotification', _source, _U('sale_in_prog'))
  SellFarmer(source)
end)

RegisterServerEvent('esx_farmerjob:stopSellFarmer')
AddEventHandler('esx_farmerjob:stopSellFarmer', function()
  local _source = source

  if PlayersSellingFarmer[_source] ~= nil and PlayersSelledFarmer[_source] ~= nil then
    PlayersSellingFarmer[_source] = false

      TriggerEvent('esx_addonaccount:getSharedAccount', 'society_farmer', function(account)
          account.addMoney(PlayersSelledFarmer[_source].count * 45)
      end)
  end
end)

RegisterServerEvent('esx_farmerjob:GetUserInventory')
AddEventHandler('esx_farmerjob:GetUserInventory', function(currentZone)
  local _source = source
  local xPlayer = ESX.GetPlayerFromId(source)
  TriggerClientEvent(
    'esx_farmerjob:ReturnInventory', 
    _source, 
    xPlayer.getInventoryItem('farmer').count, 
    xPlayer.getInventoryItem('farmer_pooch'),
     xPlayer.job.name, 
     currentZone
  )
end)

-- ====================================================================================================================
-- Usable item
-- ====================================================================================================================
--[[
  ESX.RegisterUsableItem('farmer_pooch', function(source)

  local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeInventoryItem('farmer_pooch', 1)

	TriggerEvent('esx_status:getStatus', _source, 'hunger', function(status)

		status.add(400000)
		status.updateClient()

		TriggerClientEvent('esx_basicneeds:onEat', _source)
		TriggerClientEvent('esx:showNotification', _source, _U('used_one_farmer_pooch'))

	end)

end) --]]