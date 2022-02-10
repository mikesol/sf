module FPSound.CrashCourse.Subdiv where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (make, s)
import WAGS.Lib.Tidal.Types (AFuture)

wag :: AFuture
wag = make 0.8
  { earth: s
      """
   bd:0 [notes:5 notes:10]
   hh:0 chin:0*3
   """
  }

main :: Player
main = player (tdl wag)