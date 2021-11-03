module FPSound.NoteFunction.NoteLFO where

import Prelude

import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Pitch
import WAGS.Lib.Learn.Duration (longest)
import WAGS.Lib.Learn.Volume (Volume(..))
import WAGS.Lib.Learn.Oscillator (lfo)
import WAGS.Lib.Learn.Note (note_)

bending :: Number -> Number
bending = add 0.3 <<< lfo { phase: 0.0, amp: 0.3, freq: 8.0 }

main :: Player
main = player (note_ (Volume bending) longest c4)