module FPSound.NoteFunction.TimbrePlus where

import Prelude

import WAGS.Create.Optionals (gain, sinOsc, speaker)
import WAGS.Lib.Learn (player, Player)
import WAGS.Lib.Learn.Oscillator (lfo)

fundamental = 220.0 :: Number

main :: Player
main = player
  $ \time -> speaker
      { o0: gain
          (0.2 +
            lfo { phase: 0.0, amp: 0.1, freq: 0.2 } time)
          (sinOsc (fundamental * 1.0))
      , o1: gain
          (0.04 +
            lfo { phase: 0.0, amp: 0.02, freq: 0.3 } time)
          (sinOsc (fundamental * 2.0))
      , o2: gain
          (0.15 +
            lfo { phase: 0.0, amp: 0.1, freq: 0.4 } time)
          (sinOsc (fundamental * 3.0))
      , o3: gain
          (0.05 +
            lfo { phase: 0.0, amp: 0.04, freq: 0.5 } time)
          (sinOsc (fundamental * 4.0))
      , o4: gain
          (0.1 +
            lfo { phase: 0.0, amp: 0.09, freq: 0.6 } time)
          (sinOsc (fundamental * 5.0))
      , o5: gain
          (0.03 +
            lfo { phase: 0.0, amp: 0.02, freq: 0.7 } time)
          (sinOsc (fundamental * 6.0))
      }
