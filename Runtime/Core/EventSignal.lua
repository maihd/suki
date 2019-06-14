EventSignal = {
    
}

-- f
local function NewEventSignal()
    local result = {}

    setmetatable(result, EventSignal)

    result.__listeners = {}

    return result
end

setmetatable(EventSignal, {
    __call = NewEventSignal
});

return EventSignal