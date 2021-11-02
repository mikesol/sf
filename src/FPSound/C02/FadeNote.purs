module FPSound.C02.FadeNote where

import Prelude

import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Pitch (c4)
import WAGS.Lib.Learn.Duration (breve)
import WAGS.Lib.Learn.Volume (Volume(..))
import WAGS.Lib.Learn.Note (note_)

fadeOut :: Number -> Number
fadeOut time = if time > 5.0 then 0.0 else 1.0 - (0.2 * time)

main :: Player
main = player (note_ (Volume fadeOut) breve c4)