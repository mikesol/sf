module FPSound.CrashCourse.Volume where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (AFuture, tdl)
import WAGS.Lib.Tidal.Tidal (changeVolume, make, onTag, parse_, s)

wag :: AFuture
wag = make 0.8
  { earth: s
      $ onTag "d0" (changeVolume $ const 0.3)
      $ onTag "d1" (changeVolume $ const 0.1)
      $ parse_ "bd:0 bd:0;d0 bd:0;d1"
  }

main :: Player
main = player (tdl wag)