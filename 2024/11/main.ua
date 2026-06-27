RawStr        ← ▽⊸(∊"0123456789 ")&fras "input.txt"
InitialStones ← ⊜⋕⊸≠@ RawStr
# push 1 back to each row: count is 1
InitialRecord ← ≡([⊙1]) InitialStones
Split ← (
  # input: length string
  ÷2    # length/2 string
  ◡(⋕↙) # take left half string and parse
  ⊙(⋕↘) # take right half string and parse
)
ZeroTrans ← (
  # input: string num count, eg: "0" 0 3
  1◌◌  # delete first and second and push 1
  □[⊟] # get: {[[1 3]]}
)
EvenTrans ← (
  # input: string num count, eg: "1001" 1001 3
  ⊙◌      # delete num, get string count: "1001" 3
  ⊸⧻      # calculate length: 4 "1001" 3
  [Split] # split: [10 1] 3
  □≡⊂     # join rows: {[[10 3] [1 3]]}
)
OddTrans ← (
  # input: string num count, eg: "1" 1 10
  ◌         # delete string: 1 10
  □[⊟]×2024 # times 2024: {[[1 10]]}
)
# Selector: "0" -> 0, even digit -> 1, otherwise -> 2
Select ← ×⊙(+1◿2⊸⧻)⊸(¬≍"0")
Transform ← (
  °⊟          # put [stone count] to stone count
  ⊸°⋕         # : string, stone, count
  Select      # get branch name
  ⨬(ZeroTrans # "0"
  | EvenTrans # even digit
  | OddTrans  # odd digit
  )
)
Step ← (
  /◇(⊂)≡Transform # transform each row and join
  °⊟⍉             # extract stones and counts (transpose and decouple)
  ⟜⊛              # Get stones classify id
  ⊸˜⊕□            # group stones
  ⊙⊕□             # group counts
  ≡(◇⊢)           # select each groups first stone
  ⊙(≡(◇/+))       # sum up total counts
  ≡⊂              # join them
)
Solution ← /+≡⊣˜⍥Step InitialRecord

Solution 25
Solution 75
