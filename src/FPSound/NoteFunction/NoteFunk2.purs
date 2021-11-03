module FPSound.NoteFunction.NoteFunk2 where

import Prelude

import Math (pi)
import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Pitch
import WAGS.Lib.Learn.Duration (longest)
import WAGS.Lib.Learn.Volume (Volume(..))
import WAGS.Lib.Learn.Note (note_)
import WAGS.Lib.Learn.Oscillator (lfo)

type FofTime = Number -> Number

driver1 :: FofTime
driver1 = lfo { phase: 0.0, amp: 2.0, freq: 1.0 }

freq1 :: FofTime
freq1 = lfo { phase: 0.0, amp: 1.0, freq: 2.0 }

driver2 :: FofTime
driver2 = lfo { phase: 0.0, amp: 1.5, freq: 0.25 }

freq2 :: FofTime
freq2 = lfo { phase: pi, amp: 1.0, freq: 1.0 }

signal :: FofTime
signal = min 1.0 <<< mul 0.6 <<< max 0.0 <<<
  (add <$> (freq1 <<< driver1) <*> (freq2 <<< driver2))

main :: Player
main = player (note_ (Volume signal) longest c4)