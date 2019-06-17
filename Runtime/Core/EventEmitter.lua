EventEmitter = {}
EventEmitter.__index = EventEmitter;

function EventEmitter:Emit(name, ...)
    local signal = self._signals[name]

    if signal then
        return signal:Raise(...)
    end

    return nil
end

function EventEmitter:On(name, listener)
    local signal = self._signals[name]
    if not signal then
        self._signals[name] = EventSignal()
        signal = self._signals[name]
    end

    signal:AddListener(listener)

    return self
end

function EventEmitter:Off(name, listener)
    local signal = self._signals[name]
    if signal then
        signal:RemoveListener(listener)
    end

    return self
end

function EventEmitter:Once(name, listener)
    local singal = self._signals[name]
    if not signal then
        self._signals[name] = EventSignal()
        signal = self._signals[name]
    end

    signal:AddListenerOnce(listener)

    return self
end

function EventEmitter.Assign(target)
    local eventEmitter = EventEmitter()

    function target:On(...)
        return eventEmitter:On(...)
    end

    function target:Off(...)
        return eventEmitter:Off(...)
    end

    function target:Once(...)
        return eventEmitter:Once(...)
    end
    
    function target:Emit(...)
        return eventEmitter:Emit(...)
    end

    return target
end

-- Create new event emitter
local function NewEventEmitter()
    local result = {}

    -- Make result become an event emitter
    setmetatable(result, EventEmitter)

    -- Fields
    result._signals = {}

    return result
end

-- Make event emitter become class constructor
setmetatable(EventEmitter, {
    __call = NewEventEmitter
})

-- Export module
return EventEmitter