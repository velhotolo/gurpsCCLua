local main = {}
main.__index = main
-- Going to use OOP
-- Setting up attributes
function main:new()
    local obj = setmetatable({}, main)
    obj.startingPoints = 100
    obj.spentPoints = 0
    obj.unspentPoints = 0
    obj.st = 10
    obj.dx = 10
    obj.iq = 10
    obj.ht = 10
    obj.will = 10
    obj.per = 10
    obj.hp = 10
    obj.fp = 10
    obj.basicSpeed = 5
    obj.basicMove = 5
    obj.sizeModifier = 0
    obj.thrust = {}
    obj.swing = {}
    obj.adv = 0
    obj.disadv = 0
    return obj
end

-- Main attributes calculation
function main:basicAttributes()
    local finalSt = 10
    local stPoints = 10
    local finalHt = 10

    if finalSt > 10 or finalSt < 10 then
        stPoints = (finalSt - 10) * 10
    elseif self.sizeModifier > 0 then
        stPoints = stPoints - ((10 / 100) * self.sizeModifier)
        self.spentPoints = stPoints
    elseif finalHt > 10 or finalHt < 10 then
        local htPoints
        htPoints = (finalHt - 10) * 10
        self.spentPoints = self.spentPoints + htPoints
    end
    local finalDx = 10
    if finalDx > 10 or finalDx - 10 then
        local dxPoints = (finalDx - 10) * 20
        finalDx = io.read()
        self.spentPoints = self.spentPoints + dxPoints
    end
    local finalIq = 10
    if finalIq > 10 or finalIq - 10 then
        local iqPoints = (finalIq - 10) * 20
        self.spentPoints = self.spentPoints + iqPoints
    end
end

-- Secondary attributes
local maxPer = 0
local maxBs = 0
local maxFp = 0
function main:secondaryAttributes()
    self.basicSpeed = (self.dx + self.ht) / 4
    self.basicMove = math.floor(self.dx + self.ht) / 4
    local maxBm
    if maxBm > self.basicMove or maxBm < self.basicMove then
        local bmPoints
        bmPoints = (maxBm - self.basicMove) * 5
        self.spentPoints = bmPoints
        self.basicMove = self.basicMove - self.moveMult
    elseif maxBs > self.basicSpeed or maxBs < self.basicSpeed then
        local bsPoints = 0
        bsPoints = ((self.attributeValue - 5) / 0.25) * 5
        self.spentPoints = self.spentPoints + bsPoints
        self.basicSpeed = self.basicSpeed - self.moveMult
    end
    local maxWill = 10
    if maxWill > 10 or maxWill < 10 then
        local willPoints = 0
        willPoints = (maxWill - self.will) * 5
        self.spentPoints = self.spentPoints + willPoints
    elseif maxPer > 10 or maxPer < 10 then
        local perPoints = 0
        perPoints = (maxPer - self.per) * 5
        self.spentPoints = self.spentPoints + perPoints
    end
    local maxHp
    local hpPoints
    if maxHp > 10 or maxHp < 10 then
        hpPoints = (maxHp - self.hp) * 2
        self.spentPoints = self.spentPoints + hpPoints
    elseif maxFp > 10 or maxFp < 10 then
        local fpPoints = 0
        fpPoints = (maxFp + self.fp) * 3
        self.spentPoints = self.spentPoints + fpPoints
    end
end

-- Function to calculate Basic Lift (BL)
function main:calculateBasicLift()
    local bl = (self.st * self.st) / 5
    -- GURPS 4e: If BL is 10 or more, round to the nearest whole number
    if bl >= 10 then
        bl = math.floor(bl + 0.5)
    end
    return bl
end

-- Function to return the complete Encumbrance table
function main:getEncumbrance(st)
    local bl = self.calculateBasicLift(st)
    -- Encumbrance Table (level name, max weight, move multiplier, dodge penalty)
    return {
        [0] = { level = "None", maxWeight = bl * 1, moveMult = 1.0, dodgePen = 0 },
        [1] = { level = "Light", maxWeight = bl * 2, moveMult = 0.8, dodgePen = -1 },
        [2] = { level = "Medium", maxWeight = bl * 3, moveMult = 0.6, dodgePen = -2 },
        [3] = { level = "Heavy", maxWeight = bl * 6, moveMult = 0.4, dodgePen = -3 },
        [4] = { level = "Extra-Heavy", maxWeight = bl * 10, moveMult = 0.2, dodgePen = -4 }
    }
end

function main:combatStats()
    local baseDodge = math.floor(self.basicSpeed + 3)
    local currentDodge = baseDodge - self.dodgePen
    local thr = self:getThrustDamage()
    local sw = self:getSwingDamage()
end

function main:getThrustDamage()
    if self.st <= 100 then
        return self.thurst[self.st]
    else
        local dice = math.floor(self.st / 10) + 1
        return dice .. "d"
    end
end

function main:getSwingDamage()
    if self.st <= 100 then
        return self.swing[self.st]
    else
        local dice = math.floor(self.st / 10) + 3
        return dice .. "d"
    end
end

function main:damageTable()
    -- Damage tables
    self.thrust = {
        [1] = "1d-6",
        [2] = "1d-6",
        [3] = "1d-5",
        [4] = "1d-5",
        [5] = "1d-4",
        [6] = "1d-4",
        [7] = "1d-3",
        [8] = "1d-3",
        [9] = "1d-2",
        [10] = "1d-2",
        [11] = "1d-1",
        [12] = "1d-1",
        [13] = "1d",
        [14] = "1d",
        [15] = "1d+1",
        [16] = "1d+1",
        [17] = "1d+2",
        [18] = "1d+2",
        [19] = "2d-1",
        [20] = "2d-1",
        [21] = "2d",
        [22] = "2d",
        [23] = "2d+1",
        [24] = "2d+1",
        [25] = "2d+2",
        [26] = "2d+2",
        [27] = "3d-1",
        [28] = "3d-1",
        [29] = "3d",
        [30] = "3d",
        [31] = "3d+1",
        [32] = "3d+1",
        [33] = "3d+2",
        [34] = "3d+2",
        [35] = "4d-1",
        [36] = "4d-1",
        [37] = "4d",
        [38] = "4d",
        [39] = "4d+1",
        [40] = "4d+1",
        [41] = "4d+2",
        [42] = "4d+2",
        [43] = "5d-1",
        [44] = "5d-1",
        [45] = "5d",
        [46] = "5d+1",
        [47] = "5d+1",
        [48] = "5d+1",
        [49] = "5d+1",
        [50] = "5d+2",
        [51] = "6d-1",
        [52] = "6d-1",
        [53] = "6d-1",
        [54] = "6d-1",
        [55] = "6d",
        [56] = "6d+1",
        [57] = "6d+1",
        [58] = "6d+2",
        [59] = "6d+2",
        [60] = "7d-1",
        [61] = "7d",
        [62] = "7d",
        [63] = "7d",
        [64] = "7d",
        [65] = "7d+1",
        [66] = "7d+2",
        [67] = "7d+2",
        [68] = "8d-1",
        [69] = "8d-1",
        [70] = "8d",
        [71] = "8d",
        [72] = "8d",
        [73] = "8d+1",
        [74] = "8d+1",
        [75] = "8d+2",
        [76] = "8d+2",
        [77] = "8d+2",
        [78] = "9d-1",
        [79] = "9d-1",
        [80] = "9d",
        [81] = "9d",
        [82] = "9d",
        [83] = "9d+1",
        [84] = "9d+1",
        [85] = "9d+2",
        [86] = "9d+2",
        [87] = "9d+2",
        [88] = "10d-1",
        [89] = "10d-1",
        [90] = "10d",
        [91] = "10d",
        [92] = "10d",
        [93] = "10d+1",
        [94] = "10d+1",
        [95] = "10d+2",
        [96] = "10d+2",
        [97] = "10d+2",
        [98] = "11d-1",
        [99] = "11d-1",
        [100] = "11d"
    }

    self.swing = {
        [1] = "1d-5",
        [2] = "1d-5",
        [3] = "1d-4",
        [4] = "1d-4",
        [5] = "1d-3",
        [6] = "1d-3",
        [7] = "1d-2",
        [8] = "1d-2",
        [9] = "1d-1",
        [10] = "1d",
        [11] = "1d+1",
        [12] = "1d+2",
        [13] = "2d-1",
        [14] = "2d",
        [15] = "2d+1",
        [16] = "2d+2",
        [17] = "3d-1",
        [18] = "3d",
        [19] = "3d+1",
        [20] = "3d+2",
        [21] = "4d-1",
        [22] = "4d",
        [23] = "4d+1",
        [24] = "4d+2",
        [25] = "5d-1",
        [26] = "5d",
        [27] = "5d+1",
        [28] = "5d+2",
        [29] = "6d-1",
        [30] = "6d",
        [31] = "6d+1",
        [32] = "6d+2",
        [33] = "7d-1",
        [34] = "7d",
        [35] = "7d+1",
        [36] = "7d+2",
        [37] = "8d-1",
        [38] = "8d",
        [39] = "8d+1",
        [40] = "8d+2",
        [41] = "9d-1",
        [42] = "9d-1",
        [43] = "9d-1",
        [44] = "9d-1",
        [45] = "9d",
        [46] = "9d+1",
        [47] = "9d+1",
        [48] = "9d+1",
        [49] = "9d+1",
        [50] = "9d+2",
        [51] = "10d-1",
        [52] = "10d-1",
        [53] = "10d-1",
        [54] = "10d-1",
        [55] = "10d",
        [56] = "10d+1",
        [57] = "10d+1",
        [58] = "10d+1",
        [59] = "10d+1",
        [60] = "10d+2",
        [61] = "11d-1",
        [62] = "11d-1",
        [63] = "11d-1",
        [64] = "11d-1",
        [65] = "11d",
        [66] = "11d+1",
        [67] = "11d+1",
        [68] = "11d+1",
        [69] = "11d+1",
        [70] = "11d+2",
        [71] = "12d-1",
        [72] = "12d-1",
        [73] = "12d-1",
        [74] = "12d-1",
        [75] = "12d",
        [76] = "12d+1",
        [77] = "12d+1",
        [78] = "12d+1",
        [79] = "12d+1",
        [80] = "12d+2",
        [81] = "13d-1",
        [82] = "13d-1",
        [83] = "13d-1",
        [84] = "13d-1",
        [85] = "13d",
        [86] = "13d+1",
        [87] = "13d+1",
        [88] = "13d+1",
        [89] = "13d+1",
        [90] = "13d+2",
        [91] = "14d-1",
        [92] = "14d-1",
        [93] = "14d-1",
        [94] = "14d-1",
        [95] = "14d",
        [96] = "14d+1",
        [97] = "14d+1",
        [98] = "14d+1",
        [99] = "14d+1",
        [100] = "14d+2"
    }
end
