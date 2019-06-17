EventSignal = {}
EventSignal.__index = EventSignal;

function EventSignal:AddListener(listener)
    if type(listener) ~= "function" then
        error("EventSignal::AddListener: listener is invalid")
    end

    table.insert(self._listeners, listener)
end

function EventSignal:AddListenerOnce(listener)
    if type(listener) ~= "function" then
        error("EventSignal::AddListener: listener is invalid")
    end

    table.insert(self._onceListeners, listener)
end

function EventSignal:RemoveListener(listener)
    table.remove(self._listeners, listener)
    table.remove(self._onceListeners, listener)
end

function EventSignal:Raise(...)
    for _, listener in ipairs(self._listeners) do
        listener(...)
    end
end

function EventSignal:Clear()
    self._listeners = {}
    self._onceListeners = {}
end

-- Create new event signal
local function NewEventSignal()
    local result = {}

    setmetatable(result, EventSignal)

    result._name = "EventSignal"  
    result._listeners = {}
    result._onceListeners = {}

    return result
end

setmetatable(EventSignal, {
    __call = NewEventSignal
});

return EventSignal