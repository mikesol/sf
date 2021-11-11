module FPSound.RhythmFunctor.ManyMaps where

import Prelude
import WAGS.Lib.Learn.Pitch

import Data.Function (on)
import Control.Apply (lift2)
import Data.Newtype (unwrap)
import Math ((%))
import Data.NonEmpty ((:|))
import WAGS.Lib.Cofree (ana, deferCombine)
import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Transpose (transpose)
import WAGS.Lib.Stream (cycle)

upAWholeTone = map (transpose wholeTone)

-- upAWholeTone used on NonEmpty Array
stream1 = cycle $ upAWholeTone $ c4 :| [ d4, e4, fSharp4, gSharp4, bFlat4, c5 ]

ite = if _ then _ else _

infixr 3 ite as ?

-- upAWholeTone used on Cofree Identity
stream2 = upAWholeTone $ map _.note $ ana
  ( \{ note, rising } ->
      note >= c5
        ? { note: bFlat4, rising: false }
        $ note <= c4
        ? { note: d4, rising: true }
        $ { note: (rising ? add $ sub) note wholeTone
          , rising
          }
  )
  ({ note: c4, rising: true })

-- merge the two
alter = deferCombine
  ( on
      (\a b -> Pitch (flip (%) 6.0 >>> (>) 3.0 >>> if _ then a else b))
      (unwrap <<< unwrap)
  )
  lift2
  stream1
  stream2

main :: Player
main = player $ alter
