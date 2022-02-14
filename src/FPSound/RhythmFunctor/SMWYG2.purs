module FPSound.RhythmFunctor.SMWYG2 where

import Prelude

import Data.Array ((..))
import Data.Lens (set, traversed)
import Data.Newtype (unwrap)
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\))
import Data.Variant.Maybe (Maybe)
import Foreign.Object as Object
import WAGS.Create.Optionals (gain, highpass, lowpass)
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Learn.Oscillator (lfo)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Cycle (Cycle, cycleFromSample)
import WAGS.Lib.Tidal.FX (fx, goodbye, hello)
import WAGS.Lib.Tidal.Tidal (addEffect, betwixt, i, lnbo, lnv, make, s)
import WAGS.Lib.Tidal.Types (AFuture, BufferUrl(..), Note, Sample(..))
import WAGS.Math (calcSlope)

smwyg :: forall e. Cycle (Maybe (Note e))
smwyg = cycleFromSample (Sample "smwyg")

wag :: AFuture
wag =
  make 10.0
    { earth:
        map
          ( addEffect \{ clockTime } -> fx
              $ goodbye
              $ gain 1.0
                  { hp: highpass
                      ( lfo { phase: 0.0, amp: 1000.0, freq: 1.0 }
                          clockTime + 2000.0
                      )
                      hello
                  }

          ) $ s
          $ set (traversed <<< traversed <<< lnv)
              ( lcmap (unwrap >>> _.sampleTime) $
                  betwixt 0.0 1.0 <<< calcSlope 0.0 1.0 0.4 0.0
              )
          $ set (traversed <<< traversed <<< lnbo)
              ( lcmap unwrap
                  \{ bigCycleTime, initialEntropy } ->
                    0.6 * bigCycleTime + initialEntropy
              )
          $ i smwyg (map (const smwyg) (0 .. 100))
    , wind:
        map
          ( addEffect \{ clockTime } -> fx
              $ goodbye
              $ gain 1.0
                  { hp: lowpass
                      ( lfo { phase: 0.0, amp: 950.0, freq: 0.12 }
                          clockTime + 1000.0
                      )
                      hello
                  }

          ) $ s
          $ set (traversed <<< traversed <<< lnv)
              ( lcmap (unwrap >>> _.sampleTime) $
                  betwixt 0.0 1.0 <<< calcSlope 0.0 1.0 0.4 0.0
              )
          $ set (traversed <<< traversed <<< lnbo)
              ( lcmap unwrap
                  \{ bigCycleTime, initialEntropy } ->
                    0.9 * bigCycleTime + initialEntropy
              )
          $ i smwyg (map (const smwyg) (0 .. 60))
    , sounds: Object.fromFoldable
        [ "smwyg"
            /\ BufferUrl "https://media.graphcms.com/B98L69ZNRWOV86ZHO7K9"
        ]
    }

main :: Player
main = player $ tdl $ wag