~ "../../lib/utils" ~ AllSame LinesBy! ReadFile
Parse   ← ⊜⋕⊸(≠@,)
Coords  ← LinesBy!Parse ReadFile "input.txt"
Dist    ← /+≡˙×-
DistMat ← ⍜⊡(˜↯∞⧻)≡(˙⊟)⇡⊸⧻˙⊞Dist Coords
GetMin  ← ⊃(⊢|⍜⊡(˜↯∞⧻))⊚⊸=⊸(/↧♭)
Join    ← +⊃(×|×¬◌)⊙(⊸=)°⊟
Step    ← ⊙◌Join⊟◡⊃(˜⊡⊙⊢|˜⊡⊙⊣)⊙GetMin
/×↙3⇌⍆⊕⧻⍥(Step)1000⇡⧻Coords DistMat # Prob 1
# Prob 2
◡Step⇡⧻Coords DistMat   # Init state (but keep previous state)
⍢(◡Step⊙⊙(◌◌)|¬AllSame) # while current state is not all same
/×≡⊢˜⊏Coords⊙◌GetMin◌◌◌ # get previous state, extract coord
