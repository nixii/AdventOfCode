

local filePath = "1.txt"

-- get the information immediately
local file = assert(io.open(filePath, "r"))
local data = file:read("*all")
local depths = {}
for str in string.gmatch(data, "([^\n]+)") do
    table.insert(depths, tonumber(str))
end
file:close()

-- process
local increases = 0
local last = nil

for k = 1, #depths - 2 do
    if last ~= nil and last < depths[k] + depths[k+1] + depths[k+2] then
	increases = increases + 1
    end
    
    last = depths[k] + depths[k+1] + depths[k+2]
end

print("The thing increased " .. tostring(increases) .. " times.")
