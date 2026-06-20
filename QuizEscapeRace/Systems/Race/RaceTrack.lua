-- ============================================================================
-- RACE TRACK - STRECKEN-DEFINITION UND VERWALTUNG
-- ============================================================================
-- Definiert Strecken für jede Schwierigkeit
-- ============================================================================

local RaceTrack = {}
RaceTrack.__index = RaceTrack

local Constants = require(script.Parent.Parent.Parent.Core.Constants)

function RaceTrack.new(difficulty)
    local self = setmetatable({}, RaceTrack)
    
    self.difficulty = difficulty
    self.trackFolder = nil
    self.checkpoints = {}
    self.startPosition = Vector3.new(0, 5, 0)
    self.finishPosition = Vector3.new(0, 5, 1000)
    
    return self
end

-- Erstellt die Strecke
function RaceTrack:Create(parentFolder)
    self.trackFolder = Instance.new("Folder")
    self.trackFolder.Name = self.difficulty.displayName .. "Track"
    self.trackFolder.Parent = parentFolder
    
    -- Startlinie
    self:CreateStartLine()
    
    -- Strecke
    self:CreateRoadway()
    
    -- Zielline
    self:CreateFinishLine()
    
    -- Hindernisse
    self:CreateObstacles()
end

-- Erstellt Startlinie
function RaceTrack:CreateStartLine()
    local startLine = Instance.new("Part")
    startLine.Name = "StartLine"
    startLine.Size = Vector3.new(50, 1, 5)
    startLine.Color = Color3.fromRGB(255, 255, 0)
    startLine.Material = Enum.Material.Neon
    startLine.CanCollide = false
    startLine.CFrame = CFrame.new(self.startPosition)
    startLine.Parent = self.trackFolder
    
    table.insert(self.checkpoints, {
        name = "Start",
        position = self.startPosition,
        part = startLine,
    })
end

-- Erstellt Fahrbahn
function RaceTrack:CreateRoadway()
    local roadway = Instance.new("Part")
    roadway.Name = "Roadway"
    roadway.Size = Vector3.new(50, 1, 1000)
    roadway.Color = self.difficulty.color
    roadway.Material = Enum.Material.Concrete
    roadway.CanCollide = true
    roadway.TopSurface = Enum.SurfaceType.Smooth
    roadway.BottomSurface = Enum.SurfaceType.Smooth
    roadway.CFrame = CFrame.new(0, 4, 500)
    roadway.Parent = self.trackFolder
end

-- Erstellt Zielline
function RaceTrack:CreateFinishLine()
    local finishLine = Instance.new("Part")
    finishLine.Name = "FinishLine"
    finishLine.Size = Vector3.new(50, 1, 5)
    finishLine.Color = Color3.fromRGB(0, 255, 0)
    finishLine.Material = Enum.Material.Neon
    finishLine.CanCollide = false
    finishLine.CFrame = CFrame.new(self.finishPosition)
    finishLine.Parent = self.trackFolder
    
    table.insert(self.checkpoints, {
        name = "Finish",
        position = self.finishPosition,
        part = finishLine,
    })
end

-- Erstellt Hindernisse basierend auf Schwierigkeit
function RaceTrack:CreateObstacles()
    local obstacleCount = math.floor(self.difficulty.id * 3)
    
    for i = 1, obstacleCount do
        local obstacle = Instance.new("Part")
        obstacle.Name = "Obstacle_" .. i
        obstacle.Size = Vector3.new(10, 5, 10)
        obstacle.Color = Color3.fromRGB(100, 100, 100)
        obstacle.Material = Enum.Material.Rock
        obstacle.CanCollide = true
        obstacle.CFrame = CFrame.new(
            math.random(-20, 20),
            5,
            100 + (i * 80)
        )
        obstacle.Parent = self.trackFolder
    end
end

-- Gibt Streckenposition zurück
function RaceTrack:GetTrackDistance()
    return (self.finishPosition - self.startPosition).Magnitude
end

-- Berechnet Fortschritt als Prozentsatz
function RaceTrack:GetProgressPercent(currentPosition)
    local totalDistance = self:GetTrackDistance()
    local currentDistance = (currentPosition - self.startPosition).Magnitude
    return math.min(100, (currentDistance / totalDistance) * 100)
end

return RaceTrack
