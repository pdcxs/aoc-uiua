# Experimental!
RawStr ← &fras "./input.txt"
Lines  ← ⊜∘⊸(¬∊"\n\r")RawStr
# remove last n digits
Rem     ← ⇌↘⊙⇌
Extract ← ˜↘⊙(+1⊢⊚)⟜=
Step ← (
  # input: digit length, current string, history
  -1   # digit length minus one
  ◠Rem # remove tail digits
  ⊙(
    ⊙/↥      # find the max value
    ⊸Extract # update current string
    ⊙˜⊂      # update history
  )
)
GetMaxBy ← ⋕◌◌⍢(Step|>0)

/+≡(GetMaxBy 2) Lines [""]
/+≡(GetMaxBy 12) Lines [""]

┌─╴Test
  ˙⍤ ≍ "123" Rem 3 "123456"
  ˙⍤ ≍ "45678" Extract "12345678" @3
└─╴
