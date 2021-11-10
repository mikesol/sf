module FPSound.RhythmFunctor.Speed where

import Prelude
import WAGS.Lib.Learn.Pitch

import Data.Lens (over)
import Data.Lens.Iso.Newtype (unto)
import Data.NonEmpty ((:|))
import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Note (Note(..), noteFromPitch_)
import WAGS.Lib.Learn.Duration (semiquaver)
import WAGS.Lib.Learn.Transpose (transpose)
import WAGS.Lib.Stream (cycle)

somePitches = c4 :| [ d4, e4, fSharp4, gSharp4, bFlat4, c5 ]

asNotes = map noteFromPitch_

upASemitone = map (transpose semitone)

faster = map (over (unto Note) (_ { duration = semiquaver }))

main :: Player
main = player
  $ cycle
  $ faster
  $ upASemitone
  $ asNotes
  $ somePitches