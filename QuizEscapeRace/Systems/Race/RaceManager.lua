-- ============================================================================
-- RACE MANAGER - RENNEN-KOORDINATOR
-- ============================================================================
-- Verwaltet den gesamten Rennablauf und Spielerfortschritt
-- ============================================================================

local RaceManager = {}
RaceManager.__index = RaceManager

local Constants = require(script.Parent.Parent.Parent.Core.Constants)
local Signal = require(script.Parent.Parent.Parent.Utilities.SignalSystem)
local Helpers = require(script.Parent.Parent.Parent.Utilities.Helpers)

function RaceManager.new(players, difficulty)
    local self = setmetatable({}, RaceManager)
    
    self.players = players
    self.difficulty = difficulty
    self.isActive = false
    self.raceStartTime = nil
    
    -- Spieler-Daten
    self.playerProgress = {}
    for _, player in ipairs(players) do
        self.playerProgress[player.UserId] = {
            player = player,
            position = 0,
            ranking = 0,
            eliminated = false,
            correctAnswers = 0,
            wrongAnswers = 0,
            currentStreak = 0,
        }
    end
    
    -- Signale
    self.RaceStarted = Signal.new()
    self.PlayerEliminated = Signal.new()
    self.PlayerFinished = Signal.new()
    self.RaceEnded = Signal.new()
    self.CountdownTick = Signal.new()
    
    return self
end

-- Startet das Rennen mit Countdown
function RaceManager:Start()
    self.isActive = true
    self:Countdown()
    self.raceStartTime = tick()
    self.RaceStarted:Fire(self.players, self.difficulty)
end

-- 3...2...1...GO! Countdown
function RaceManager:Countdown()
    for i = Constants.TIMERS.COUNTDOWN_DURATION, 1, -1 do
        self.CountdownTick:Fire(i)
        task.wait(1)
    end
    self.CountdownTick:Fire(0)
    task.wait(0.5)
end

-- Aktualisiert Spielerposition
function RaceManager:UpdatePlayerProgress(player, newPosition)
    if self.playerProgress[player.UserId] then
        self.playerProgress[player.UserId].position = newPosition
    end
end

-- Markiert Spieler als eliminiert
function RaceManager:EliminatePlayer(player)
    if self.playerProgress[player.UserId] then
        self.playerProgress[player.UserId].eliminated = true
        self.PlayerEliminated:Fire(player)
    end
end

-- Markiert Spieler als fertig
function RaceManager:FinishPlayer(player, ranking)
    if self.playerProgress[player.UserId] then
        self.playerProgress[player.UserId].ranking = ranking
        self.PlayerFinished:Fire(player, ranking)
    end
end

-- Erhöht richtige Antworten
function RaceManager:AddCorrectAnswer(player)
    if self.playerProgress[player.UserId] then
        self.playerProgress[player.UserId].correctAnswers = 
            self.playerProgress[player.UserId].correctAnswers + 1
        self.playerProgress[player.UserId].currentStreak = 
            self.playerProgress[player.UserId].currentStreak + 1
    end
end

-- Erhöht falsche Antworten
function RaceManager:AddWrongAnswer(player)
    if self.playerProgress[player.UserId] then
        self.playerProgress[player.UserId].wrongAnswers = 
            self.playerProgress[player.UserId].wrongAnswers + 1
        self.playerProgress[player.UserId].currentStreak = 0
    end
end

-- Beendet das Rennen
function RaceManager:End()
    self.isActive = false
    local elapsedTime = tick() - self.raceStartTime
    self.RaceEnded:Fire(self.playerProgress, elapsedTime)
end

-- Gibt aktive Spieler zurück
function RaceManager:GetActivePlayers()
    local active = {}
    for userId, data in pairs(self.playerProgress) do
        if not data.eliminated then
            table.insert(active, data.player)
        end
    end
    return active
end

-- Gibt Spielerfortschritt zurück
function RaceManager:GetPlayerData(player)
    return self.playerProgress[player.UserId]
end

return RaceManager
