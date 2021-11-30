module FPSound.CrashCourse.Faster where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (AFuture, tdl)
import WAGS.Lib.Tidal.Tidal (make, s)

wag :: AFuture
wag = make 0.4 { earth: s "bd:0 notes:5 hh:0 chin:0" }

main :: Player
main = player (tdl wag)