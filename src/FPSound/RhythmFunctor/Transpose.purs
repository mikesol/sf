module FPSound.RhythmFunctor.Transpose where

import Prelude
import WAGS.Lib.Learn.Pitch
import Data.NonEmpty ((:|))
import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Transpose (transpose)
import WAGS.Lib.Stream (cycle)

somePitches = c4 :| [ d4, e4, fSharp4, gSharp4, bFlat4, c5 ]

functorToTheRescue =
  map (transpose semitone) somePitches

main :: Player
main = player $ cycle functorToTheRescue