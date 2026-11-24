
import std/strutils
import std/sequtils
import std/enumerate

let txt = readFile("4.txt")

let data = txt
  .splitLines()
  .filterIt(it.len > 0)

let letters = @['X', 'M', 'A', 'S']

proc check(row: int, col: int): int =
  for r in -1..1:
    for c in -1..1:
      if r == 0 and c == 0: continue
      var isThisIt = true

      # check this direction
      for i in 1..3:
        var
          newRow = row + r * i
          newCol = col + c * i

        # bounds checking
        if newRow < 0 or newRow >= data.len:
          isThisIt = false
          break
        if newCol < 0 or newCol >= data[newRow].len:
          isThisIt = false
          break

        # check the letter
        var letter = data[newRow][newCol]
        if letter != letters[i]:
          isThisIt = false
          break

      # if true, return it!
      if isThisIt:
        result += 1

# the amount
var amountFound = 0
  
# find all the "X"s
for (i, line) in enumerate(data):
  for (j, letter) in enumerate(line):
    if letter != 'X': continue
    
    # check from these coordinates
    amountFound += check(i, j).int


echo amountFound, " words were found."
