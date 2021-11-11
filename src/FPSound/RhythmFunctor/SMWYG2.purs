module FPSound.RhythmFunctor.SMWYG2 where

import Prelude

import Data.Array ((..))
import Data.Lens (set, traversed, _Just)
import Data.Map as Map
import Data.Maybe (Maybe)
import Data.Newtype (unwrap)
import Data.Profunctor (lcmap)
import Data.Tuple.Nested ((/\))
import WAGS.Create.Optionals (gain, highpass, lowpass)
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Learn.Oscillator (lfo)
import WAGS.Lib.Tidal (AFuture, tdl)
import WAGS.Lib.Tidal.Cycle (Cycle, noteFromSample)
import WAGS.Lib.Tidal.FX (fx, goodbye, hello)
import WAGS.Lib.Tidal.Samples (sampleTime)
import WAGS.Lib.Tidal.Tidal (betwixt, i_, lnbo, lnv, lvt, make, s)
import WAGS.Lib.Tidal.Types (BufferUrl(..), Note, Sample(..))
import WAGS.Math (calcSlope)

smwyg :: forall e. Cycle (Maybe (Note e))
smwyg = noteFromSample (Sample "smwyg")

wag :: AFuture
wag =
  make 10.0
    { earth:
        map
          ( set lvt
              $ lcmap unwrap \{ clockTime } -> fx
                  $ goodbye
                  $ gain 1.0
                      { hp: highpass
                          ( lfo { phase: 0.0, amp: 1000.0, freq: 1.0 }
                              clockTime + 2000.0
                          )
                          hello
                      }

          ) $ s
          $ set (traversed <<< _Just <<< lnv)
              ( lcmap sampleTime $
                  betwixt 0.0 1.0 <<< calcSlope 0.0 1.0 0.4 0.0
              )
          $ set (traversed <<< _Just <<< lnbo)
              ( lcmap unwrap
                  \{ bigCycleTime, initialEntropy } ->
                    0.6 * bigCycleTime + initialEntropy
              )
          $ i_ smwyg (map (const smwyg) (0 .. 100))
    , wind:
        map
          ( set lvt
              $ lcmap unwrap \{ clockTime } -> fx
                  $ goodbye
                  $ gain 1.0
                      { hp: lowpass
                          ( lfo { phase: 0.0, amp: 950.0, freq: 0.12 }
                              clockTime + 1000.0
                          )
                          hello
                      }

          ) $ s
          $ set (traversed <<< _Just <<< lnv)
              ( lcmap sampleTime $
                  betwixt 0.0 1.0 <<< calcSlope 0.0 1.0 0.4 0.0
              )
          $ set (traversed <<< _Just <<< lnbo)
              ( lcmap unwrap
                  \{ bigCycleTime, initialEntropy } ->
                    0.9 * bigCycleTime + initialEntropy
              )
          $ i_ smwyg (map (const smwyg) (0 .. 60))
    , sounds: Map.fromFoldable
        [ Sample "smwyg"
            /\ BufferUrl "https://media.graphcms.com/B98L69ZNRWOV86ZHO7K9"
        ]
    }

main :: Player
main = player $ tdl $ wag