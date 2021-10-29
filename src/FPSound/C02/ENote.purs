module FPSound.C02.ENote where

import Prelude

import Data.NonEmpty ((:|))
import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Note (accelerando, noteFromPitch_, repeat, seq)
import WAGS.Lib.Learn.Pitch (c4, d4, e4, fSharp4, gSharp4, bFlat4, c5)


main :: Player
main =
  player
    $ repeat
    $ accelerando
    $ seq
    $ map noteFromPitch_
    $ c4 :| [ d4, e4, fSharp4, gSharp4, bFlat4, c5, bFlat4, gSharp4, fSharp4, e4, d4, c4 ]