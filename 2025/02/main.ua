~ "../../lib/utils" ~ BetArr Factors Range
RawStr         ← &fras "input.txt"
Nums           ← ↯⊟⊙2÷2⊸⧻⊜⋕⊸(¬∊",-")RawStr
SubNums        ← Range ⊙(˜ⁿ10)˜ⁿ10↥0-1°⊟
GetNumsBy      ← SubNums≡(⌊÷)⊙≡(⧻°⋕)
Repeat         ← ⋕♭↯⊙(°⋕) # repeat a number n times
GetLengthOver  ← ⌊÷⊙(⧻°⋕)
GetSolutionBy  ← □▽⤚≡BetArr⊙¤⊸(≡(Repeat)⟜GetNumsBy)
PossibleTimes  ← ÷⊸Factors
SecondSolution ← /+◴/◇⊂≡(GetSolutionBy)⊃(◴/◇⊂≡(□PossibleTimes⧻°⋕)|¤)

# Solution 1
/+/◇⊂≡(GetSolutionBy 2)Nums
# Solution 2
/+≡(SecondSolution) Nums

┌─╴Test
  ˙⍤ ≍ SubNums [2 3] Range 10 1000
  ˙⍤ = 2 GetLengthOver 2 1234
  ˙⍤ = 2 GetLengthOver 2 12345
  ˙⍤ = 2 GetLengthOver 3 123456
  ˙⍤ = 555 Repeat 3 5
  ˙⍤ = 12121212 Repeat 4 12
  ˙⍤ ≍ 11_22 °□GetSolutionBy 2 11_22
  ˙⍤ ≍ [10 5 2] PossibleTimes 10
  ˙⍤ = /+999_1010 SecondSolution 998_1012
└─╴
