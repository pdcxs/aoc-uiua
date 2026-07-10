~ "../../lib/utils" ~ BetArr LinesBy! ReadFile
Parse  ← ⊜⋕⊸(≠@,)
Coords ← LinesBy!Parse ReadFile "input.txt"
Area   ← /×+1(⌵-)
/↥♭˙⊞Area Coords # Prob 1

# the input shape looks like:
#      XXXXXXX
#    XXXXXXXXXXXXX
#   XXXXXXXXXXXXXXX
#  XXXXXXXXXXXXXXXXX
# XXXXXXXXXXXXXXXXXXX
#                  XX
# XXXXXXXXXXXXXXXXXXX
#  XXXXXXXXXXXXXXXXX
#   XXXXXXXXXXXXXXX
#    XXXXXXXXXXXXX
#       XXXXXXX

# We can find right most inner points
# split the shape into top parts and bottom parts
# test each point with the corresponding inner point
# filter out the rects contains other points
# and get the maximum area.

Spliters ← ⍆⊏+1⊸(⍜⊣(-1)⊚>5000⧈(⊢⌵-))Coords
GetHalf‼ ← ⊏⤚(⊚^0≡⊣) Coords ^1
Top      ← GetHalf‼>(⊣⊢Spliters)
Bottom   ← GetHalf‼<(⊣⊣Spliters)
InRect   ← /×≡BetArr⊙(≡(⍜⊣(-1)⍜⊢(+1)⍆)⍉)
AnyIn    ← >0/+≡(˜InRect)¤⊟
MaxArea‼ ← /↥≡Area¤(^0)⊏⤚(⊚≡(¬AnyIn))^1¤^0¤^1
↥MaxArea‼(⊢Spliters)Top MaxArea‼(⊣Spliters)Bottom # Prob 2
