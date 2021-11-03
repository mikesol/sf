module FPSound.NoteFunction.NoteDim where

import Prelude
import WAGS.Lib.Learn.Pitch

import Data.Newtype (unwrap, wrap)
import Math ((%), pi)
import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Duration (longest)
import WAGS.Lib.Learn.Note (note_)
import WAGS.Lib.Learn.Oscillator (lfo)
import WAGS.Lib.Learn.Volume (Volume(..))

type FofTime = Number -> Number

toPitch :: (Number -> Pitch ((->) Number)) -> Pitch ((->) Number)
toPitch = wrap <<< join <<< map unwrap

beat :: FofTime
beat = max 0.0 <<< lfo { phase: 0.5 * pi, amp: 0.75, freq: 8.0 }

chord :: Number -> Pitch ((->) Number)
chord t =
  let
    time = t % 1.0
    out
      | time < 0.25 = c4
      | time < 0.5 = eFlat4
      | time < 0.75 = fSharp4
      | otherwise = a4
  in
    out

transposition :: Number -> Pitch ((->) Number)
transposition t =
  let
    time = t % 6.0
    out
      | time < 1.0 = minorThird
      | time < 2.0 = augmentedFourth
      | time < 3.0 = majorSixth
      | time < 4.0 = octave
      | time < 5.0 = majorSixth
      | otherwise = augmentedFourth
  in
    out

main :: Player
main = player $
  note_
    (Volume beat)
    longest
    (toPitch (add <$> chord <*> transposition))