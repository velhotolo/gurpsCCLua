math = {}
math.__index = math
-- Going to use OOP
-- Setting up attributes
function math:new()
local obj = setmetatable({}, math)
local obj.startingPoints = startingPoints or 100
local obj.spentPoints = startingPoints - unspentPoints
local obj.unspentPoints = startingPoints - spentPoints
local obj.disadvantageLimit = startingPoints/2
local obj.st = 10
local obj.dx = 10
local obj.iq = 10
local obj.ht = 10
local obj.finalValue = 0
local obj.basicSpeed = 0
local obj.basicMove = 0
local obj.will = iq
local obj.per = iq
local obj.hp = st
local obj.fp = ht
local obj.sizeModifier = 1
local obj.thurst = {}
local obj.swing = {}
return obj
end

-- Main attributes calculation. Still need to add "No fine manipulators" discount on ST (40%)
function math:basicAttributes()
self.st = 10
self.dx = 10
self.iq = 10
self.ht = 10
self.finalValue = 0
if self.finalValue > 10 and self.st or self.ht then
local stValue = (self.finalValue - 10)*10
if self.sizeModifier > 1 then
stValue = stValue - (stValue*self.sizeModifier)/100
self.spentPoints = stValue
elseif self.finalValue > 10 and self.iq or self.dx then
self.spentPoints = (self.finalValue - 10)*20
end
end

-- Secondary attributes
function math:secondaryAttributes()
self.basicSpeed = (self.dx + self.ht)/4
self.basicMove = math.floor(self.dx + self.ht)/4
if self.finalValue > 10 and self.will or self.per then
self.spentPoints = (self.finalValue - self.iq)*5
elseif self.finalValue > 5 and self.basicMove then
self.spentPoints = (self.finalValue - self.basicMove)*5
elseif self.finalValue > 5 and self.basicSpeed then
self.spentPoints = ((self.finalValue-5)/0.25 - self.basicSpeed)*5
end
end


-- Damage tables.
self.thurst = {
    [1] = "1d-6", [2] = "1d-6", [3] = "1d-5", [4] = "1d-5", [5] = "1d-4",
    [6] = "1d-4", [7] = "1d-3", [8] = "1d-3", [9] = "1d-2", [10] = "1d-2",
    [11] = "1d-1", [12] = "1d-1", [13] = "1d", [14] = "1d", [15] = "1d+1",
    [16] = "1d+1", [17] = "1d+2", [18] = "1d+2", [19] = "2d-1", [20] = "2d-1",
    [21] = "2d", [22] = "2d", [23] = "2d+1", [24] = "2d+1", [25] = "2d+2",
    [26] = "2d+2", [27] = "3d-1", [28] = "3d-1", [29] = "3d", [30] = "3d",
    [31] = "3d+1", [32] = "3d+1", [33] = "3d+2", [34] = "3d+2", [35] = "4d-1",
    [36] = "4d-1", [37] = "4d", [38] = "4d", [39] = "4d+1", [40] = "4d+1",
    [41] = "4d+2", [42] = "4d+2", [43] = "5d-1", [44] = "5d-1", [45] = "5d",
    [46] = "5d+1", [47] = "5d+1", [48] = "5d+1", [49] = "5d+1", [50] = "5d+2",
    [51] = "6d-1", [52] = "6d-1", [53] = "6d-1", [54] = "6d-1", [55] = "6d",
    [56] = "6d+1", [57] = "6d+1", [58] = "6d+2", [59] = "6d+2", [60] = "7d-1",
    [61] = "7d", [62] = "7d", [63] = "7d", [64] = "7d", [65] = "7d+1",
    [66] = "7d+2", [67] = "7d+2", [68] = "8d-1", [69] = "8d-1", [70] = "8d",
    [71] = "8d", [72] = "8d", [73] = "8d+1", [74] = "8d+1", [75] = "8d+2",
    [76] = "8d+2", [77] = "8d+2", [78] = "9d-1", [79] = "9d-1", [80] = "9d",
    [81] = "9d", [82] = "9d", [83] = "9d+1", [84] = "9d+1", [85] = "9d+2",
    [86] = "9d+2", [87] = "9d+2", [88] = "10d-1", [89] = "10d-1", [90] = "10d",
    [91] = "10d", [92] = "10d", [93] = "10d+1", [94] = "10d+1", [95] = "10d+2",
    [96] = "10d+2", [97] = "10d+2", [98] = "11d-1", [99] = "11d-1", [100] = "11d"
}

self.swing = {
    [1] = "1d-5", [2] = "1d-5", [3] = "1d-4", [4] = "1d-4", [5] = "1d-3",
    [6] = "1d-3", [7] = "1d-2", [8] = "1d-2", [9] = "1d-1", [10] = "1d",
    [11] = "1d+1", [12] = "1d+2", [13] = "2d-1", [14] = "2d", [15] = "2d+1",
    [16] = "2d+2", [17] = "3d-1", [18] = "3d", [19] = "3d+1", [20] = "3d+2",
    [21] = "4d-1", [22] = "4d", [23] = "4d+1", [24] = "4d+2", [25] = "5d-1",
    [26] = "5d", [27] = "5d+1", [28] = "5d+2", [29] = "6d-1", [30] = "6d",
    [31] = "6d+1", [32] = "6d+2", [33] = "7d-1", [34] = "7d", [35] = "7d+1",
    [36] = "7d+2", [37] = "8d-1", [38] = "8d", [39] = "8d+1", [40] = "8d+2",
    [41] = "9d-1", [42] = "9d-1", [43] = "9d-1", [44] = "9d-1", [45] = "9d",
    [46] = "9d+1", [47] = "9d+1", [48] = "9d+1", [49] = "9d+1", [50] = "9d+2",
    [51] = "10d-1", [52] = "10d-1", [53] = "10d-1", [54] = "10d-1", [55] = "10d",
    [56] = "10d+1", [57] = "10d+1", [58] = "10d+1", [59] = "10d+1", [60] = "10d+2",
    [61] = "11d-1", [62] = "11d-1", [63] = "11d-1", [64] = "11d-1", [65] = "11d",
    [66] = "11d+1", [67] = "11d+1", [68] = "11d+1", [69] = "11d+1", [70] = "11d+2",
    [71] = "12d-1", [72] = "12d-1", [73] = "12d-1", [74] = "12d-1", [75] = "12d",
    [76] = "12d+1", [77] = "12d+1", [78] = "12d+1", [79] = "12d+1", [80] = "12d+2",
    [81] = "13d-1", [82] = "13d-1", [83] = "13d-1", [84] = "13d-1", [85] = "13d",
    [86] = "13d+1", [87] = "13d+1", [88] = "13d+1", [89] = "13d+1", [90] = "13d+2",
    [91] = "14d-1", [92] = "14d-1", [93] = "14d-1", [94] = "14d-1", [95] = "14d",
    [96] = "14d+1", [97] = "14d+1", [98] = "14d+1", [99] = "14d+1", [100] = "14d+2"
}

-- Function to calculate Basic Lift (BL)
function math:calculateBasicLift(st)
    local bl = (self.st * self.st) / 5
    -- GURPS 4e: If BL is 10 or more, round to the nearest whole number
    if bl >= 10 then
        bl = math.floor(bl + 0.5)
    end
    return bl
end

-- Function to return the complete Encumbrance table
function math:getEncumbrance(st)
    local bl = self.calculateBasicLift(st)
    -- Encumbrance Table (level name, max weight, move multiplier, dodge penalty)
    return {
        [0] = { level = "None",        max_weight = bl * 1, move_mult = 1.0, dodge_pen = 0 },
        [1] = { level = "Light",       max_weight = bl * 2, move_mult = 0.8, dodge_pen = -1 },
        [2] = { level = "Medium",      max_weight = bl * 3, move_mult = 0.6, dodge_pen = -2 },
        [3] = { level = "Heavy",       max_weight = bl * 6, move_mult = 0.4, dodge_pen = -3 },
        [4] = { level = "Extra-Heavy", max_weight = bl * 10, move_mult = 0.2, dodge_pen = -4 }
    }
end
end
