-- ============================================================================
-- HELPERS - HILFSFUNKTIONEN
-- ============================================================================
-- Nützliche Utility-Funktionen für alle Systeme
-- ============================================================================

local Helpers = {}

-- Gibt einen zufälligen Wert aus einer Tabelle zurück
function Helpers.RandomFromTable(t)
    return t[math.random(1, #t)]
end

-- Gibt einen zufälligen Wert mit Gewichtung zurück
function Helpers.WeightedRandom(items)
    local totalWeight = 0
    for _, item in ipairs(items) do
        totalWeight = totalWeight + (item.weight or 1)
    end
    
    local random = math.random() * totalWeight
    local current = 0
    
    for _, item in ipairs(items) do
        current = current + (item.weight or 1)
        if random <= current then
            return item
        end
    end
    
    return items[#items]
end

-- Pausiert für N Sekunden
function Helpers.Wait(seconds)
    task.wait(seconds)
end

-- Formatiert Zahlen mit Tausender-Trennzeichen
function Helpers.FormatNumber(num)
    if num >= 1000000 then
        return string.format("%.1fM", num / 1000000)
    elseif num >= 1000 then
        return string.format("%.1fK", num / 1000)
    end
    return tostring(num)
end

-- Berechnet Entfernung zwischen zwei Positionen
function Helpers.Distance(pos1, pos2)
    return (pos1 - pos2).Magnitude
end

-- Überprüft ob ein Spieler in Reichweite ist
function Helpers.IsInRange(pos1, pos2, range)
    return Helpers.Distance(pos1, pos2) <= range
end

-- Erstellt eine zufällige Farbe
function Helpers.RandomColor()
    return Color3.fromRGB(
        math.random(0, 255),
        math.random(0, 255),
        math.random(0, 255)
    )
end

-- Überprüft ob Wert in Bereich liegt
function Helpers.InRange(value, min, max)
    return value >= min and value <= max
end

-- Begrenzt Wert auf Bereich
function Helpers.Clamp(value, min, max)
    return math.max(min, math.min(max, value))
end

-- Lerp zwischen zwei Werten
function Helpers.Lerp(a, b, t)
    return a + (b - a) * t
end

return Helpers
