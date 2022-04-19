local display = false
local displayWeapon = false

-------------- Commands --------------
RegisterCommand('showid', function(source, args)
    local name = table.concat(args, " ")
    local playerCoords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent('AG_IDCARD:RecieveID', name, playerCoords)
end, false)

RegisterCommand('showccw', function(source, args)
    local name = table.concat(args, " ")
    local playerCoords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent('AG_IDCARD:RecieveCCW', name, playerCoords)
end, false)

RegisterCommand('hideccw', function()
    SetDisplayWeapon(false)
end, false)

RegisterCommand('hideid', function()
    SetDisplay(false)
end, false)

-------------- SHOW WEAPON CARD --------------
RegisterNetEvent('AG_WEAPONCARD:GiveNUICard')
AddEventHandler('AG_WEAPONCARD:GiveNUICard', function(name, coords)
    local playerCoords = GetEntityCoords(PlayerPedId())

    if #(GetEntityCoords(PlayerPedId()) - coords) <= 3.0 then
        --Wait
	    Wait(500)
	
	    --Set the display
	    SetDisplayWeapon(true)

	    --Send the info
	    SendNUIMessage({
		    type = "weapon-identification-card",
		    personName = name
	    })
    end
end)

-------------- SHOW ID CARD --------------
RegisterNetEvent('AG_IDCARD:GiveNUICard')
AddEventHandler('AG_IDCARD:GiveNUICard', function(name, coords)
    local playerCoords = GetEntityCoords(PlayerPedId())
    
    if #(GetEntityCoords(PlayerPedId()) - coords) <= 3.0 then
        --Wait
	    Wait(500)
	
	    --Set the display
	    SetDisplay(true)

	    --Send the info
	    SendNUIMessage({
		    type = "ped-identification-card",
		    personName = name
	    })
    end
end)

-------------- Set ID Card Display Bool --------------
function SetDisplay(bool)
    display = bool
    --SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
    })
end

-------------- Set Weapon Card Display Bool --------------
function SetDisplayWeapon(bool)
    displayWeapon = bool
    --SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "uiWeapon",
        status = bool,
    })
end

-------------- Help Text (ID CARD) --------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        if display then
            BeginTextCommandDisplayHelp("THREESTRINGS")
            AddTextComponentSubstringPlayerName("Do ~y~/hideid~w~ to hide the current ID card")
            EndTextCommandDisplayHelp(0, false, false, 0)
        end
	end
end)

-------------- Help Text (WEAPON CARD) --------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
        if displayWeapon then
            BeginTextCommandDisplayHelp("THREESTRINGS")
            AddTextComponentSubstringPlayerName("Do ~y~/hideccw~w~ to hide the current weapon permit card")
            EndTextCommandDisplayHelp(0, false, false, 0)
        end
	end
end)