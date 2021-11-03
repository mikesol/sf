module FPSound.NoteFunction.Timbre where

import Prelude

import WAGS.Create.Optionals (gain, sinOsc, speaker)
import WAGS.Lib.Learn (player, Player)

fundamental = 220.0 :: Number

main :: Player
main = player
  $ speaker
      { o0: gain 0.2 (sinOsc (fundamental * 1.0))
      , o1: gain 0.04 (sinOsc (fundamental * 2.0))
      , o2: gain 0.15 (sinOsc (fundamental * 3.0))
      , o3: gain 0.02 (sinOsc (fundamental * 4.0))
      , o4: gain 0.1 (sinOsc (fundamental * 5.0))
      , o5: gain 0.01 (sinOsc (fundamental * 6.0))
      }
