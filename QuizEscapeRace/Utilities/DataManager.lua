-- ============================================================================
-- DATA MANAGER - DATENSPEICHERUNG UND VERWALTUNG
-- ============================================================================
-- Verwaltet Spielerdaten, Statistiken und Persistierung
-- ============================================================================

local DataManager = {}
DataManager.__index = DataManager

-- Spielerdaten-Template
local DEFAULT_PLAYER_DATA = {
    playerId = nil,
    playerName = nil,
    coins = 0,
    totalXP = 0,
    level = 1,
    totalRaces = 0,
    totalWins = 0,
    currentStreak = 0,
    bestStreak = 0,
    rankings = {},
    items = {},
    pets = {},
    chests = {},
}

local players = {}

function DataManager.new(player)
    local self = setmetatable({}, DataManager)
    self.player = player
    self.data = table.create(nil, DEFAULT_PLAYER_DATA)
    self.data.playerId = player.UserId
    self.data.playerName = player.Name
    return self
end

function DataManager:GetData()
    return self.data
end

function DataManager:AddCoins(amount)
    self.data.coins = self.data.coins + amount
    return self.data.coins
end

function DataManager:RemoveCoins(amount)
    self.data.coins = math.max(0, self.data.coins - amount)
    return self.data.coins
end

function DataManager:AddXP(amount)
    self.data.totalXP = self.data.totalXP + amount
    self:CheckLevelUp()
    return self.data.totalXP
end

function DataManager:CheckLevelUp()
    local xpPerLevel = 100
    local requiredXP = self.data.level * xpPerLevel
    
    while self.data.totalXP >= requiredXP do
        self.data.level = self.data.level + 1
        self.data.totalXP = self.data.totalXP - requiredXP
        requiredXP = self.data.level * xpPerLevel
    end
end

function DataManager:UpdateStreak(correct)
    if correct then
        self.data.currentStreak = self.data.currentStreak + 1
        if self.data.currentStreak > self.data.bestStreak then
            self.data.bestStreak = self.data.currentStreak
        end
    else
        self.data.currentStreak = 0
    end
end

function DataManager:AddRanking(position, difficulty)
    table.insert(self.data.rankings, {
        position = position,
        difficulty = difficulty,
        timestamp = os.time(),
    })
end

function DataManager:GetGlobalPlayer(player)
    if not players[player.UserId] then
        players[player.UserId] = DataManager.new(player)
    end
    return players[player.UserId]
end

return DataManager
