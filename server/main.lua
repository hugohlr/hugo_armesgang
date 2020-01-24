ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterNetEvent("hugo_weapongang:armes_gang_w")
AddEventHandler("hugo_weapongang:armes_gang_w", function(armes_prix, armes_hash, armes_label)

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.hasWeapon(armes_hash) then
		TriggerClientEvent('esx:showNotification', source, "Vous avez déjà cette arme : "..armes_label)
	else
		if xPlayer.getAccount('bank').money >= armes_prix then
			xPlayer.removeAccountMoney('bank', armes_prix)
			xPlayer.addWeapon(armes_hash, 1)
			TriggerClientEvent('esx:showNotification', source, "~b~Tu as acheté: ~r~x1 "..armes_label.."\n~g~→→ Ajoutée directement dans ton inventaire")
		else
			TriggerClientEvent('esx:showNotification', source, "Tu n'as pas assez d'argent")
		end
	end
	
end)

RegisterNetEvent("hugo_weapongang:armes_gang")
AddEventHandler("hugo_weapongang:armes_gang", function(armes_label, armes_hash, armes_prix)

    local xPlayer = ESX.GetPlayerFromId(source)
    
	if xPlayer.hasWeapon(armes_hash) then
		TriggerClientEvent('esx:showNotification', source, "Vous avez déjà cette arme : "..armes_label)
	else
		if xPlayer.getAccount('bank').money >= armes_prix then
			xPlayer.removeAccountMoney('bank', armes_prix)
			xPlayer.addWeapon(armes_hash, 250)
			TriggerClientEvent('esx:showNotification', source, "~b~Tu as acheté: ~r~x1 "..armes_label.."\n~g~→→ Ajoutée directement dans ton inventaire")
		else
			TriggerClientEvent('esx:showNotification', source, "Tu n'as pas assez d'argent ")
		end
    end
	
end)
