module FPSound.RhythmFunctor.Header where

import Prelude

import Data.FunctorWithIndex (mapWithIndex)
import Data.Lens (_Just, set)
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (AFuture, tdl)
import WAGS.Lib.Tidal.Tidal (lnr, make, parse_, s)
import WAGS.Lib.Sounds.Gamelan as Gamelan
import Data.Int (toNumber)

wag :: AFuture
wag =
  make 2.0
    { earth: s
        $ mapWithIndex
            ( \i ->
                set (_Just <<< lnr)
                  $ const
                  $ 1.0 + 0.1 * (toNumber (i `mod` 3))

            )
        $ parse_
            """
      BBPL1 BBPL2h BBPL2h BBPL3
      BBPL2h BBPL2h BBPL5 BBPL2h
      BBPL2h BBPL4 BBPL6 BBPL6
      BBPL3h BBPL2h BBPL4 BBPL2h
      """
    , sounds: Gamelan.sounds
    }

main :: Player
main = player $ tdl $ wag