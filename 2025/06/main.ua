~ "../../lib/utils" ~ LinesBy! ReadFile
Lines ← LinesBy!∘ ReadFile "input.txt"
Ops   ← ⊜⊢⊸(≠@ )⊣Lines
Nums₁ ← ⍉≡(⊜⋕⊸≠@ ) ⍜⇌(↘1) Lines
Nums₂ ← ⊜(□⋕) ⊸(≡(¬/×=@ ))⍉⍜⇌(↘1)Lines
Calc  ← /+≡(◇⨬(/+|/×)=@*) Ops
Calc Nums₁
Calc Nums₂
