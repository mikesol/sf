module FPSound.RhythmFunctor.LowFi where

import Prelude

import Data.Lens (traversed, set)
import Data.Newtype (unwrap)
import Data.Profunctor (lcmap)
import Math ((%))
import WAGS.Create.Optionals (highpass, pan)
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Learn.Oscillator (lfo)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Types (AFuture)
import WAGS.Lib.Tidal.FX (fx, goodbye, hello)
import WAGS.Lib.Tidal.Tidal (lnr, lnv, lvt, make, onTag, parse_, s)

m2 = 4.0 * 1.0 * 60.0 / 111.0 :: Number

wag :: AFuture
wag =
  make (m2 * 2.0)
    { earth: s
        $ set (traversed <<< traversed <<< lnr)
            ( lcmap unwrap \{ normalizedLittleCycleTime: t } ->
                1.0 + t * 0.1
            )
        $ parse_
            """tink:1;t0 tink:2;t1 tink:3;t2 tink:0;t3 tink:4;t4
    tink:2;t5 tink:3;t6 tink:1;t7 tink:2;t8 tink:0;t9 tink:3;t10 """
    , wind:
        map
          ( set lvt
              $ lcmap unwrap \{ clockTime } ->
                  let
                    mody = clockTime % (m2 * 2.0)
                  in
                    fx
                      $ goodbye
                      $ highpass (200.0 + mody * 100.0) hello
          ) $ s
          $ onTag "ph"
              ( set (traversed <<< lnr)
                  $ lcmap unwrap \{ normalizedSampleTime: t } ->
                      min 1.2 (1.0 + t * 0.3)
              )
          $ onTag "print"
              ( set (traversed <<< lnv)
                  $ lcmap unwrap \{ normalizedSampleTime: _ } -> 0.2
              )
          $ onTag "pk"
              ( set (traversed <<< lnr)
                  $ lcmap unwrap \{ normalizedSampleTime: t } ->
                      0.7 - t * 0.2
              )
          $ onTag "kt"
              ( set (traversed <<< lnr)
                  $ lcmap unwrap \{ normalizedSampleTime: t } ->
                      min 1.0 (0.6 + t * 0.8)
              )
          $ parse_
              """psr:3 ~ [~ chin*4] ~ ~ [psr:3;ph psr:3;ph ~ ] _ _
            , [~ ~ ~ <psr:1;print kurt:0;print> ] kurt:5;kt
            , ~ ~ pluck:1;pk ~ ~ ~ ~ ~ """
    , fire:
        map
          ( set lvt
              ( lcmap unwrap \{ clockTime } -> fx
                  ( goodbye $ pan
                      ( lfo { phase: 0.0, amp: 1.0, freq: 0.2 }
                          clockTime + 0.0
                      )
                      { myhp: highpass
                          ( lfo { phase: 0.0, amp: 2000.0, freq: 0.4 }
                              clockTime + 2000.0
                          )
                          hello
                      }
                  )
              )
          ) $ s "~ ~ ~ ~ ~ ~ speechless:2 ~"
    }

main :: Player
main = player $ tdl $ wag

