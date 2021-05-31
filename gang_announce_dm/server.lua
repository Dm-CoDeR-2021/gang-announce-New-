DM = nil
TriggerEvent('esx:getSharedObject', function(object) DM = object end)

RegisterCommand('gannounce', function(source, args, user)
    local xp = DM.GetPlayerFromId(source)
    local table = table.concat(args, " ")
    if xp.gang.label == 'gang' then
        if xp.gang.grade >= Config.perm_to_announce then
            TriggerEvent('send:message:announce:dm:gang:announce', table)
        else
            TriggerClientEvent('chatMessage', source, '[GANNOUNCE]', {255, 0, 0}, '^0Rank Shoma Baraye In Command Monaseb Nist !')
        end
    else
        TriggerClientEvent('chatMessage', source, '[Error]', {255, 0, 0}, '^0Shoma Ozv Hich Grouh Khalafi Nistid !')
    end
end)

RegisterNetEvent('send:message:announce:dm:gang:announce')
AddEventHandler('send:message:announce:dm:gang:announce', function(msg)
    local players = DM.GetPlayers()
    for i=1, #players, 1 do
        local xps = DM.GetPlayerFromId(players[i])
        if xps.gang.name == xps.gang.name then
            TriggerClientEvent('chatMessage', players[i], '[GangAnnounce]', {255, 0, 0}, msg)
        end
    end
end)