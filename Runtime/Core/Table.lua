
function table.deepcopy(orig)
    local copy
    if type(orig) == "table" then
        copy = {}
        for origKey, origValue in next, orig, nil do
            copy[table.deepcopy(origKey)] = table.deepcopy(origValue)
        end
    else
        copy = orig
    end
    return copy
end