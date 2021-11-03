module FPSound.NoteFunction.NoteFunk where

import Prelude

import Math ((%))
import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Pitch
import WAGS.Lib.Learn.Duration (longest)
import WAGS.Lib.Learn.Volume (Volume(..))
import WAGS.Lib.Learn.Note (note_)
import WAGS.Lib.Learn.Oscillator (lfo)

bending :: Number -> Number
bending = lfo { phase: 0.0, amp: 0.25, freq: 8.0 }

guarded :: Number -> Number
guarded t =
  let
    time = t % 1.0
    out
      | time < 0.125 = 0.3
      | time < 0.25 = 0.0
      | time < 0.5 = 0.6
      | time < 0.625 = 0.0
      | time < 0.875 = 0.3
      | otherwise = 0.0
  in
    out

version1 :: Number -> Number
version1 time = add (bending time) (guarded time)

version2 :: Number -> Number
version2 = add <$> bending <*> guarded

main :: Player
main = player (note_ (Volume version2) longest c4)