Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DELETE'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

Config = Config or {}

-- Config --
Config.job = "gunshop"

Config.AmmoLabels = {
    ["AMMO_PISTOL"] = "9x19mm parabellum bullet",
    ["AMMO_SMG"] = "9x19mm parabellum bullet",
    ["AMMO_RIFLE"] = "7.62x39mm bullet",
}

Config.Items = {
    label = "gun shop",
    slots = 20,
    items = {
        [1] = {
            name = "weapon_pistol",
            price = 5000,
            amount = 10,
            info = {},
            type = "weapon",
            slot = 1,
        },
        [2] = {
            name = "pistol_ammo",
            price = 50,
            amount = 1000,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "smg_ammo",
            price = 250,
            amount = 100,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "weapon_knife",
            price = 250,
            amount = 100,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "weapon_flashlight",
            price = 3000,
            amount = 15,
            info = {},
            type = "weapon",
            slot = 5,
        },
        [6] = {
            name = "weapon_hatchet",
            price = 3000,
            amount = 20,
            info = {},
            type = "weapon",
            slot = 6,
        },
        [7] = {
            name = "weapon_knuckle",
            price = 3000,
            amount = 15,
            info = {},
            type = "weapon",
            slot = 7,
        },
        [8] = {
            name = "weapon_appistol",
            price = 3000,
            amount = 15,
            info = {},
            type = "weapon",
            slot = 8,
        },
        [9] = {
            name = "weapon_bat",
            price = 3000,
            amount = 15,
            info = {},
            type = "weapon",
            slot = 9,
        },
        [10] = {
            name = "weapon_machete",
            price = 3000,
            amount = 15,
            info = {},
            type = "weapon",
            slot = 10,
        },
        [11] = {
            name = "weapon_microsmg",
            price = 10000,
            amount = 15,
            info = {},
            type = "weapon",
            slot = 11,
        },
        [12] = {
            name = "weapon_combatpdw",
            price = 30000,
            amount = 15,
            info = {},
            type = "weapon",
            slot = 12,
        },
    }
}
