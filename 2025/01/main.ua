RawStr ← &fras"input.txt"
Parse  ← ⨬(⋕|¯⋕)=@L⊃(⊢|↘1)
Turns  ← ≡◇(Parse) ⊜□⊸≡(¬∊"\r\n") RawStr
Split  ← ⊃(↘1|⊢) # Get: [RemainTurns] CurrentTurn State [History]
Step ← (
  Split
  ⊙(        # ignore remain turns
    ↻       # rotate current turn
    ⊃(∘|⊂⊢) # pick first, push it in history
  )
)
Step′ ← (
  Split
  ⊙(      # ignore remain turns
    ⊸(<0) # whether current turn is negative
    ⨬(    # branch 0: current turn is positive
      ⍥(
        ↻1
        ⊃(∘|⊂⊢)
      )
    |   # branch 1: current turn is negative
      ¯ # first make the natative number to positive
      ⍥(
        ↻¯1
        ⊃(∘|⊂⊢)
      )
    )
  )
)
GetResult ← /+=0◌◌

GetResult ⍢(Step|>0⧻) Turns ↻50⇡100 []
GetResult ⍢(Step′|>0⧻) Turns ↻50⇡100 []
