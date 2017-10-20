ESX                = nil
PlayersHarvesting  = {}
PlayersHarvesting2 = {}
PlayersHarvesting3 = {}
PlayersHarvesting4 = {}
PlayersHarvesting5 = {}
PlayersHarvesting6 = {}
PlayersHarvesting7 = {}
PlayersHarvesting8 = {}
PlayersHarvesting9 = {}
PlayersHarvesting10	= {}
PlayersHarvesting11	= {}
PlayersHarvesting12	= {}
PlayersHarvesting13	= {}
PlayersHarvesting14	= {}
PlayersHarvesting15	= {}
PlayersCrafting    = {}
PlayersCrafting2   = {}
PlayersCrafting3   = {}
PlayersCrafting4   = {}
PlayersCrafting5   = {}
PlayersCrafting6   = {}
PlayersCrafting7   = {}
PlayersCrafting8   = {}
PlayersCrafting9   = {}
PlayersCrafting10  = {}
PlayersCrafting11  = {}
PlayersCrafting12  = {}
PlayersCrafting13  = {}
PlayersCrafting14  = {}
PlayersCrafting15  = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
	TriggerEvent('esx_service:activateService', 'disco', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'disco', 'Client Disco', true, true)
TriggerEvent('esx_society:registerSociety', 'disco', 'Disco', 'society_disco', 'society_disco', 'society_disco', {type = 'private'})

-------------- Récupération menthe -------------
local function Harvest(source)

	SetTimeout(4000, function()

		if PlayersHarvesting[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local mentheQuantity = xPlayer.getInventoryItem('menthe').count

			if mentheQuantity >= 10 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous avez le maximum de menthe')		
			else   
                xPlayer.addInventoryItem('menthe', 10)
					
				Harvest(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest')
AddEventHandler('esx_discojob:startHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte de ~b~Menthe~s~...')
	Harvest(source)
end)

RegisterServerEvent('esx_discojob:stopHarvest')
AddEventHandler('esx_discojob:stopHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = false
end)
------------ Récupération pommedeterre --------------
local function Harvest2(source)

	SetTimeout(4000, function()

		if PlayersHarvesting2[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local pdtQuantity  = xPlayer.getInventoryItem('pommedeterre').count
			if pdtQuantity >= 10 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous avez le maximum de pomme de terre')				
			else
                xPlayer.addInventoryItem('pommedeterre', 10)
					
				Harvest2(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest2')
AddEventHandler('esx_discojob:startHarvest2', function()
	local _source = source
	PlayersHarvesting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte de ~b~Pomme de terre~s~...')
	Harvest2(_source)
end)

RegisterServerEvent('esx_discojob:stopHarvest2')
AddEventHandler('esx_discojob:stopHarvest2', function()
	local _source = source
	PlayersHarvesting2[_source] = false
end)
----------------- Récupération raisin----------------
local function Harvest3(source)

	SetTimeout(4000, function()

		if PlayersHarvesting3[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local raisinQuantity  = xPlayer.getInventoryItem('raisin').count
            if raisinQuantity >= 10 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous avez le maximum de raisin')					
			else
                xPlayer.addInventoryItem('raisin', 10)
					
				Harvest3(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest3')
AddEventHandler('esx_discojob:startHarvest3', function()
	local _source = source
	PlayersHarvesting3[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte des ~b~Raisins~s~...')
	Harvest3(_source)
end)

RegisterServerEvent('esx_discojob:stopHarvest3')
AddEventHandler('esx_discojob:stopHarvest3', function()
	local _source = source
	PlayersHarvesting3[_source] = false
end)

-------------- Récuperer limonade -------------
local function Harvest4(source)

	SetTimeout(4000, function()

		if PlayersHarvesting4[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local limonadeQuantity  = xPlayer.getInventoryItem('limonade').count
            if limonadeQuantity >= 10 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous avez le maximum de limonade')					
			else
                xPlayer.addInventoryItem('limonade', 10)
					
				Harvest4(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest4')
AddEventHandler('esx_discojob:startHarvest4', function()
	local _source = source
	PlayersHarvesting4[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Fabrication des  ~b~limonades~s~...')
	Harvest4(_source)
end)

RegisterServerEvent('esx_discojob:stopHarvest4')
AddEventHandler('esx_discojob:stopHarvest4', function()
	local _source = source
	PlayersHarvesting4[_source] = false
end)

-------------- Récuperer l'amidon -------------
local function Harvest5(source)

	SetTimeout(4000, function()

		if PlayersHarvesting5[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local amidonQuantity  = xPlayer.getInventoryItem('amidon').count
            if amidonQuantity >= 10 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous avez le maximum d\'amidon')					
			else
                xPlayer.addInventoryItem('amidon', 10)
					
				Harvest5(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest5')
AddEventHandler('esx_discojob:startHarvest5', function()
	local _source = source
	PlayersHarvesting5[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte des ~b~Amidons~s~...')
	Harvest5(_source)
end)

RegisterServerEvent('esx_discojob:stopHarvest5')
AddEventHandler('esx_discojob:stopHarvest5', function()
	local _source = source
	PlayersHarvesting5[_source] = false
end)

-------------- Récuperer des Oranges -------------
local function Harvest6(source)

	SetTimeout(4000, function()

		if PlayersHarvesting6[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local orangeQuantity  = xPlayer.getInventoryItem('orange').count
            if orangeQuantity >= 10 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous avez le maximum d\'orange')					
			else
                xPlayer.addInventoryItem('orange', 10)
					
				Harvest6(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest6')
AddEventHandler('esx_discojob:startHarvest6', function()
	local _source = source
	PlayersHarvesting6[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte des ~b~Oranges~s~...')
	Harvest6(_source)
end)

RegisterServerEvent('esx_discojob:stopHarvest6')
AddEventHandler('esx_discojob:stopHarvest6', function()
	local _source = source
	PlayersHarvesting6[_source] = false
end)

-------------- Récupération steackhache -------------
local function Harvest7(source)

	SetTimeout(4000, function()

		if PlayersHarvesting7[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local steackhacheQuantity = xPlayer.getInventoryItem('steackhache').count

			if steackhacheQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez plus de place')		
			else   
                xPlayer.addInventoryItem('steackhache', 10)
					
				Harvest7(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest7')
AddEventHandler('esx_discojob:startHarvest7', function()
	local _source = source
	PlayersHarvesting7[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte de ~b~Steack Haché~s~...')
	Harvest7(source)
end)

RegisterServerEvent('esx_discojob:stopHarvest7')
AddEventHandler('esx_discojob:stopHarvest7', function()
	local _source = source
	PlayersHarvesting7[_source] = false
end)
-------------- Récupération feuilledecoca -------------
local function Harvest8(source)

	SetTimeout(4000, function()

		if PlayersHarvesting8[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local feuilledecocaQuantity = xPlayer.getInventoryItem('feuilledecoca').count

			if feuilledecocaQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez plus de place')		
			else   
                xPlayer.addInventoryItem('feuilledecoca', 10)
					
				Harvest5(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest8')
AddEventHandler('esx_discojob:startHarvest8', function()
	local _source = source
	PlayersHarvesting8[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte de ~b~Feuille de Coca~s~...')
	Harvest8(source)
end)

RegisterServerEvent('esx_discojob:stopHarvest8')
AddEventHandler('esx_discojob:stopHarvest8', function()
	local _source = source
	PlayersHarvesting8[_source] = false
end)
-------------- Récupération thefroid -------------
local function Harvest9(source)

	SetTimeout(4000, function()

		if PlayersHarvesting9[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local thefroidQuantity = xPlayer.getInventoryItem('thefroid').count

			if thefroidQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez plus de place')		
			else   
                xPlayer.addInventoryItem('thefroid', 10)
					
				Harvest9(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest9')
AddEventHandler('esx_discojob:startHarvest9', function()
	local _source = source
	PlayersHarvesting9[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte de ~b~Thé Froid~s~...')
	Harvest9(source)
end)

RegisterServerEvent('esx_discojob:stopHarvest9')
AddEventHandler('esx_discojob:stopHarvest9', function()
	local _source = source
	PlayersHarvesting9[_source] = false
end)

-------------- Récupération cerealesmaltees -------------
local function Harvest10(source)

	SetTimeout(4000, function()

		if PlayersHarvesting10[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local cerealesmalteesQuantity = xPlayer.getInventoryItem('cerealesmaltees').count

			if cerealesmalteesQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez plus de place')		
			else   
                xPlayer.addInventoryItem('cerealesmaltees', 10)
					
				Harvest10(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest10')
AddEventHandler('esx_discojob:startHarvest10', function()
	local _source = source
	PlayersHarvesting10[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte de ~b~Céréales Maltées~s~...')
	Harvest10(source)
end)

RegisterServerEvent('esx_discojob:stopHarvest10')
AddEventHandler('esx_discojob:stopHarvest10', function()
	local _source = source
	PlayersHarvesting10[_source] = false
end)
-------------- Récupération sirop -------------
local function Harvest11(source)

	SetTimeout(4000, function()

		if PlayersHarvesting11[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local siropQuantity = xPlayer.getInventoryItem('sirop').count

			if siropQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez plus de place')		
			else   
                xPlayer.addInventoryItem('sirop', 10)
					
				Harvest11(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest11')
AddEventHandler('esx_discojob:startHarvest11', function()
	local _source = source
	PlayersHarvesting11[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte de ~b~Sirop~s~...')
	Harvest11(source)
end)

RegisterServerEvent('esx_discojob:stopHarvest11')
AddEventHandler('esx_discojob:stopHarvest11', function()
	local _source = source
	PlayersHarvesting11[_source] = false
end)
-------------- Récupération cacao -------------
local function Harvest12(source)

	SetTimeout(4000, function()

		if PlayersHarvesting12[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local cacaoQuantity = xPlayer.getInventoryItem('cacao').count

			if cacaoQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez plus de place')		
			else   
                xPlayer.addInventoryItem('cacao', 10)
					
				Harvest12(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest12')
AddEventHandler('esx_discojob:startHarvest12', function()
	local _source = source
	PlayersHarvesting12[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte de ~b~Cacao~s~...')
	Harvest12(source)
end)

RegisterServerEvent('esx_discojob:stopHarvest12')
AddEventHandler('esx_discojob:stopHarvest12', function()
	local _source = source
	PlayersHarvesting12[_source] = false
end)
-------------- Récupération eaugazifie -------------
local function Harvest13(source)

	SetTimeout(4000, function()

		if PlayersHarvesting13[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local eaugazifieQuantity = xPlayer.getInventoryItem('eaugazifie').count

			if eaugazifieQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez plus de place')		
			else   
                xPlayer.addInventoryItem('eaugazifie', 10)
					
				Harvest13(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest13')
AddEventHandler('esx_discojob:startHarvest13', function()
	local _source = source
	PlayersHarvesting13[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte de ~b~Eau Gazifiée~s~...')
	Harvest13(source)
end)

RegisterServerEvent('esx_discojob:stopHarvest13')
AddEventHandler('esx_discojob:stopHarvest13', function()
	local _source = source
	PlayersHarvesting13[_source] = false
end)
-------------- Récupération agrume -------------
local function Harvest14(source)

	SetTimeout(4000, function()

		if PlayersHarvesting14[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local agrumeQuantity = xPlayer.getInventoryItem('agrume').count

			if agrumeQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez plus de place')		
			else   
                xPlayer.addInventoryItem('agrume', 10)
					
				Harvest14(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest14')
AddEventHandler('esx_discojob:startHarvest14', function()
	local _source = source
	PlayersHarvesting14[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte de ~b~Agrume~s~...')
	Harvest14(source)
end)

RegisterServerEvent('esx_discojob:stopHarvest14')
AddEventHandler('esx_discojob:stopHarvest14', function()
	local _source = source
	PlayersHarvesting14[_source] = false
end)
-------------- Récupération cafeine -------------
local function Harvest15(source)

	SetTimeout(4000, function()

		if PlayersHarvesting15[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local cafeineQuantity = xPlayer.getInventoryItem('cafeine').count

			if cafeineQuantity >= 5 then
				TriggerClientEvent('esx:showNotification', source, '~r~Vous n\'avez plus de place')		
			else   
                xPlayer.addInventoryItem('cafeine', 10)
					
				Harvest15(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startHarvest15')
AddEventHandler('esx_discojob:startHarvest15', function()
	local _source = source
	PlayersHarvesting15[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Récolte de ~b~Caféine~s~...')
	Harvest15(source)
end)

RegisterServerEvent('esx_discojob:stopHarvest15')
AddEventHandler('esx_discojob:stopHarvest15', function()
	local _source = source
	PlayersHarvesting15[_source] = false
end)

------------ Craft mojito -------------------
local function Craft(source)

	SetTimeout(4000, function()

		if PlayersCrafting[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local mentheQuantity = xPlayer.getInventoryItem('menthe').count

			if mentheQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de Menthe')		
			else   
                xPlayer.removeInventoryItem('menthe', 2)
                xPlayer.addInventoryItem('mojito', 1)
					
				Craft(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft')
AddEventHandler('esx_discojob:startCraft', function()
	local _source = source
	PlayersCrafting[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Mojito~s~...')
	Craft(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft')
AddEventHandler('esx_discojob:stopCraft', function()
	local _source = source
	PlayersCrafting[_source] = false
end)
------------ Craft Vodka --------------
local function Craft2(source)

	SetTimeout(4000, function()

		if PlayersCrafting2[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local pdtQuantity  = xPlayer.getInventoryItem('pommedeterre').count
			if pdtQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de Pomme de Terre')				
			else
                xPlayer.removeInventoryItem('pommedeterre', 2)
                xPlayer.addInventoryItem('vodka', 1)
					
				Craft2(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft2')
AddEventHandler('esx_discojob:startCraft2', function()
	local _source = source
	PlayersCrafting2[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Vodka~s~...')
	Craft2(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft2')
AddEventHandler('esx_discojob:stopCraft2', function()
	local _source = source
	PlayersCrafting2[_source] = false
end)
----------------- Craft champagne ----------------
local function Craft3(source)

	SetTimeout(4000, function()

		if PlayersCrafting3[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local raisinQuantity  = xPlayer.getInventoryItem('raisin').count
            if raisinQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de Raisin')					
			else
                xPlayer.removeInventoryItem('raisin', 2)
                xPlayer.addInventoryItem('champagne', 1)
					
				Craft3(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft3')
AddEventHandler('esx_discojob:startCraft3', function()
	local _source = source
	PlayersCrafting3[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Champagne~s~...')
	Craft3(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft3')
AddEventHandler('esx_discojob:stopCraft3', function()
	local _source = source
	PlayersCrafting3[_source] = false
end)

-------------------- Craft Bière --------------
local function Craft4(source)

	SetTimeout(4000, function()

		if PlayersCrafting4[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local limoQuantity  = xPlayer.getInventoryItem('limonade').count
            if limoQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de Limonade')					
			else
                xPlayer.removeInventoryItem('limonade', 2)
                xPlayer.addInventoryItem('beer', 1)
					
				Craft4(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft4')
AddEventHandler('esx_discojob:startCraft4', function()
	local _source = source
	PlayersCrafting4[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Bière~s~...')
	Craft4(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft4')
AddEventHandler('esx_discojob:stopCraft4', function()
	local _source = source
	PlayersCrafting4[_source] = false
end)

-------------------- Craft Whisky --------------
local function Craft5(source)

	SetTimeout(4000, function()

		if PlayersCrafting5[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local amidonQuantity  = xPlayer.getInventoryItem('amidon').count
            if amidonQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ d\'Amidon')					
			else
                xPlayer.removeInventoryItem('amidon', 2)
                xPlayer.addInventoryItem('whisky', 1)
					
				Craft5(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft5')
AddEventHandler('esx_discojob:startCraft5', function()
	local _source = source
	PlayersCrafting5[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Whisky~s~...')
	Craft5(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft5')
AddEventHandler('esx_discojob:stopCraft5', function()
	local _source = source
	PlayersCrafting5[_source] = false
end)

-------------------- Craft Cocktail --------------
local function Craft6(source)

	SetTimeout(4000, function()

		if PlayersCrafting6[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local orangeQuantity  = xPlayer.getInventoryItem('orange').count
            if orangeQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ d\'Orange')					
			else
                xPlayer.removeInventoryItem('orange', 2)
                xPlayer.addInventoryItem('cocktail', 1)
					
				Craft6(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft6')
AddEventHandler('esx_discojob:startCraft6', function()
	local _source = source
	PlayersCrafting6[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Cocktail~s~...')
	Craft6(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft6')
AddEventHandler('esx_discojob:stopCraft6', function()
	local _source = source
	PlayersCrafting6[_source] = false
end)

----------------- Craft hamburger ----------------
local function Craft7(source)

	SetTimeout(4000, function()

		if PlayersCrafting7[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local CaroToolQuantity  = xPlayer.getInventoryItem('steackhache').count
            if CaroToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de Steack Haché')					
			else
                xPlayer.removeInventoryItem('steackhache', 2)
                xPlayer.addInventoryItem('hamburger', 1)
					
				Craft7(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft7')
AddEventHandler('esx_discojob:startCraft7', function()
	local _source = source
	PlayersCrafting7[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Hamburger~s~...')
	Craft7(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft7')
AddEventHandler('esx_discojob:stopCraft7', function()
	local _source = source
	PlayersCrafting7[_source] = false
end)
----------------- Craft coca ----------------
local function Craft8(source)

	SetTimeout(4000, function()

		if PlayersCrafting8[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local CaroToolQuantity  = xPlayer.getInventoryItem('feuilledecoca').count
            if CaroToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de Feuille de Coca')					
			else
                xPlayer.removeInventoryItem('feuilledecoca', 2)
                xPlayer.addInventoryItem('coca', 1)
					
				Craft8(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft8')
AddEventHandler('esx_discojob:startCraft8', function()
	local _source = source
	PlayersCrafting8[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Coca~s~...')
	Craft8(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft8')
AddEventHandler('esx_discojob:stopCraft8', function()
	local _source = source
	PlayersCrafting8[_source] = false
end)
----------------- Craft icetea ----------------
local function Craft9(source)

	SetTimeout(4000, function()

		if PlayersCrafting9[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local CaroToolQuantity  = xPlayer.getInventoryItem('thefroid').count
            if CaroToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de Thé Froid')					
			else
                xPlayer.removeInventoryItem('thefroid', 2)
                xPlayer.addInventoryItem('icetea', 1)
					
				Craft9(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft9')
AddEventHandler('esx_discojob:startCraft9', function()
	local _source = source
	PlayersCrafting9[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Ice-Tea~s~...')
	Craft9(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft9')
AddEventHandler('esx_discojob:stopCraft9', function()
	local _source = source
	PlayersCrafting9[_source] = false
end)
----------------- Craft orangina ----------------
local function Craft10(source)

	SetTimeout(4000, function()

		if PlayersCrafting10[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local CaroToolQuantity  = xPlayer.getInventoryItem('orange').count
            if CaroToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de Orange')					
			else
                xPlayer.removeInventoryItem('orange', 2)
                xPlayer.addInventoryItem('orangina', 1)
					
				Craft10(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft10')
AddEventHandler('esx_discojob:startCraft10', function()
	local _source = source
	PlayersCrafting10[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Orangina~s~...')
	Craft10(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft10')
AddEventHandler('esx_discojob:stopCraft10', function()
	local _source = source
	PlayersCrafting10[_source] = false
end)

----------------- Craft diabolo ----------------
local function Craft11(source)

	SetTimeout(4000, function()

		if PlayersCrafting11[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local CaroToolQuantity  = xPlayer.getInventoryItem('sirop').count
            if CaroToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de Sirop')					
			else
                xPlayer.removeInventoryItem('sirop', 2)
                xPlayer.addInventoryItem('diabolo', 1)
					
				Craft11(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft11')
AddEventHandler('esx_discojob:startCraft11', function()
	local _source = source
	PlayersCrafting11[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Diabolo~s~...')
	Craft11(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft11')
AddEventHandler('esx_discojob:stopCraft11', function()
	local _source = source
	PlayersCrafting11[_source] = false
end)
----------------- Craft chocolatchaud ----------------
local function Craft12(source)

	SetTimeout(4000, function()

		if PlayersCrafting12[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local CaroToolQuantity  = xPlayer.getInventoryItem('cacao').count
            if CaroToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de Cacao')					
			else
                xPlayer.removeInventoryItem('cacao', 2)
                xPlayer.addInventoryItem('chocolatchaud', 1)
					
				Craft12(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft12')
AddEventHandler('esx_discojob:startCraft12', function()
	local _source = source
	PlayersCrafting12[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Chocolat Chaud~s~...')
	Craft12(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft12')
AddEventHandler('esx_discojob:stopCraft12', function()
	local _source = source
	PlayersCrafting12[_source] = false
end)
----------------- Craft perrier ----------------
local function Craft13(source)

	SetTimeout(4000, function()

		if PlayersCrafting13[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local CaroToolQuantity  = xPlayer.getInventoryItem('eaugazifie').count
            if CaroToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de Eau Gazifiée')					
			else
                xPlayer.removeInventoryItem('eaugazifie', 2)
                xPlayer.addInventoryItem('perrier', 1)
					
				Craft13(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft13')
AddEventHandler('esx_discojob:startCraft13', function()
	local _source = source
	PlayersCrafting13[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Perrier~s~...')
	Craft13(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft13')
AddEventHandler('esx_discojob:stopCraft13', function()
	local _source = source
	PlayersCrafting13[_source] = false
end)
----------------- Craft schweppes ----------------
local function Craft14(source)

	SetTimeout(4000, function()

		if PlayersCrafting14[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local CaroToolQuantity  = xPlayer.getInventoryItem('agrume').count
            if CaroToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de Agrume')					
			else
                xPlayer.removeInventoryItem('agrume', 2)
                xPlayer.addInventoryItem('schweppes', 1)
					
				Craft14(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft14')
AddEventHandler('esx_discojob:startCraft14', function()
	local _source = source
	PlayersCrafting14[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Schweppes~s~...')
	Craft14(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft14')
AddEventHandler('esx_discojob:stopCraft14', function()
	local _source = source
	PlayersCrafting14[_source] = false
end)
----------------- Craft cafe ----------------
local function Craft15(source)

	SetTimeout(4000, function()

		if PlayersCrafting15[source] == true then

			local xPlayer  = ESX.GetPlayerFromId(source)
			local CaroToolQuantity  = xPlayer.getInventoryItem('cafeine').count
            if CaroToolQuantity <= 0 then
				TriggerClientEvent('esx:showNotification', source, 'Vous n\'avez ~r~pas assez~s~ de Caféine')					
			else
                xPlayer.removeInventoryItem('cafeine', 2)
                xPlayer.addInventoryItem('coffee', 1)
					
				Craft15(source)
			end
		end
	end)
end

RegisterServerEvent('esx_discojob:startCraft15')
AddEventHandler('esx_discojob:startCraft15', function()
	local _source = source
	PlayersCrafting15[_source] = true
	TriggerClientEvent('esx:showNotification', _source, 'Preparation de ~b~Café~s~...')
	Craft15(_source)
end)

RegisterServerEvent('esx_discojob:stopCraft15')
AddEventHandler('esx_discojob:stopCraft15', function()
	local _source = source
	PlayersCrafting15[_source] = false
end)

-----------------------------------
---- BOIR MANGER ALCOOL OU NON ----
-----------------------------------

-- Register Usable Item hamburger
ESX.RegisterUsableItem('hamburger', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hamburger', 1)

TriggerClientEvent('esx_disco:eathamburger', _source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hamburger', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 800000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, ('Vous avez mangé 1x ~y~Hamburger'))

end)

-- Register Usable Item coca
ESX.RegisterUsableItem('coca', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('coca', 1)

TriggerClientEvent('esx_disco:drinkcoca', _source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('coca', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 800000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu 1x ~g~Coca Cola~s~')

end)

-- Register Usable Item icetea
ESX.RegisterUsableItem('icetea', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('icetea', 1)

TriggerClientEvent('esx_disco:drinkicetea', _source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('icetea', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 800000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu 1x ~g~Icetea~s~')

end)

-- Register Usable Item orangina
ESX.RegisterUsableItem('orangina', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('orangina', 1)

TriggerClientEvent('esx_disco:drinkorangina', _source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('orangina', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 800000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu 1x ~g~Orangina~s~')

end)

-- Register Usable Item diabolo
ESX.RegisterUsableItem('diabolo', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('diabolo', 1)

TriggerClientEvent('esx_disco:drinkdiabolo', _source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('diabolo', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 800000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu 1x ~g~Diabolo~s~')

end)

-- Register Usable Item chocolatchaud
ESX.RegisterUsableItem('chocolatchaud', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('chocolatchaud', 1)

TriggerClientEvent('esx_disco:drinkchocolatchaud', _source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('chocolatchaud', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 800000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu 1x ~g~Chocolat Chaud~s~')

end)

-- Register Usable Item perrier
ESX.RegisterUsableItem('perrier', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('perrier', 1)

TriggerClientEvent('esx_disco:drinkperrier', _source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('perrier', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 800000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu 1x ~g~Perrier~s~')

end)

-- Register Usable Item schweppes
ESX.RegisterUsableItem('schweppes', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('schweppes', 1)

TriggerClientEvent('esx_disco:drinkschweppes', _source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('schweppes', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 800000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu 1x ~g~Schweppes~s~')

end)

-- Register Usable Item cafe
ESX.RegisterUsableItem('coffee', function(source)

	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('coffee', 1)

TriggerClientEvent('esx_disco:drinkcoffee', _source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('coffee', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 800000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu 1x ~g~Café~s~')

end)

ESX.RegisterUsableItem('vodka', function(source)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodka', 1)

	TriggerClientEvent('esx_disco:drinkvodka', _source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodka', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu 1x ~g~Vodka~s~')

end)

ESX.RegisterUsableItem('beer', function(source)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('beer', 1)

	TriggerClientEvent('esx_disco:drinkbeer', _source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('beer', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu 1x ~g~Bière~s~')

end)

ESX.RegisterUsableItem('champagne', function(source)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('champagne', 1)

	TriggerClientEvent('esx_disco:drinkchampagne', _source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('champagne', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu 1x ~g~Champagne~s~')

end)

ESX.RegisterUsableItem('mojito', function(source)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mojito', 1)

	TriggerClientEvent('esx_disco:drinkmojito', _source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mojito', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu 1x ~g~Mojito~s~')

end)

ESX.RegisterUsableItem('whisky', function(source)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('whisky', 1)

	TriggerClientEvent('esx_disco:drinkwhisky', _source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('whisky', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu 1x ~g~Whisky~s~')

end)

ESX.RegisterUsableItem('cocktail', function(source)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cocktail', 1)

	TriggerClientEvent('esx_disco:drinkcocktail', _source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('cocktail', 1)

	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_optionalneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, 'Vous avez bu 1x ~g~Cocktail~s~')

end)
----------------------------------
---- Ajout Gestion Stock Boss ----
----------------------------------

RegisterServerEvent('esx_discojob:getStockItem')
AddEventHandler('esx_discojob:getStockItem', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_disco', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= count then
			inventory.removeItem(itemName, count)
			xPlayer.addInventoryItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez retiré x' .. count .. ' ' .. item.label)

	end)

end)

ESX.RegisterServerCallback('esx_discojob:getStockItems', function(source, cb)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_disco', function(inventory)
		cb(inventory.items)
	end)

end)



-------------
-- AJOUT 2 --
-------------

RegisterServerEvent('esx_discojob:putStockItems')
AddEventHandler('esx_discojob:putStockItems', function(itemName, count)

	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_disco', function(inventory)

		local item = inventory.getItem(itemName)

		if item.count >= 0 then
			xPlayer.removeInventoryItem(itemName, count)
			inventory.addItem(itemName, count)
		else
			TriggerClientEvent('esx:showNotification', xPlayer.source, 'Quantité invalide')
		end

		TriggerClientEvent('esx:showNotification', xPlayer.source, 'Vous avez ajouté x' .. count .. ' ' .. item.label)

	end)

end)

ESX.RegisterServerCallback('esx_discojob:getPlayerInventory', function(source, cb)

	local xPlayer    = ESX.GetPlayerFromId(source)
	local items      = xPlayer.inventory

	cb({
		items      = items
	})

end)