BetArr   ← ×⊙≥⊙⊙⊣⤚(≤)⊙⊸⊢
Between  ← ˜BetArr⊟
Factors  ← ˜▽⊙(=0)⟜◿+1⇡⌊⊸÷2
Range    ← +⇡⤚-
ReadFile ← ▽⊸(≠@\r)&fras
LinesBy! ← ⊜^0⊸(≠@\n)
SpBlkLn  ← ⊜□=0+⊸(⬚0↻¯1)⊸(⌕"\n\n")
AllSame  ← /×⧈(=°⊟)2

┌─╴Test
  ˙⍤ =1 BetArr 5 [0 10]
  ˙⍤ =0 BetArr 5 [0 3]
  ˙⍤ =0 BetArr 5 [10 12]
  ˙⍤ =1 BetArr 5 [0 5]
  ˙⍤ =1 Between 0 10 5
  ˙⍤ =0 Between 0 3 5
  ˙⍤ =0 Between 10 12 5
  ˙⍤ =1 Between 0 5 5

  ˙⍤ ≍ [1 2 3 4 6] Factors 12
  ˙⍤ ≍ [3 4 5 6] Range 3 7
└─╴
