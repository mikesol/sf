module FPSound.CrashCourse.Silence where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (AFuture, tdl)
import WAGS.Lib.Tidal.Tidal (make, s)

wag :: AFuture
wag = make 0.8 { earth: s "bd:0 notes:5 ~ chin:0" }

main :: Player
main = player (tdl wag)