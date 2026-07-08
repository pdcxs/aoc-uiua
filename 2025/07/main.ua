~ "../../lib/utils" ~ LinesBy! ReadFile
Lines    ← LinesBy!∘ ReadFile "input.txt"
Start    ← =@S⊢Lines
Spliters ← =@^▽⊸≡(¬/×≠@^)Lines
Sol      ← ∧(⊙(+/+>0×)+⊙(◡(×¬))+⊃(⬚0↻1|⬚0↻¯1)◡×)Spliters
⍜⊟⇌/+Sol Start 0

# --- Sol Function Breakdown ---
# 
# Core Purpose:
# Processes the grid states (`Spliters`) sequentially using a fold/reduction (`∧`).
# For each step, it simulates ray propagation and interaction with splitters,
# updating both the light paths and the total interaction counter.
# 
# Step-by-Step Execution Logic:
# 1. Splitter Interaction & Shifting:
#    - `×` multiplies the incoming light rays with the `Spliters` mask to find rays 
#      that hit a splitter.
#    - `⊃(⬚0↻1 | ⬚0↻¯1)` takes these hit rays and splits them into two directions:
#      shifting them Left (`⬚0↻¯1`) and Right (`⬚0↻1`) with 0-filling.
#    - `+` sums these shifted rays together, representing the split propagation.
# 
# 2. Non-hitting Ray Preservation:
#    - `× ¬` multiplies the rays with the inverted splitter mask to find rays that 
#      missed/passed through the splitters.
#    - `+ ⊙ (◡ ...)` keeps these non-hitting rays unchanged and adds them back into 
#      the shifted/split result from Step 1 to form the updated grid state.
# 
# 3. Hit Counter Accumulation:
#    - `⊙ (+ / + >0 ×)` targets the deeper tracking state in the stack. It checks 
#      where the rays successfully hit the splitters (`>0`), and performs a nested 
#      summation (`+/+`) to accumulate the total number of successful hits/updates.
# 
# Summary:
# `Sol` simulates a cellular-automata wave step: rays hitting a splitter are cloned 
# and propagated left/right, rays missing splitters continue forward unaffected, 
# and the total number of splitter activations is tracked in the accumulator.
