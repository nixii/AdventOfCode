
import std/strutils
import std/sequtils
import std/algorithm
import std/sugar

const file = "1.txt"

# Read the file
let txt = readFile(file)
let lines = splitLines(txt)
let data = lines
  .mapIt(it.splitWhitespace.mapIt(parseInt(it)))
  .filterIt(it.len > 0)

# Re-order the data
var
  dataA: seq[int] = @[]
  dataB: seq[int] = @[]

for line in data:
  dataA.add(line[0])
  dataB.add(line[1])

# get the results
var finalValue: int = 0

for num in dataA:
  let times = dataB.filterIt(it == num).len
  finalValue += times * num

echo "Final value is ", finalValue
