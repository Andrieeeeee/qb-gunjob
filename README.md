# qb-gunjob
# Edited version

# Dependency

QBCore Framework - https://github.com/qbcore-framework/qb-core (latest)

PolyZone - https://github.com/mkafrin/PolyZone

qb-target - https://github.com/BerkieBb/qb-target (Only needed if not using draw text)

qb-input - https://github.com/qbcore-framework/qb-input

qb-menu - https://github.com/qbcore-framework/qb-menu

# Credits

ORIGINAL - https://github.com/CptNoHand/qb-gunjob


# add to qb-core/shared.lua
```
	
	['licensepistol'] 				 = {['name'] = 'licensepistol', 			 	['label'] = 'License  pistol', 			['weight'] = 0, 		['type'] = 'item', 		['image'] = 'stickynote.png', 			['unique'] = true, 		['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = "thats my gun"},
```


```

QBShared.Jobs = {
    	["gunshop"] = {
		label = "Gun Shop",
		defaultDuty = true,
		grades = {
			['1'] = {
				name = "trainee",
				payment = 150
			},
			['2'] = {
				name = "Manager",
				payment = 200
			},
			['3'] = {
				name = "Owner",
				isboss = true,
				payment = 400
			},
		},
	},
```



   # qb-bossmenu/config.lua
    ```    ['gunshop'] = vector3(840.02, -1032.71, 28.19) ```

# qb-target/config.lu ==> config.BoxZones
```
		    ["boxzone9"] = {
        name = "gunshop1",
        coords = vector3(841.06, -1034.82, 28.19),
        length = 0.2,
        width = 0.3,
        heading = 0,
        debugPoly = true,
        minZ=28.19,
        maxZ=28.59,
        options = {
            {
              type = "client",
              event = "shopgun:menu",
              icon = "fas fa-cash-register",
              label = "Gun Register",
              job = "gunshop"
            },
        },
        distance = 2.5
    },
    		    ["boxzone10"] = {
        name = "gunshop2",
        coords = vector3(842.35, -1034.67, 28.19),
        length = 0.6,
        width = 1,
        heading = 0,
        debugPoly = true,
        minZ=28.14,
        maxZ=28.29,
        options = {
            {
              type = "client",
              event = "shopgun:OpenInventory",
              icon = "fas fa-box-open",
              label = "shop table",
            },
        },
        distance = 2.5
    },
    		    ["boxzone11"] = {
        name = "gunshop3",
        coords = vector3(839.49, -1031.62, 28.19),
        length = 0.2,
        width = 0.6,
        heading = 0,
        debugPoly = true,
        minZ=27.94,
        maxZ=28.19,
        options = {
            {
              type = "client",
              event = "shopgun:stash",
              icon = "fas fa-box",
              label = "shop stash",
              job = "gunshop"
            },
        },
        distance = 2.5
    },
        		    ["boxzone12"] = {
        name = "gunshop4",
        coords = vector3(843.97, -1035.09, 28.19),
        length = 0.2,
        width = 1,
        heading = 0,
        debugPoly = true,
        minZ=27.79,
        maxZ=28.19,
        options = {
            {
              type = "client",
              event = "Shopgun:Trash",
              icon = "fas fa-trash",
              label = "gun bin",
              job = "gunshop"
            },
        },
        distance = 2.5
    },
    ```
