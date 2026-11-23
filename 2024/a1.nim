
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

sort(dataA)
sort(dataB)

# add the differences
var diff: int = 0
for i in 0..dataA.len-1:
  echo dataA[i], " and ", dataB[i], " => ", abs(dataA[i] - dataB[i])
  diff += abs(dataA[i] - dataB[i])

echo "The final difference is ", diff
