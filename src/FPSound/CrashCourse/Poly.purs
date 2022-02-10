module FPSound.CrashCourse.Poly where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Types (AFuture)
import WAGS.Lib.Tidal.Tidal (make, s)

wag :: AFuture
wag = make 0.8
  { earth: s
      """
  [notes:4 notes:5 notes:8 notes:12],
  hh:0*3
  """
  }

main :: Player
main = player (tdl wag)