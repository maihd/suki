debug.setmetatable(function() end, {
    __index = {
        bind = function (base, ...)
            local binding = { ... } 

            return function (...)
                local args = { unpack(binding) }
                for _, v in ipairs({ ... }) do
                    table.insert(args, v)
                end

                base(unpack(args))
            end
        end
    }
});