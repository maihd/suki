-- Function utils
Function = {}

-- Binding function with value
-- a.k.a making new closure function
function Function.Bind(base, ...)
    local binding = { ... } 

    return function (...)
        local args = { unpack(binding) }
        for _, v in ipairs({ ... }) do
            table.insert(args, v)
        end

        base(unpack(args))
    end
end

-- update metatable for function object
debug.setmetatable(function() end, {
    __index = {
        bind = Function.Bind
    }
});