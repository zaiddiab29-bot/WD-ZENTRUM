-- ============================================================================
-- LOBBY MANAGER - HAUPTLOBBY UND PORTAL-STEUERUNG
-- ============================================================================
-- Verwaltet Spieler in der Lobby und koordiniert Portal-Navigation
-- ============================================================================

local LobbyManager = {}
LobbyManager.__index = LobbyManager

local Constants = require(script.Parent.Parent.Parent.Core.Constants)
local Signal = require(script.Parent.Parent.Parent.Utilities.SignalSystem)

function LobbyManager.new()
    local self = setmetatable({}, LobbyManager)
    
    self.playersInLobby = {}
    self.selectedDifficulty = {}
    
    -- Signale
    self.PlayerJoinedLobby = Signal.new()
    self.PlayerLeftLobby = Signal.new()
    self.PlayerSelectedPortal = Signal.new()
    self.RaceStarting = Signal.new()
    
    return self
end

-- Spieler betritt Lobby
function LobbyManager:AddPlayer(player)
    self.playersInLobby[player.UserId] = player
    self.PlayerJoinedLobby:Fire(player)
    
    if script.Parent.Parent.Parent.Core.Config.DEBUG.ENABLED then
        print("[LobbyManager] Spieler " .. player.Name .. " betritt Lobby")
    end
end

-- Spieler verlässt Lobby
function LobbyManager:RemovePlayer(player)
    self.playersInLobby[player.UserId] = nil
    self.selectedDifficulty[player.UserId] = nil
    self.PlayerLeftLobby:Fire(player)
    
    if script.Parent.Parent.Parent.Core.Config.DEBUG.ENABLED then
        print("[LobbyManager] Spieler " .. player.Name .. " verlässt Lobby")
    end
end

-- Spieler wählt Schwierigkeit
function LobbyManager:SelectDifficulty(player, difficulty)
    self.selectedDifficulty[player.UserId] = difficulty
    self.PlayerSelectedPortal:Fire(player, difficulty)
    
    if script.Parent.Parent.Parent.Core.Config.DEBUG.ENABLED then
        print("[LobbyManager] Spieler " .. player.Name .. " wählt " .. difficulty.name)
    end
end

-- Gibt alle Spieler mit ausgewählter Schwierigkeit zurück
function LobbyManager:GetPlayersForDifficulty(difficulty)
    local players = {}
    for userId, selectedDiff in pairs(self.selectedDifficulty) do
        if selectedDiff.id == difficulty.id then
            table.insert(players, self.playersInLobby[userId])
        end
    end
    return players
end

-- Gibt Anzahl der Spieler in Lobby zurück
function LobbyManager:GetPlayerCount()
    local count = 0
    for _ in pairs(self.playersInLobby) do
        count = count + 1
    end
    return count
end

-- Startet Rennen mit ausgewählter Schwierigkeit
function LobbyManager:StartRace(difficulty)
    local players = self:GetPlayersForDifficulty(difficulty)
    self.RaceStarting:Fire(players, difficulty)
    
    -- Entferne Spieler aus Lobby
    for _, player in ipairs(players) do
        self.playersInLobby[player.UserId] = nil
        self.selectedDifficulty[player.UserId] = nil
    end
end

return LobbyManager
