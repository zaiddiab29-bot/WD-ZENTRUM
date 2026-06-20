-- ============================================================================
-- PORTAL SYSTEM - PORTAL-VERWALTUNG UND DARSTELLUNG
-- ============================================================================
-- Erstellt und verwaltet Schwierigkeits-Portale in der Lobby
-- ============================================================================

local PortalSystem = {}
PortalSystem.__index = PortalSystem

local Constants = require(script.Parent.Parent.Parent.Core.Constants)

function PortalSystem.new(parentFolder)
    local self = setmetatable({}, PortalSystem)
    
    self.parentFolder = parentFolder
    self.portals = {}
    
    return self
end

-- Erstellt ein Portal für die gegebene Schwierigkeit
function PortalSystem:CreatePortal(difficulty)
    local portal = Instance.new("Part")
    portal.Name = difficulty.name .. "Portal"
    portal.Shape = Enum.PartType.Ball
    portal.Size = Vector3.new(5, 5, 5)
    portal.Color = difficulty.color
    portal.CanCollide = false
    portal.CFrame = CFrame.new(Vector3.new(difficulty.id * 15, 10, 0))
    portal.TopSurface = Enum.SurfaceType.Smooth
    portal.BottomSurface = Enum.SurfaceType.Smooth
    portal.Parent = self.parentFolder
    
    -- Partikel-Effekt
    local particles = Instance.new("ParticleEmitter")
    particles.Parent = portal
    particles.Rate = 20
    particles.Lifetime = NumberRange.new(2)
    particles.Speed = NumberRange.new(5, 10)
    particles.Color = ColorSequence.new(difficulty.color)
    
    -- Label
    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Text = difficulty.displayName
    label.BackgroundTransparency = 1
    label.TextScaled = true
    label.Parent = portal
    
    self.portals[difficulty.id] = portal
    return portal
end

-- Erstellt alle Portale
function PortalSystem:CreateAllPortals()
    self:CreatePortal(Constants.DIFFICULTIES.EASY)
    self:CreatePortal(Constants.DIFFICULTIES.MEDIUM)
    self:CreatePortal(Constants.DIFFICULTIES.HARD)
    self:CreatePortal(Constants.DIFFICULTIES.EXPERT)
    self:CreatePortal(Constants.DIFFICULTIES.MASTER)
    self:CreatePortal(Constants.DIFFICULTIES.SECRET)
end

-- Gibt Portal für Schwierigkeit zurück
function PortalSystem:GetPortal(difficulty)
    return self.portals[difficulty.id]
end

-- Aktiviert Portal-Animation
function PortalSystem:AnimatePortal(difficulty)
    local portal = self:GetPortal(difficulty)
    if not portal then return end
    
    local startCFrame = portal.CFrame
    for i = 1, 20 do
        portal.CFrame = startCFrame * CFrame.Angles(0, math.rad(9), 0)
        task.wait(0.05)
    end
end

return PortalSystem
