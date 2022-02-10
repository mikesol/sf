module FPSound.CrashCourse.Pan where

import Prelude

import WAGS.Create.Optionals (pan)
import WAGS.Graph.Parameter (ff)
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Learn.Oscillator (lfo)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Types (AFuture)
import WAGS.Lib.Tidal.FX (fx, goodbye, hello)
import WAGS.Lib.Tidal.Tidal (addEffect, make, s)

wag :: AFuture
wag = make 4.0
  { earth:
      map
        ( addEffect
            ( fx
                <<< goodbye
                <<< flip pan hello
                <<< ff 0.1
                <<< pure
                <<< lfo
                  { phase: 0.0
                  , amp: 1.0
                  , freq: 1.0
                  }
                <<< _.clockTime
            )
        ) $ s "pad:1"
  }

main :: Player
main = player (tdl wag)