~ "../../lib/utils" ~ BetArr LinesBy! ReadFile SpBlkLn
Blocks ← SpBlkLn ReadFile "input.txt"
Parse  ← ⊜⋕⊸≠@-
Rngs   ← LinesBy!Parse°□⊢Blocks
Nums   ← LinesBy!⋕ °□ ⊣ Blocks
/+≡(>0/+≡(BetArr)) Nums¤Rngs # Solution 1

IsLeft  ← >⊣⊙⊢
IsRight ← <⊢⊙⊣
Left    ← =⊣⊙⊢
Right   ← =⊢⊙⊣
Inner   ← ×˜BetArr⊙⊣⤙(⟜(BetArr⊢))
Contain ← ×⊙(<⊣⊙⊣)◡(>⊙⊢⊢)
RightIn ← BetArr⊣
LeftIn  ← BetArr⊢
Branch  ← ⊢⊚[⊃(Left|Right|Inner|Contain|RightIn|LeftIn)]
Combine ← ⨬(⊟⊢⊙⊣|˜⊟⊙⊢⊣|◌|⊙◌|⊟⊙⊣⊢|˜⊟⊣⊙⊢)◡Branch

Sep      ← +⊃(IsLeft|IsRight)
GetInter ← ⊸(⊸⧻▽⊸(≡(≠°⊟))⊚˙⊞(¬Sep))
Update   ← ⊂⊃(⊏▽⊸(¬∊)⊙(°⊏)|Combine°⊟⊏)⊢

/+≡(+1-°⊟)◌◌⍢(GetInter Update◌|>0) GetInter Rngs # Solution 2

# Algorithmic Strategy: Iterative Interval Merging
# The core idea is to repeatedly identify pairs of overlapping intervals,
# extract the first overlapping pair found from the array, merge them into
# a single unified interval based on their spatial relationship, and append
# the merged interval back to the remaining array. This loops until no
# overlapping intervals remain.
#
# Helper Breakdown:
# - Sep            : Checks whether two given intervals are completely disjoint (separated).
# - GetInter       : Scans the interval list to find overlapping pairs, returning
#                    both the total count of intersections and their specific indices.
# - Branch         : Takes two overlapping intervals and identifies the geometric
#                    case/branch number representing how they intersect.
# - Combine        : Uses the branch number from `Branch` to determine the exact
#                    logic needed to merge the two overlapping intervals into one.
# - Update         : Extracts the first pair of overlapping intervals using the indices
#                    from `GetInter`, removes them from the original array, merges them
#                    via `Combine`, and appends the new merged interval back.
# - ⍢(GetInter Update...) : The main loop that continuously locates overlaps and
#                           updates the array until the intersection count drops to 0.
