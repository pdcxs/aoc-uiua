~ "../../lib/utils" ~ LinesBy! ReadFile
AddWall ← ≡(˜⊂@.⊂@.)˜⊂⟜⊂˜↯@.⊸(⧻⊢)
Lines   ← AddWall LinesBy!∘ ReadFile "input.txt"
Count   ← ⊙◌/+=@@≡(⊡+)(⊂A₂C₂)⊸(∩¤)
Rm      ← ⍜(⊡)(˜↯@.⧻)
Step    ← ⤚(⊙(Rm⊙°¤))⊃(/+|≡⊡⊚)⊙¤<4◡(≡(Count))⊙¤⊚⊸(=@@)
/+<4≡(Count)⊙¤⊚⊸(=@@) Lines # Prob 1
◌◌⍢(⊙⊙+Step◌|>0)Step Lines  # Prob 2

# ==============================================================================
# CODE EXPLANATION & ARCHITECTURE
# ==============================================================================
# OVERALL APPROACH:
# This program simulates a 2D cellular automaton of paper rolls ('@') and empty
# spaces ('.').
# - In Uiua, out-of-bounds indexing wraps around the array. To prevent coordinates
#   from wrapping around the edges of the grid, AddWall explicitly pads the matrix
#   with an outer ring of '.' characters.
# - Prob 1: Finds all '@' cells that initially have fewer than 4 neighbors.
# - Prob 2: Simulates a cascading elimination. In each step, all '@' cells with
#   fewer than 4 neighbors are simultaneously turned into '.'. This loops until
#   the grid stabilizes, tracking the total count of removed cells.
#
# ------------------------------------------------------------------------------
# THE ROLE OF FIX (¤):
# The fix (¤) modifier adds a leading axis of length 1 to its argument (wrapping
# it into a single-row array). When combined with rows (≡) or distribute/per-row
# operations, it allows the entire grid or array to be treated as a single
# repeated constant value for every row of the other input.
#
# ------------------------------------------------------------------------------
# FUNCTION BREAKDOWN:
#
# AddWall ← ≡(˜⊂@.⊂@.)˜⊂⟜⊂˜↯@.⊸(⧻⊢)
#   - Input: A 2D character matrix (the original grid).
#   - Output: A 2D character matrix padded with '.' on all 4 sides.
#   - Function: Acts as a boundary guard to stop coordinates from wrapping around
#     the matrix edges due to Uiua's default wrap-around indexing behavior.
#
# Count ← ⊙◌/+=@@≡(⊡+)(⊂A₂C₂)⊸(∩¤)
#   - Input: A single 2D coordinate [row col] on left, [Grid Matrix] on right.
#   - Output: The count of '@' characters surrounding that specific position.
#   - Function: Combines A₂ (orthogonal offsets) and C₂ (diagonal offsets) into
#     8 neighbor directions. It adds them to the input coordinate, retrieves the
#     characters via ⊡, and counts how many match '@'.
#
# Rm ← ⍜(⊡)(˜↯@.⧻)
#   - Input: [Target Coordinates] on left, [Grid Matrix] on right.
#   - Output: An updated Grid Matrix.
#   - Function: Uses the under (⍜) modifier to delete the matching '@' characters
#     at the target coordinates, replacing them with '.'.
#
# Step ← ⤚(⊙(Rm⊙°¤))⊃(/+|≡⊡⊚)⊙¤<4◡(≡(Count))⊙¤⊚⊸(=@@)
#   - Input: [Grid Matrix] on stack.
#   - Output: [Removed Count, Updated Grid Matrix, Removed Count].
#   - Function: Executes a single simulation step:
#     1. Finds all '@' coordinates and counts their neighbors.
#     2. Filters coordinates with strictly fewer than 4 neighbors.
#     3. Uses Rm to replace those eliminated paper rolls with '.'.
#     4. Returns the number of removed rolls, the new grid, and a duplicate
#        of the removed count to easily accumulate into the history total.
#
# ------------------------------------------------------------------------------
# EXECUTION:
#
# Prob 1:
#   Finds all '@' coordinates on the initial grid, maps Count over them using ≡,
#   and sums up how many have fewer than 4 neighbors.
#
# Prob 2:
#   Utilizes the do-while loop modifier (⍢) to repeatedly execute Step.
#   The loop runs as long as the step removes a non-zero number of paper rolls
#   (>0 condition). It automatically accumulates the counts and pops the extra
#   grid metadata to leave the final answer on the stack.
# ==============================================================================
