module FPSound.CrashCourse.Single where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Types (AFuture)
import WAGS.Lib.Tidal.Tidal (make, s)

wag :: AFuture
wag = make 0.8 { earth: s "hh:0" }

main :: Player
main = player (tdl wag)