module FPSound.RhythmFunctor.Omit where

import Prelude
import WAGS.Lib.Learn.Pitch
import WAGS.Lib.Learn.Volume

import Data.Map as Map
import Data.Maybe (fromMaybe)
import Data.NonEmpty ((:|))
import Data.Lens (over)
import Data.Lens.Iso.Newtype (unto)
import Data.Tuple.Nested ((/\))
import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Note (noteFromPitch_, Note(..))
import WAGS.Lib.Learn.Duration (semiquaver)
import WAGS.Lib.Learn.Transpose (transpose)
import WAGS.Lib.Stream (cycle)

somePitches = c4 :| [ d4, e4, fSharp4, gSharp4, bFlat4, c5 ]

asNotes = map noteFromPitch_

upASemitone = map (transpose semitone)

faster = map (over (unto Note) (_ { duration = semiquaver }))

terraced = map
  $ \(Note n@{ pitch }) -> Note $ n
      { volume = fromMaybe mezzoPiano
          $ Map.lookup pitch
          $ Map.fromFoldable
              [ c4 /\ piano
              , d4 /\ mezzoForte
              , e4 /\ fortissimo
              , fSharp4 /\ piano
              , gSharp4 /\ mezzoForte
              , bFlat4 /\ fortissimo
              , c5 /\ mezzoForte
              ]
      }

main :: Player
main = player
  $ cycle
  $ terraced
  $ faster
  $ upASemitone
  $ asNotes
  $ somePitches