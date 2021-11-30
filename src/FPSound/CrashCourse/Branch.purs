module FPSound.CrashCourse.Branch where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (AFuture, tdl)
import WAGS.Lib.Tidal.Tidal (make, s)

wag :: AFuture
wag = make 0.8
  { earth: s
      """
   <bd:0 tabla:5> [notes:5 <notes:10 notes:14>]
   <hh:0 hh:2> chin:0*3
   """
  }

main :: Player
main = player (tdl wag)