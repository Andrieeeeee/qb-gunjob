
local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = false
local PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent("qb-gunjob:DutyB")
AddEventHandler("qb-gunjob:DutyB", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-gunjob:Storage")
AddEventHandler("qb-gunjob:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "gunstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "gunstorage", {
        maxweight = 400000,
        slots = 80,
    })
end)


CreateThread(function()
	blip = AddBlipForCoord( 843.76, -1023.91, 28.07 )
	SetBlipSprite(blip, 110)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 0.5)
	SetBlipColour(blip, 0)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Ammunation')
	EndTextCommandSetBlipName(blip)
end)


local SpatelObject = nil

RegisterNetEvent('shopgun:menu')
AddEventHandler('shopgun:menu', function ()
            local myMenu = {
                {
                    id = 1,
                    header = 'GunShop Menu',
                    txt = ''
                },
                {
                    id = 2,
                    header = '< Shop',
                    txt = 'to see Weapon shop',
                    params = {
                        event = 'ShopGuns:Sell'
                    }
                },
                {
                    id = 3,
                    header = '< License',
                    txt = 'to see license menu',
                    params = {
                        event = 's:takelinus',
                        iserver = true
                    }
                },
                {
                    id = 4,
                    header = '< close',
                    txt = '',
                    params = {
                        event = 'qb-menu:close',
                    }
                },
            }
            exports['qb-menu']:openMenu(myMenu)
end)

----------------------------------------------------
RegisterNetEvent('s:takelinus')
AddEventHandler('s:takelinus', function(data)
    

TriggerServerEvent('gunshop:server:linus')


end)


RegisterNetEvent('ShopGuns:Sell', function()
local authorizedItems = {
    label = "gun shop",
    slots = 7,
    items = {}
}
local index = 1
for _, armoryItem in pairs(Config.Items.items) do
            authorizedItems.items[index] = armoryItem
            authorizedItems.items[index].slot = index
            index = index + 1
end
TriggerServerEvent("inventory:server:OpenInventory", "shop", "gunshop", authorizedItems)
end)

RegisterNetEvent("shopgun:stash")
AddEventHandler("shopgun:stash", function()
    if isLoggedIn and QBCore ~= nil then
		if PlayerJob.name == Config.job then
			TriggerServerEvent("inventory:server:OpenInventory", "stash", "shopgunstash", {
				maxweight = 4000000,
				slots = 500,
			})
			TriggerEvent("inventory:client:SetCurrentStash", "shopgunstash")
		end
	end
end)

RegisterNetEvent('Shopgun:Trash', function ()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "shopguntrash", {
        maxweight = 4000000,
        slots = 300,
    })
    TriggerEvent("inventory:client:SetCurrentStash", "shopguntrash")
end)

RegisterNetEvent("shopgun:OpenInventory")
AddEventHandler("shopgun:OpenInventory", function()
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "shopguntray", {
		maxweight = 20000,
		slots = 5,
	})
	TriggerEvent("inventory:client:SetCurrentStash", "shopguntray")
end)

RegisterNetEvent('shop:cars', function()
    local myMenu = {
        {
            id = 1,
            header = 'car list',
            txt = ''
        },
        {
            id = 2,
            header = "< take",
            txt = "futo ",
            params = {
                event = "takeout:car",
                args = {
                    vehicle = "futo",
                }
            }
        },
        {
            id = 3,
            header = "< take",
            txt = "speedo",
            params = {
                event = "takeout:car",
                args = {
                    vehicle = "speedo",
                }
            }
        },
        {
            id = 4,
            header = "< store",
            txt = "store Vehicle",
            params = {
                event = "DeleteCar",
            }
        },
        {
            id = 5,
            header = '< close',
            txt = '',
            params = {
                event = 'qb-menu:close',
            }
        },
    }
    exports['qb-menu']:openMenu(myMenu)
    end)
    
    
    RegisterNetEvent('DeleteCar')
    AddEventHandler('DeleteCar', function()
        local car = GetVehiclePedIsIn(PlayerPedId(),true)
        DeleteVehicle(car)
        DeleteEntity(car)
        QBCore.Functions.Notify('you sotred vehicle' , 'success')
        TriggerEvent('animations:client:EmoteCommandStart', {"keyfob"})
    end)
    
    RegisterNetEvent('takeout:car')
    AddEventHandler('takeout:car', function(car, data)
        TriggerEvent('animations:client:EmoteCommandStart', {"notepad"})
        QBCore.Functions.Progressbar('SpawnCar', 'take out car...', 6000, false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
        }, {}, {}, function() -- Play When Done
            local vehicle = car.vehicle
            local coords = { ['x'] = 862.13, ['y'] = -1034.63, ['z'] = 29.96, ['h'] = 359.93 }
            QBCore.Functions.SpawnVehicle(car.vehicle, function(veh)
                SetVehicleNumberPlateText(veh, "rental"..tostring(math.random(1000, 9999)))
                SetEntityHeading(veh, coords.h)
                exports['LegacyFuel']:SetFuel(veh, 80.0)
                TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
                TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
                SetVehicleEngineOn(veh, true, true)
                plaquevehicule = GetVehicleNumberPlateText(veh)
            end, coords, true)
            QBCore.Functions.Notify('you got '.. vehicle .. ' car', 'success')
           TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            IsDrilling = false
        end, function() -- Play When Cancel
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        end)
    end)
    
    
