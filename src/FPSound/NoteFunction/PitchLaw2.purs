module FPSound.NoteFunction.PitchLaw2 where

import Prelude
import WAGS.Lib.Learn.Pitch

import Data.Lens (view, over, _1, _2)
import Data.Array.NonEmpty (fromNonEmpty)
import Data.FunctorWithIndex (mapWithIndex)
import Data.Int (toNumber)
import Data.Function (on)
import Data.List (List(..), sortBy, length, (:))
import Data.Newtype (unwrap, wrap)
import Data.NonEmpty ((:|))
import Data.Profunctor (dimap)
import Data.Traversable (sequence)
import Data.Tuple.Nested (type (/\), (/\))
import Data.Unfoldable (replicate)
import Math ((%))
import Test.QuickCheck (mkSeed)
import Test.QuickCheck.Gen (Gen, elements, evalGen)
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
beat = max 0.0 <<< lfo { phase: 0.0, amp: 0.75, freq: 8.0 }

aMult :: Gen PitchI
aMult = elements $ fromNonEmpty $ semitone :| [ wholeTone, minorThird, majorThird ]

aPitch :: Gen PitchI
aPitch = elements $ fromNonEmpty
  $ c0 :| [ cSharp0, d0, eFlat0, e0, f0, fSharp0, g0, aFlat0, a0, bFlat0, b0 ]

law2 :: Gen (PitchI /\ PitchI)
law2 = do
  a <- aMult
  b <- aPitch
  c <- aPitch
  pure $ (a * (b + c)) /\ (a * b + a * c)

bigGuard :: List (Number /\ PitchI) -> PitchI -> Number -> PitchI
bigGuard Nil default _ = default
bigGuard ((a /\ b) : c) default time
  | time < a = b
  | otherwise = bigGuard c default time

gap = 0.25 :: Number

pitches :: List (Number /\ PitchI)
pitches = sortBy (compare `on` view _1) (left <> right)
  where
  orig = evalGen
    (sequence $ replicate 100 law2)
    ({ newSeed: mkSeed 0, size: 10 })
  mapped x f = map (over _1 x)
    $ mapWithIndex
        (dimap ((/\) <<< toNumber) ((map <<< map) (view f)) ($))
        orig
  left = mapped (mul gap <<< mul 2.0) _1
  right = mapped (mul gap <<< add 1.0 <<< mul 2.0) _2

main :: Player
main = player
  $ note_ (Volume beat) longest
  $ toPitch
  $ compose (bigGuard pitches c4)
      (flip (%) (toNumber (length pitches) * gap))