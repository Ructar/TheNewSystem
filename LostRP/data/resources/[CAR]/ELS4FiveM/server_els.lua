-- ---------------------------------------------------
-- ELS SYSTEM FOR FIVEM
-- ---------------------------------------------------
-- Last revision: MAR 29 2017
-- ---------------------------------------------------
-- Free for use and distribution.
-- ---------------------------------------------------
-- Server file.  Visit FiveM forums for
-- general script installation info.
-- ---------------------------------------------------
-- ]]
RegisterServerEvent("lvc_TogIndicState_s")
AddEventHandler("lvc_TogIndicState_s", function(newstate)
		local netID = source
                TriggerClientEvent('lvc_TogIndicState_c',-1,netID, newstate)
end)



RegisterServerEvent("lvc_TogDfltSrnMuted_s")
AddEventHandler("lvc_TogDfltSrnMuted_s", function(netID,toogle)
		local netID = source
                TriggerClientEvent('lvc_TogDfltSrnMuted_c',-1,netID, toogle)
end)



RegisterServerEvent("lvc_SetLxSirenState_s")
AddEventHandler("lvc_SetLxSirenState_s", function(netID,newstate)
		local netID = source
                TriggerClientEvent('lvc_SetLxSirenState_c',-1,netID, newstate)
end)


RegisterServerEvent("lvc_TogPwrcallState_s")
AddEventHandler("lvc_TogPwrcallState_s", function(netID,toogle)
		local netID = source
                TriggerClientEvent('lvc_TogPwrcallState_c',-1,netID, toogle)
end)


RegisterServerEvent("lvc_SetAirManuState_s")
AddEventHandler("lvc_SetAirManuState_s", function(netID,newstate)
		local netID = source
                TriggerClientEvent('lvc_SetAirManuState_c',-1,netID, newstate)
end)
print("Luxart Siren Script For FiveReborn")