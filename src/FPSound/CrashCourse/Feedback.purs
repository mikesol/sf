module FPSound.CrashCourse.Feedback where

import Prelude

import WAGS.Create.Optionals (delay, gain, highpass, ref)
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (AFuture, tdl)
import WAGS.Lib.Tidal.FX (fx, goodbye, hello)
import WAGS.Lib.Tidal.Tidal (addEffect, make, s)

wag :: AFuture
wag = make 1.0
  { earth:
      map
        ( addEffect
            ( const $
                fx
                  ( goodbye $ gain 1.0
                      { mymix: gain 1.0
                          { ipt: highpass 2000.0 hello
                          , fback: gain 0.8
                              { del:
                                  delay 0.1 { mymix: ref }
                              }
                          }
                      }
                  )
            )
        )
        $ s "bd"
  }

main :: Player
main = player (tdl wag)