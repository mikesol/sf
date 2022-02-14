module FPSound.RhythmFunctor.RhythmSegundo where

import Prelude

import Data.Lens (set, traversed)
import Data.Newtype (unwrap)
import Data.Profunctor (lcmap)
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (betwixt, changeVolume, lnv, make, onTag, parse, s)
import WAGS.Lib.Tidal.Types (AFuture)
import WAGS.Math (calcSlope)

m2 = 4.0 * 1.0 * 60.0 / 111.0 :: Number

fadeDown = lcmap (unwrap >>> _.sampleTime)
  (betwixt 0.0 1.0 <<< calcSlope 0.4 1.0 1.2 0.0)

wag :: AFuture
wag =
  make (m2 * 4.0)
    { earth: s
        $ set
            (traversed <<< traversed <<< lnv)
            fadeDown
        $ parse "tabla:23 tabla2:21  tabla2:28 tabla2:41"
    , wind: s
        """~ [tabla:3 tabla2:37] ~ tabla2:11   
  ~ tabla:3 ~ tabla2:40 
  ~ tabla:3 ~ ~ 
  ~ tabla:3 ~ tabla2:31"""
    , fire: s
        $ onTag "str"
            ( changeVolume
                ( _.sampleTime
                    >>> betwixt 0.0 1.0
                    <<< sub 1.0
                    <<< mul 0.2
                )
            )
        $ parse
            """~ [chin*4 lighter] ~ ~ 
    ~ [lighter:4 lighter:3 ] ~ [~ lighter:6]
    ~ ~ ~ [~ lighter:13]
    ~ ~ ~ [~ lighter:12] ,
      ~ sitar:3;str ~ ~
      ~ ~ ~ ~
      sitar:4;str  ~ ~
      ~ ~ ~ ~ ,
      ~ tink ~ ~   ~ tink ~ ~
      ~ tink ~ ~    ~ tink ~ ~ 
    """
    }

main :: Player
main = player $ tdl $ wag