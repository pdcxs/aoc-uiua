RawStr   ← &fras "input.txt"
Nums     ← ↯[⊙2]÷2⊸⧻⊜⋕⊸(¬∊",-")RawStr
GetRange ← +⊙(⇡+1)⟜-
Invalid  ← ≍⊃(↙|↘)⌈÷2⊸⧻°⋕
Invalid′ ← (
  # e.g. input: 123123123
  °⋕       # "123123123"
  ⊃(⧻|□)   # 9 box("123123123")
  ⊸(⌊÷2)   # 4 9 box("123123123")
  +1⇡      # [1 2 3 4] 9 box("123123123")
  ≡(⊂≡□⊂)  # [{1 9 "123123123"} {2 9 "123123123"} ...]
  ≡(       # for each row
    °⊟₃    # decouple 3 arguments
    ◇(↯⇌⊟) # in content, couple first, reverse, reshape
    ⧈≍     # every two slides, do they match?
    /×     # do all match?
  )
  >0/+ # is any split match?
)
NotSingle ← ⨬(Invalid′|0)⊸(<10)
Solve!    ← /+≡(/+▽⊸(≡^0)GetRange°⊟)
Solve!Invalid Nums
Solve!NotSingle Nums
