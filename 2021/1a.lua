

local filePath = "1.txt"

-- get the information immediately
local file = assert(io.open(filePath, "r"))
local data = file:read("*all")
local depths = {}
for str in string.gmatch(data, "([^\n]+)") do
    table.insert(depths, str)
end
file:close()

-- process
local increases = 0
local last = nil

for k, v in pairs(depths) do
    if last ~= nil and last < tonumber(v) then
	increases = increases + 1
    end
    last = tonumber(v)
end

print("The thing increased " .. tostring(increases) .. " times.")
