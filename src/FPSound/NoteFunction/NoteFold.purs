module FPSound.NoteFunction.NoteFold where

import Prelude
import WAGS.Lib.Learn.Pitch

import Data.Foldable (foldl)
import Math (pi, pow)
import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Duration (longest)
import WAGS.Lib.Learn.Note (note_)
import WAGS.Lib.Learn.Oscillator (lfo)
import WAGS.Lib.Learn.Volume (Volume(..))

lfo1It :: Number -> Number
lfo1It = lfo { phase: 0.0, amp: 0.3, freq: 4.0 }

lfo2It :: Number -> Number
lfo2It = lfo { phase: pi, amp: 2.0, freq: 8.0 }

lfo3It :: Number -> Number
lfo3It = lfo { phase: pi, amp: 2.0, freq: 16.0 }

squareRootIt :: Number -> Number
squareRootIt = flip pow 0.5

squareIt :: Number -> Number
squareIt = flip pow 0.5

clipIt :: Number -> Number
clipIt = max 0.0 <<< min 1.0

main :: Player
main = player
  $ note_
      ( Volume $
          foldl (<<<) identity
            [ clipIt
            , lfo3It
            , squareRootIt
            , lfo2It
            , squareIt
            , lfo1It
            ]
      )
      longest
      c4
