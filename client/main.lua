Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()

    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end

	while ESX == nil or ESX.GetPlayerData().org == nil do
		Citizen.Wait(10)
    end

	PlayerData = ESX.GetPlayerData()
	grade = PlayerData.org.grade_name
	print(grade)
end)

RegisterNetEvent('esx:setOrg')
AddEventHandler('esx:setOrg', function(org)
	PlayerData.org = org
end)

function notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, true)
end

------------------------------------------------------------------------------------------------------------------------------------------


local mainMenu = RageUI.CreateMenu("Magasin d\'armes", "Gang - Choisissez vos armes")
local armesfeuMenu = RageUI.CreateSubMenu(mainMenu)
local armesblanchesMenu = RageUI.CreateSubMenu(mainMenu)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if RageUI.Visible(mainMenu) then
            RageUI.DrawContent({ header = true, instructionalButton = true }, function()
                RageUI.Button("Armes à feu" , nil, {
                    LeftBadge = nil,
                    RightBadge = nil,
                    RightLabel = " →"
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                       -- My action when I press enter 
                    end
                    if Hovered then
                       -- My action the button is hovered by the mouse
                    end
                    if Active then
                       -- My action the button is hightlighted
                    end
    
                end,armesfeuMenu)

                RageUI.Button("Armes blanches & Accessoires" , nil, {
                    LeftBadge = nil,
                    RightBadge = nil,
                    RightLabel = " →"
                }, true, function(Hovered, Active, Selected)
                    if Selected then
                       -- My action when I press enter 
                    end
                    if Hovered then
                       -- My action the button is hovered by the mouse
                    end
                    if Active then
                       -- My action the button is hightlighted
                    end
    
                end,armesblanchesMenu)
            end, function()
                ---Panels
            end)
		end
		
		if RageUI.Visible(armesblanchesMenu) then
            -- header false will show a menu without header
			RageUI.DrawContent({ header = false, instructionalButton = true }, function()
				for k, v in pairs(Config.ArmesBlanches) do
                    RageUI.Button(v.Label , nil, {
                        LeftBadge = nil,
                        RightBadge = nil,
                        RightLabel = v.armes_prix..' $'
                    }, true, function(Hovered, Active, Selected)
                        if Selected then
							local armes_prix = v.armes_prix
							local armes_hash = v.Hash
							local armes_label = v.Label
							TriggerServerEvent("hugo_weapongang:armes_gang_w", armes_prix, armes_hash, armes_label)
                        end
                        if Hovered then
                            -- My action the button is hovered by the mouse
                        end
                        if Active then
                            -- My action the button is hightlighted
                        end

				    end)
			    end
            end, function()
                ---Panels
            end)
        end

        if RageUI.Visible(armesfeuMenu) then
            -- header false will show a menu without header
			RageUI.DrawContent({ header = false, instructionalButton = true }, function()
				for k, v in pairs(Config.ArmesFeuMembres) do
                    RageUI.Button(v.Label , nil, {
                        LeftBadge = nil,
                        RightBadge = nil,
                        RightLabel = v.armes_prix.." $"
                    }, true, function(Hovered, Active, Selected)
                        if Selected then
							local armes_label = v.Label
							local armes_hash = v.Hash
							local armes_prix = v.armes_prix
									
							TriggerServerEvent("hugo_weapongang:armes_gang", armes_label, armes_hash, armes_prix)
							
                        end
                        if Hovered then
                            -- My action the button is hovered by the mouse
                        end
                        if Active then
                            -- My action the button is hightlighted
                        end

				    end)
			    end
					for k, v in pairs(Config.ArmesFeuBoss) do
						if PlayerData.org.grade_name == "boss" then
							RageUI.Button(v.Label , nil, {
								LeftBadge = nil,
								RightBadge = nil,
								RightLabel = v.armes_prix.." $"
							}, true, function(Hovered, Active, Selected)
								if Selected then
									local armes_label = v.Label
									local armes_hash = v.Hash
									local armes_prix = v.armes_prix
												
									TriggerServerEvent("hugo_weapongang:armes_gang", armes_label, armes_hash, armes_prix)
										
								end
								if Hovered then
										-- My action the button is hovered by the mouse
								end
								if Active then
										-- My action the button is hightlighted
								end

							end)
						end
					end
            end, function()
                ---Panels
            end)
        end

        
    end
end)

-- Citizen.CreateThread(function()
-- 	for k, wea in pairs(Config.Pos) do
-- 		local blip = AddBlipForCoord(wea.x, wea.y, wea.z)
		
-- 		SetBlipSprite(blip, 110)
-- 		SetBlipScale (blip, 0.8)
-- 		SetBlipColour(blip, 49)
-- 		SetBlipAsShortRange(blip, true)

-- 		BeginTextCommandSetBlipName('STRING')
-- 		AddTextComponentSubstringPlayerName('Magasin d\'armes')
-- 		EndTextCommandSetBlipName(blip)
-- 	end
-- end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local playerCoords = GetEntityCoords(PlayerPedId())

		for k, v in pairs(Config.Pos) do
			local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)
            
			if distance <= 2 and PlayerData.org.name == Config.Nom_Organisation then
				ESX.ShowHelpNotification("~INPUT_TALK~ pour entrer dans le ~b~Magasin d\'armes de l'organisation~s~")
				
				if IsControlJustPressed(1, 51) then
					RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
				end
			end
		end
	end
end)
