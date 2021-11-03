module FPSound.NoteFunction.NoteFadeEta where

import Prelude

import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Pitch
import WAGS.Lib.Learn.Duration (longest)
import WAGS.Lib.Learn.Volume (Volume(..))
import WAGS.Lib.Learn.Note (note_)
import WAGS.Math (calcSlope)
import WAGS.Lib.Tidal.Tidal (betwixt)

fadeOut :: Number -> Number
fadeOut = betwixt 0.0 1.0 <<< calcSlope 0.0 1.0 5.0 0.0

main :: Player
main = player (note_ (Volume fadeOut) longest c4)