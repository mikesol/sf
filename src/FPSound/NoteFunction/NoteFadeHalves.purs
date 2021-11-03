module FPSound.NoteFunction.NoteFadeHalves where

import Prelude

import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Pitch
import WAGS.Lib.Learn.Duration (longest)
import WAGS.Lib.Learn.Volume (Volume(..))
import WAGS.Lib.Learn.Note (note_)
import WAGS.Math (calcSlope)
import WAGS.Lib.Tidal.Tidal (betwixt)

firstHalf :: Number -> Number
firstHalf = betwixt 0.0 0.5 <<< calcSlope 0.0 0.0 5.0 0.5

secondHalf :: Number -> Number
secondHalf = betwixt 0.5 1.0 <<< calcSlope 0.0 0.5 5.0 1.0

main :: Player
main = player (note_ (Volume firstHalf) longest c4)