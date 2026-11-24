
import std/strutils
import std/sequtils
import std/enumerate

let txt = readFile("4.txt")

let data = txt
  .splitLines()
  .filterIt(it.len > 0)

# I need to do this:
#  1) Go through each 3x3 matrix possible
#  2) Try all possible combinations of corners to find MAS in both

let letters = ['M', 'A', 'S']

proc checkX(row: int, col: int): bool =
  let arr = data[row..row+2].mapIt(it[col..col+2])
  var amountOfValidDirections = 0

  for dr in countup(-1, 1, 2):
    for dc in countup(-1, 1, 2):
      var
        r = dr + 1
        c = dc + 1

      # doesn't even start right.
      if arr[r][c] != 'M': continue

      # check
      var isThisIt = true
      for i in 1..2:
        r = dr + 1 - dr * i
        c = dc + 1 - dc * i
        if arr[r][c] != letters[i]:
          isThisIt = false
          break

      # add if it is it
      if isThisIt: amountOfValidDirections += 1

  amountOfValidDirections >= 2

var total = 0
  
for row in 0..data.len-3:
  for col in 0..data[row].len-3:
    total += checkX(row, col).int

echo "The amount of X-MASs is ", total
