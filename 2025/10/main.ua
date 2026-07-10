~ "../../lib/utils" ~ LinesBy! ReadFile
RmEnds ← ⍜⇌(↘1)↘1
States ← =@#RmEnds
Nums   ← ⊜⋕⊸≠@,RmEnds
Decode ← ˜(⍜(⊏)(1◌))˜↯0
Parse ← (
  ⊜□⊸(≠@ )
  ⊃(◇(=@#RmEnds)⊢|↘1)
  ⟜⧻
  ⊙(
    ⊙(
      ⊃(⍜(⇌)(↘1)|Nums°□⊣)
      ≡(⍚(Nums))
    )
    ≡(◇(Decode))
  )
  □₃
)
Inputs   ← LinesBy!Parse ReadFile "test.txt"
AllCombs ← ⋯⇡˜ⁿ2⧻°□⊡1
GetPressResults ← (
  # Input: Combs of buttons, a row of inputs
  # Output: the press result
  /+≡(×)⊙(°□⊡1)
)
Solver₁ ← (
  # Give a problem (a row of inputs)
  # Get its result of question 1
  ⊸(AllCombs)
  ⊙¤
  ◡(≡(GetPressResults))
  ≡(◿2)
  ⊙⊙(¤°□⊢⊢)
  ◡(≡≍⊙⋅∘)
  /↧≡(/+)▽⊙⋅⊙⋅
)
# Prob1
/+≡Solver₁Inputs

# Problem 2:
# Assume one button needs to be pressed x times
# and x can be a binary number
# so we need to search from first bit (2^0)
# the first argument is base (1, 2, 4, 8, 16 ...)
GetPressResults₂ ← (
  # Input: base, press combs, prob
  # Output: valid press combs
)
