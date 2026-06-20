-- ============================================================================
-- SIGNAL SYSTEM - LEICHTGEWICHTIGES EVENT-SYSTEM
-- ============================================================================
-- Verwendet für dezentralisierte Kommunikation zwischen Systemen
-- ============================================================================

local Signal = {}
Signal.__index = Signal

function Signal.new()
    return setmetatable({
        _bindable = Instance.new("BindableEvent"),
    }, Signal)
end

function Signal:Connect(callback)
    return self._bindable.Event:Connect(callback)
end

function Signal:Fire(...)
    self._bindable:Fire(...)
end

function Signal:Wait()
    return self._bindable.Event:Wait()
end

function Signal:Destroy()
    if self._bindable then
        self._bindable:Destroy()
        self._bindable = nil
    end
end

return Signal
