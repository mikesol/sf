module FPSound.NoteFunction.Bach where

import Prelude
import WAGS.Lib.Learn.Pitch

import Data.FunctorWithIndex (mapWithIndex)
import Data.Int (toNumber)
import Data.List (List(..), length, (:))
import Data.Newtype (unwrap, wrap)
import Data.Profunctor (lcmap)
import Data.Tuple.Nested (type (/\), (/\))
import Math ((%), pi)
import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Duration (longest)
import WAGS.Lib.Learn.Note (note_)
import WAGS.Lib.Learn.Oscillator (lfo)
import WAGS.Lib.Learn.Volume (Volume(..))

type PitchI = Pitch ((->) Number)
type FofTime = Number -> Number

toPitch :: (Number -> Pitch ((->) Number)) -> Pitch ((->) Number)
toPitch = wrap <<< join <<< map unwrap

beat :: FofTime
beat = max 0.0 <<< lfo { phase: pi, amp: 0.75, freq: 2.0 / gap }

bigGuard :: List (Number /\ PitchI) -> PitchI -> Number -> PitchI
bigGuard Nil default _ = default
bigGuard ((a /\ b) : c) default time
  | time < a = b
  | otherwise = bigGuard c default time

gap = 0.3 :: Number

pitches :: List (Number /\ PitchI)
pitches = mapWithIndex
  (lcmap ((/\) <<< add gap <<< mul gap <<< toNumber) ($)) $
  c4 : e4 : g4 : c5 : e5 : g4 : c5 : e5 :
  c4 : e4 : g4 : c5 : e5 : g4 : c5 : e5 :
  c4 : d4 : a4 : d5 : f5 : a4 : d5 : f5 :
  c4 : d4 : a4 : d5 : f5 : a4 : d5 : f5 :        
  b3 : d4 : g4 : d5 : f5 : g4 : d5 : f5 :
  b3 : d4 : g4 : d5 : f5 : g4 : d5 : f5 :        
  c4 : e4 : g4 : c5 : e5 : g4 : c5 : e5 :
  c4 : e4 : g4 : c5 : e5 : g4 : c5 : e5 : Nil

main :: Player
main = player
  $ note_ (Volume beat) longest
  $ toPitch
  $ compose (bigGuard pitches c4)
      (flip (%) (toNumber (length pitches) * gap))