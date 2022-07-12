local QBCore = exports['qb-core']:GetCoreObject()

isLoggedIn = true
PlayerJob = {}

local onDuty = false

-- target

Citizen.CreateThread(function()
	exports['qb-target']:AddBoxZone("GunShopDuty", vector3(844.53, -1036.41, 28.22), 1, 0.6, {
		name = "GunSHhopDuty",
		heading = 90,
		debugPoly = false,
		 minZ=24.82,
		maxZ=28.82,
	}, {
		options = {
		    {  
			event = "qb-gunjob:DutyB",
			icon = "far fa-clipboard",
			label = "Clock On/Off",
			job = "gunshop",
		    },
		},
		distance = 1.5
	})
	
	  exports['qb-target']:AddBoxZone("gunjobstash", vector3(841.03, -1036.72, 28.2), 1, 3, {
            name="gunjobstash",
            heading=34,
            debugPoly=false,
            minZ=24.6,
            maxZ=28.6,
        }, {
                options = {
                    {
                        event = "qb-gunjob:Storage",
                        icon = "fas fa-box",
                        label = "Storage",
                        job = "gunshop",
                    },
                },
                distance = 1.5
            })

   exports['qb-target']:AddBoxZone("GunShop_register_1", vector3(845.49, -1030.88, 28.19), 0.6, 0.6, {
            name="GunShop_register_1",
            heading=0,
            debugPoly=false,
			minZ=24.59,
			maxZ=28.59,
                }, {
                        options = {
                            {
                                event = "qb-gunjob:bill",
                                parms = "4",
                                icon = "fas fa-credit-card",
                                label = "Charge Customer",
                                job = "gunshop",
                            },
                        },
                        distance = 1.5
            })

end)



--BILL
RegisterNetEvent("qb-gunjob:bill")
AddEventHandler("qb-gunjob:bill", function()
    local bill = exports['qb-input']:ShowInput({
        header = "Create Receipt",
		submitText = "Bill",
        inputs = {
            {
                text = "Server ID(#)",
				name = "citizenid", -- name of the input should be unique otherwise it might override
                type = "text", -- type of the input
                isRequired = true -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            },
            {
                text = "Bill Price ($)", -- text you want to be displayed as a place holder
                name = "billprice", -- name of the input should be unique otherwise it might override
                type = "number", -- type of the input - number will not allow non-number characters in the field so only accepts 0-9
                isRequired = false -- Optional [accepted values: true | false] but will submit the form if no value is inputted
            }
			
        }
    })
    if bill ~= nil then
        if bill.citizenid == nil or bill.billprice == nil then 
            return 
        end
        TriggerServerEvent("qb-gunjob:bill:player", bill.citizenid, bill.billprice)
    end
end)
