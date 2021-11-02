module FPSound.C02.FadeNote where

import Prelude

import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Pitch (c4)
import WAGS.Lib.Learn.Duration (crochet)
import WAGS.Lib.Learn.Volume (Volume(..))
import WAGS.Lib.Learn.Note (note_)

fadeOut :: Number -> Number
fadeOut time = if time > 10.0 then 0.0 else 1.0 - (0.1 * time)

main :: Player
main = player (note_ (Volume fadeOut) crochet c4)