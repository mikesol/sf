module FPSound.CrashCourse.Highpass where

import Prelude

import WAGS.Create.Optionals (highpass)
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Learn.Oscillator (lfo)
import WAGS.Lib.Tidal (AFuture, tdl)
import WAGS.Lib.Tidal.FX (fx, goodbye, hello)
import WAGS.Lib.Tidal.Tidal (addEffect, make, s)

wag :: AFuture
wag = make 4.0
  { earth:
      map
        ( addEffect
            ( fx
                <<< goodbye
                <<< flip highpass hello
                <<< lfo
                  { phase: 0.0
                  , amp: 2500.0
                  , freq: 2.0
                  }
                <<< add 2750.0
                <<< _.clockTime
            )
        ) $ s "pad:1"
  }

main :: Player
main = player (tdl wag)