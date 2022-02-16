ESX = nil

TriggerEvent(Config.ESX, function(obj) ESX = obj end)

RegisterNetEvent("weaponsPack")
AddEventHandler("weaponsPack", function(Price)
        local xPlayer = ESX.GetPlayerFromId(source)
        local pMoney = xPlayer.getMoney()
        if pMoney >= Price then
            xPlayer.removeMoney(Price)
            xPlayer.addWeapon("weapon_dagger", 300)
        else
            TriggerClientEvent("Froot:Notifications", source, "Vous n'avez pas assez d'argent vous avez besoin de "..Price.."$")
        end
end)

RegisterNetEvent("itemsPack")
AddEventHandler("itemsPack", function(Price)
        local xPlayer = ESX.GetPlayerFromId(source)
        local pMoney = xPlayer.getMoney()
        print(pMoney)
        if pMoney >= Price then
            xPlayer.removeMoney(Price)
            xPlayer.addInventoryItem("bread", 1)
        else
            TriggerClientEvent("Froot:Notifications", source, "Vous n'avez pas assez d'argent vous avez besoin de "..Price.."$")
        end
end)

RegisterCommand("giveMoney", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = args[1]
    xPlayer.addMoney(money)
end, false)

RegisterCommand("removeMoney", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = args[1]
    xPlayer.removeMoney(money)
end, false)