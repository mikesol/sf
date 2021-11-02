module FPSound.C02.FadeNoteLFO where

import Prelude

import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Pitch (c4)
import WAGS.Lib.Learn.Duration (breve)
import WAGS.Lib.Learn.Volume (Volume(..))
import Wags.Learn.Oscillator (lfo)
import WAGS.Lib.Learn.Note (note_)

bending :: Number -> Number
bending = add 0.3 <<< lfo { phase: 0.0, amp: 0.3, freq: 2.0 }

main :: Player
main = player (note_ (Volume bending) breve c4)