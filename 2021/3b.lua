
function string.split(str, delim)
    delim = delim or "%s"
    local t = {}
    for s in str:gmatch("([^" .. delim .. "]+)") do
        table.insert(t, s)
    end
    return t
end

local f = assert(io.open("3.txt", "r"))
local txt = f:read("*all")
f:close()

local lines = txt:split("\n")
local lineLength = string.len(lines[1])

local bitCounts = {}
for k=1,lineLength do
    bitCounts[k] = { [0] = 0, [1] = 0 }
end

for _, line in pairs(lines) do
    for k = 1, string.len(line) do
        local char = tonumber(line:sub(k, k))
        bitCounts[k][char] = bitCounts[k][char] + 1
    end
end

local gammaRateBinary = ""
local epsilonRateBinary = ""

for key, val in pairs(bitCounts) do
    local mostCommon = "0"
    if val[1] > val[0] then mostCommon = "1" end
    local leastCommon = "1"
    if mostCommon == "1" then leastCommon = "0" end

    gammaRateBinary = gammaRateBinary .. mostCommon
    epsilonRateBinary = epsilonRateBinary .. leastCommon
end

print("Final gamma rate is " .. tostring(tonumber(gammaRateBinary, 2)) .. " (" .. gammaRateBinary .. ")")
print("Final epsilon rate is " .. tostring(tonumber(epsilonRateBinary, 2)) .. " (" .. epsilonRateBinary .. ")")
print("Final engine power is " .. tostring(tonumber(gammaRateBinary,2) * tonumber(epsilonRateBinary,2)))

