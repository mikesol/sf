module FPSound.CrashCourse.Rate where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (AFuture, tdl)
import WAGS.Lib.Tidal.Tidal (changeRate, make, onTag, parse_, s)

wag :: AFuture
wag = make 0.8
  { earth: s
      $ onTag "d0" (changeRate $ const 1.5)
      $ onTag "d1" (changeRate $ const 0.6)
      $ parse_ "bd:0 bd:0;d0 bd:0;d1"
  }

main :: Player
main = player (tdl wag)