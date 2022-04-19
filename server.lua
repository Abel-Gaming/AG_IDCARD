RegisterServerEvent('AG_IDCARD:RecieveID')
AddEventHandler('AG_IDCARD:RecieveID', function(name, coords)
    TriggerClientEvent('AG_IDCARD:GiveNUICard', -1, name, coords)
end)

RegisterServerEvent('AG_IDCARD:RecieveCCW')
AddEventHandler('AG_IDCARD:RecieveCCW', function(name, coords)
    TriggerClientEvent('AG_WEAPONCARD:GiveNUICard', -1, name, coords)
end)