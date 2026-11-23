
function string.split(str, delim)
    local t = {}
    delim = delim or "%s"
    for s in str:gmatch("(.-)" .. delim) do
        table.insert(t, s)
    end
    return t
end

function table.map(t, f)
    local ft = {}
    for k, v in pairs(t) do
        ft[k] = f(v)
    end
    return ft
end

local f = assert(io.open("4.txt", "r"))
local txt = f:read("*all")
f:close()

local splits = txt:split("\n\n")

local randomNums = table.map(splits[1]:split(","), function(v) return tonumber(v) end)
table.remove(splits, 1)

local boards = table.map(splits, function(v)
    return table.map(v:split("\n"), function(v2)
        return table.map(v2:split(), function(v3)
            return {tonumber(v3), false}
        end)
    end)
end)

for _, num in pairs(randomNums) do
    for _, board in pairs(boards) do
        for _, row in pairs(board) do
            for _, char in pairs(row) do
                if char[1] == num then
                    char[2] = true
                end
                
            end
            
        end
        
    end
    
end
