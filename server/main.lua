local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('gunshop:server:linus')
AddEventHandler('gunshop:server:linus', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local amount = 1
	if Player.Functions.AddItem("licensepistol", amount) then
	TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["licensepistol"], 'add')
	TriggerClientEvent('QBCore:Notify', src, 'You got a ' .. amount ..' pistol license', 'success')    
	end
end)

RegisterServerEvent("qb-gunjob:bill:player")
AddEventHandler("qb-gunjob:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'gunshop' then
            if billed ~= nil then
                if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 0 then
                        MySQL.Async.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender) VALUES (:citizenid, :amount, :society, :sender)', {
                            ['citizenid'] = billed.PlayerData.citizenid,
                            ['amount'] = amount,
                            ['society'] = biller.PlayerData.job.name,
                            ['sender'] = biller.PlayerData.charinfo.firstname
                        })
                        TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                        TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                        TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                    end
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)
