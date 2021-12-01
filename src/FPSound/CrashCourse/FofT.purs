module FPSound.CrashCourse.FofT where

import Prelude

import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Learn.Oscillator (lfo)
import WAGS.Lib.Tidal (AFuture, tdl)
import WAGS.Lib.Tidal.Tidal as T

wag :: AFuture
wag = T.make 4.0
  { earth: T.s
      $ T.onTag "pad"
          ( T.changeRate
              ( _.sampleTime
                  >>> mul 1.3
                  >>> add 1.0
                  >>> min 1.2
              )
          )
      $ map
          ( T.changeVolume
              ( _.clockTime
                  >>> lfo
                    { phase: 0.0
                    , freq: 4.0
                    , amp: 0.4
                    }
                  >>> add 0.4
              )
          )
      $ T.parse_ "pad:2 pad:2;pad"
  }

main :: Player
main = player (tdl wag)