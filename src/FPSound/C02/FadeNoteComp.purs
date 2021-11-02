module FPSound.C02.FadeNoteComp where

import Prelude

import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Pitch (c4)
import WAGS.Lib.Learn.Duration (breve)
import WAGS.Lib.Learn.Volume (Volume(..))
import Wags.Learn.Oscillator (lfo)
import WAGS.Lib.Learn.Note (note_)

lfoIt :: Number -> Number
lfoIt = lfo { phase: 0.0, amp: 0.3, freq: 8.0 }

offsetIt :: Number -> Number
offsetIt = add 0.5

clipIt :: Number -> Number
clipIt = max 0.4 <<< min 0.6

main :: Player
main = player
  $ note_
      ( Volume $
          clipIt
            <<< offsetIt
            <<< lfoIt
      )
      breve
      c4
