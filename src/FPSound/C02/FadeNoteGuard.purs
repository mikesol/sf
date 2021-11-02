module FPSound.C02.FadeNoteGuard where

import Prelude

import Math ((%))
import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Pitch (c4)
import WAGS.Lib.Learn.Duration (breve)
import WAGS.Lib.Learn.Volume (Volume(..))
import WAGS.Lib.Learn.Note (note_)

guarded :: Number -> Number
guarded t =
  let
    time = t % 2.0
    out
      | time < 0.125 = 0.1
      | time < 0.25 = 0.0
      | time < 0.5 = 0.8
      | time < 0.625 = 0.0
      | time < 0.875 = 0.8
      | time < 1.0 = 0.1
      | time < 1.25 = 0.0
      | time < 1.5 = 0.5
      | time < 1.75 = 0.0
      | otherwise = 0.5
  in
    out

main :: Player
main = player (note_ (Volume guarded) breve c4)