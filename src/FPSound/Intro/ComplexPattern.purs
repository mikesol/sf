module FPSound.Intro.ComplexPattern where

import Prelude
import WAGS.Lib.Learn.Duration
import WAGS.Lib.Learn.Pitch
import WAGS.Lib.Learn.Volume
import Control.Apply (lift2)
import Control.Comonad (extract)
import Control.Comonad.Cofree (Cofree, deferCofree)
import Control.Comonad.Cofree.Class (unwrapCofree)
import Data.Identity (Identity(..))
import Data.Newtype (unwrap)
import Data.NonEmpty ((:|))
import Data.Tuple.Nested ((/\))
import WAGS.Lib.Cofree (deferCombine)
import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Note (Note(..), note_)
import WAGS.Lib.Learn.Tempo (allegro)
import WAGS.Lib.Stream (cycle)

volumes = cycle $ forte :|
  [ mezzoPiano
  , forte
  , mezzoPiano
  , forte
  , mezzoPiano
  , mezzoForte
  ]

pitches = cycle $ c4 :|
  [ g4, f4, eFlat4, bFlat4, d5, eFlat4, bFlat4, d5, f5, d5, bFlat4, eFlat4, f4, g4 ]

rhythms = cycle $ map allegro $ crochet :|
  [ quaver
  , semiquaver
  , quaver
  , semiquaver
  , quaver
  , semiquaver
  ]

zap = deferCombine ($) lift2

notes = note_ `map` volumes `zap` rhythms `zap` pitches

main :: Player
main = player notes