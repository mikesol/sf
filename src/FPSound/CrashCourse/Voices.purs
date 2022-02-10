module FPSound.CrashCourse.Voices where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (make, s)
import WAGS.Lib.Tidal.Types (AFuture)

wag :: AFuture
wag = make 0.8
  { earth: s "pluck:3 pluck:5 pluck:10 pluck:12 pluck:16"
   , wind: s "[bd,hh] hh [clap,hh] hh"
  }

main :: Player
main = player (tdl wag)