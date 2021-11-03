module FPSound.NoteFunction.NoteOctaves where

import Prelude

import Math ((%))
import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Pitch
import WAGS.Lib.Learn.Duration (longest)
import WAGS.Lib.Learn.Volume (mezzoForte)
import WAGS.Lib.Learn.Note (note_)

jumpy :: Number -> Number
jumpy t =
  let
    time = t % 1.0
    out
      | time < 0.25 = 220.0
      | time < 0.5 = 440.0
      | time < 0.75 = 880.0
      | otherwise = 1760.0
  in
    out

main :: Player
main = player (note_ mezzoForte longest (Pitch jumpy))