module FPSound.CrashCourse.Simul where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (AFuture, tdl)
import WAGS.Lib.Tidal.Tidal (make, s)

wag :: AFuture
wag = make 0.8
  { earth: s
      """
  [bd:0,notes:7] [notes:5,notes:12,notes:0]
  [hh:0,insect:0] [chin:0,notes:4]
  """
  }

main :: Player
main = player (tdl wag)