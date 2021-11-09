module FPSound.RhythmFunctor.BirdsBirdsBirds where

import Prelude

import WAGS.Create.Optionals (delay, gain, highpass, loopBuf, ref, speaker)
import WAGS.Lib.Learn (Player, player, buffers, using)
import WAGS.Lib.Learn.Oscillator (lfo)
import WAGS.Run (SceneI(..))

mp3 :: String
mp3 = "https://freesound.org/data/previews/418/418104_7707368-lq.mp3"

main :: Player
main = player $
  using (buffers { loopy: mp3 })
    \(SceneI { time, world: { buffers: { loopy } } }) -> speaker
      { v0: gain 1.0
          { lp: loopBuf loopy
          , hp:
              highpass
                ( lfo { phase: 0.0, amp: 1000.0, freq: 0.2 }
                    time + 3000.0
                )
                $ gain 0.6 { del: delay 0.3 { v0: ref } }
          }
      }