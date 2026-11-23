
import std/strutils
import std/sequtils
import std/re

let txt = readFile("3.txt")
  .replace("\n")
let expr = re"mul\([0-9]+,[0-9]+\)|do\(\)|don't\(\)"

let matches = txt.findAll(expr)

var active: bool = true

var result: int = 0

for match in matches:
  if match.startsWith("don"):
    active = false
  elif match.startsWith("do"):
    active = true
  elif active:

    result += match.findAll(re"[0-9]+,[0-9]+")[0]
      .split(",")
      .mapIt(it.parseInt)
      .foldl(a * b)

echo result
    
    

#let times = matches
#  .mapIt(it.findAll(re"[0-9]+,[0-9]+")[0])
#  .mapIt(it.split(",").mapIt(it.parseInt))
#  .mapIt(it[0] * it[1])
#  .foldl(a + b)
