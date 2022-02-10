module FPSound.CrashCourse.Volume where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (changeVolume, make, onTag, parse, s)
import WAGS.Lib.Tidal.Types (AFuture)

wag :: AFuture
wag = make 0.8
  { earth: s
      $ onTag "d0" (changeVolume $ const 0.3)
      $ onTag "d1" (changeVolume $ const 0.1)
      $ parse "bd:0 bd:0;d0 bd:0;d1"
  }

main :: Player
main = player (tdl wag)