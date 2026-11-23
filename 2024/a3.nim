
import std/strutils
import std/sequtils
import std/re

let txt = readFile("3.txt")
  .replace("\n")
let expr = re"mul\([0-9]+,[0-9]+\)"

let matches = txt.findAll(expr)

let times = matches
  .mapIt(it.findAll(re"[0-9]+,[0-9]+")[0])
  .mapIt(it.split(",").mapIt(it.parseInt))
  .mapIt(it[0] * it[1])
  .foldl(a + b)

echo times
