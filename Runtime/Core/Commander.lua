--
-- Commander: universal event emitter
--

local EventEmitter = require("Core.EventEmitter")

Commander = {}

local eventEmitter = EventEmitter()

function Commander.On(...)
    return eventEmitter:On(...)
end

function Commander.Off(...)
    return eventEmitter:Off(...)
end

function Commander.Once(...)
    return eventEmitter:Once(...)
end

function Commander.Emit(...)
    return eventEmitter:Emit(...)
end

return Commander