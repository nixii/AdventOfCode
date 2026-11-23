
import std/strutils
import std/sequtils
import std/sugar

let txt = readFile("2.txt")

# get the reports
let reports = txt.splitLines
  .mapIt(it.splitWhitespace.mapIt(it.parseInt))
  .filterIt(it.len > 0)

# how many are safe
var amountSafe: int = 0
  
for report in reports:
  var dir: int = 0
  var safe: bool = true
  
  for i in 1..report.len-1:
    let
      a = report[i-1]
      b = report[i]

    # max dist and min dist
    if abs(a-b) > 3 or a == b:
      safe = false
      break

    # direction
    if a > b:
      if dir != 0 and dir != -1:
        safe = false
        break
      dir = -1
    if a < b:
      if dir != 0 and dir != 1:
        safe = false
        break
      dir = 1
      
  amountSafe += safe.int

echo "There are ", amountSafe, " safe reports."
