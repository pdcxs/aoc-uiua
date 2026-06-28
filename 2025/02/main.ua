~ "../../lib/utils" ~ BetArr Factors Range
RawStr ← &fras "input.txt"
Nums   ← ↯[⊙2]÷2⊸⧻⊜⋕⊸(¬∊",-")RawStr
# all possible subs with length in [start end]
SubNums ← (
  # input: [start end]
  Range ⊙(˜ⁿ10) ˜ⁿ10 ↥0 -1 °⊟
)
GetNums ← SubNums≡(≡(⌊÷2⧻°⋕))
Repeat  ← ⋕♭↯⊙(°⋕) # repeat a number n times

⊸(≡(□≡(Repeat2)GetNums))Nums
/+≡(/+˜▽⊙°□°□°⊟⊂≡(⟜BetArr)⊙↯ ⟜⧻)
