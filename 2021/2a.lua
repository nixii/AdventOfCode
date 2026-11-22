
function string.split(str, delim)
    local d = {}
    delim = delim or "%s"

    for s in str:gmatch("([^" .. delim .. "]+)") do
        table.insert(d, s)
    end

    return d
end

function table.map(t, f)
    local t2 = {}
    for k, v in pairs(t) do
        t2[k] = f(v)
    end
    return t2
end


local depth = 0
local pos = 0

local f = assert(io.open("2.txt", "r"))
local txt = f:read("*all")
f:close()

local data = table.map(txt:split("\n"),
                       function(v) return v:split() end)

for _, v in pairs(data) do
    if v[1] == "forward" then
        pos = pos + tonumber(v[2])
    elseif v[1] == "up" then
        depth = depth - tonumber(v[2])
    elseif v[1] == "down" then
        depth = depth + tonumber(v[2])
    end
end

print("The final position is " .. tostring(pos))
print("The final depth is " .. tostring(depth))
print("These multiplied is " .. tostring(pos * depth))


