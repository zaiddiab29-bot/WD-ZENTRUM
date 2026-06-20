-- ============================================================================
-- PLAYER MOVEMENT - SPIELER-BEWEGUNGSSTEUERUNG
-- ============================================================================
-- Verwaltet Spieler-Bewegung, Geschwindigkeit und Interaktionen
-- ============================================================================

local PlayerMovement = {}
PlayerMovement.__index = PlayerMovement

local Constants = require(script.Parent.Parent.Parent.Core.Constants)
local Helpers = require(script.Parent.Parent.Parent.Utilities.Helpers)

function PlayerMovement.new(character, raceManager)
    local self = setmetatable({}, PlayerMovement)
    
    self.character = character
    self.raceManager = raceManager
    self.rootPart = character:WaitForChild("HumanoidRootPart")
    self.humanoid = character:WaitForChild("Humanoid")
    
    self.currentSpeed = Constants.MOVEMENT.BASE_SPEED
    self.isBoosted = false
    self.isSlowed = false
    self.canMove = true
    
    return self
end

-- Setzt Bewegungsgeschwindigkeit
function PlayerMovement:SetSpeed(speed)
    self.currentSpeed = speed
    self.humanoid.WalkSpeed = speed
end

-- Gibt aktuelle Geschwindigkeit zurück
function PlayerMovement:GetSpeed()
    return self.currentSpeed
end

-- Aktiviert Boost
function PlayerMovement:Activate Boost(duration)
    if self.isBoosted then return end
    
    self.isBoosted = true
    self:SetSpeed(Constants.MOVEMENT.BOOSTED_SPEED)
    
    task.wait(duration or 5)
    
    self.isBoosted = false
    self:SetSpeed(Constants.MOVEMENT.BASE_SPEED)
end

-- Aktiviert Slow
function PlayerMovement:ActivateSlow(duration)
    if self.isSlowed then return end
    
    self.isSlowed = true
    self:SetSpeed(Constants.MOVEMENT.SLOW_SPEED)
    
    task.wait(duration or 8)
    
    self.isSlowed = false
    self:SetSpeed(Constants.MOVEMENT.BASE_SPEED)
end

-- Sperrt Bewegung
function PlayerMovement:LockMovement()
    self.canMove = false
    self.humanoid.WalkSpeed = 0
end

-- Freigabe Bewegung
function PlayerMovement:UnlockMovement()
    self.canMove = true
    self:SetSpeed(self.currentSpeed)
end

-- Teleportiert Spieler zur Position
function PlayerMovement:Teleport(position)
    self.rootPart.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))
end

-- Berechnet Distanz zur Zielline
function PlayerMovement:DistanceToFinish(finishPosition)
    return (self.rootPart.Position - finishPosition).Magnitude
end

-- Prüft ob Spieler im Ziel ist
function PlayerMovement:IsAtFinish(finishPosition, tolerance)
    tolerance = tolerance or 10
    return self:DistanceToFinish(finishPosition) <= tolerance
end

return PlayerMovement
