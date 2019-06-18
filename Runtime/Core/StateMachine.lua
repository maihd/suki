StateMachine = {}
StateMachine.__index = {}

function StateMachine:Transition(transitionName)
    local transition = self.transitions[transitionName]

    if transition and (not self.current or self.current == transition.from) then
        self.eventEmitter:Emit(transitionName .. ".before")

        if self.current then
            self.eventEmitter:Emit(self.current .. ".leave")
        end
        
        self.current = transition.to
        self.eventEmitter:Emit(self.current .. ".enter")

        self.eventEmitter:Emit(transitionName .. ".after")
    end
end

-- Create new state machine
local function NewStateMachine(options)
    options = options or {}

    local result = {}

    setmetatable(result, StateMachine)

    result.current      = options.initial
    result.transitions  = options.transitions or {}
    result.eventEmitter = EventEmitter 

    return result
end

setmetatable(StateMachine, {
    __call = NewStateMachine
})