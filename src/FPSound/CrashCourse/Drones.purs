module FPSound.CrashCourse.Drones where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (AFuture, tdl)
import WAGS.Lib.Tidal.Tidal (drone, make, s)

wag :: AFuture
wag = make 5.0
  { earth: s "birds:0 birds:4"
  , air: drone "padlong:0"
  }

main :: Player
main = player (tdl wag)