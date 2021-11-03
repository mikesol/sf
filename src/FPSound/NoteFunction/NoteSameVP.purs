module FPSound.NoteFunction.NoteSameVP where

import Prelude
import WAGS.Lib.Learn.Pitch
import Math (pi)
import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Duration (longest)
import WAGS.Lib.Learn.Note (note_)
import WAGS.Lib.Learn.Oscillator (lfo)
import WAGS.Lib.Learn.Volume (Volume(..))
import WAGS.Math (calcSlope)

type FofTime = Number -> Number

driver1 :: FofTime
driver1 = lfo { phase: 0.0, amp: 2.0, freq: 1.0 }

freq1 :: FofTime
freq1 = lfo { phase: 0.0, amp: 1.0, freq: 2.0 }

driver2 :: FofTime
driver2 = lfo { phase: 0.0, amp: 1.5, freq: 0.25 }

freq2 :: FofTime
freq2 = lfo { phase: pi, amp: 1.0, freq: 1.0 }

base :: FofTime
base = add <$> (freq1 <<< driver1) <*> (freq2 <<< driver2)

vol :: FofTime
vol = min 1.0 <<< mul 0.6 <<< max 0.0 <<< base

pitch :: FofTime
pitch = calcSlope (-1.0) 220.0 1.0 800.0 <<< base

main :: Player
main = player (note_ (Volume vol) longest (Pitch pitch))