module FPSound.CrashCourse.Sines where

import Prelude

import WAGS.Create.Optionals (gain, sinOsc)
import WAGS.Graph.Parameter (AudioParameter, ff)
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Learn.Oscillator (lfo)
import WAGS.Lib.Tidal (AFuture, tdl)
import WAGS.Lib.Tidal.FX (fx, goodbye, hello)
import WAGS.Lib.Tidal.Tidal (addEffect, make, s)

myLFO
  :: Number
  -> Number
  -> Number
  -> Number
  -> Number
  -> AudioParameter
myLFO phase freq amp clockTime offset =
  ff 0.1 $ pure $
    lfo
      { phase
      , freq
      , amp: amp * 0.5
      }
      clockTime + (offset * 0.5)

wag :: AFuture
wag = make 4.0
  { earth:
      map
        ( addEffect
            ( \{ clockTime: ct } -> fx
                $ goodbye
                $ gain 1.0
                    { wave0: gain
                        (myLFO 0.0 2.0 0.3 ct 0.4)
                        (sinOsc 220.0)
                    , wave1: gain
                        (myLFO 0.1 4.0 0.1 ct 0.15)
                        (sinOsc 440.0)
                    , wave2: gain
                        (myLFO 2.0 6.0 0.25 ct 0.3)
                        (sinOsc 660.0)
                    , wave3: gain
                        (myLFO 2.0 2.0 0.05 ct 0.12)
                        (sinOsc 880.0)
                    , wave4: gain
                        (myLFO 0.0 16.0 0.03 ct 0.09)
                        (sinOsc 1100.0)
                    , original: hello
                    }

            )
        ) $ s "bd"
  }

main :: Player
main = player (tdl wag)