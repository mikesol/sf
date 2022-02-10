module FPSound.CrashCourse.Sounds where

import Prelude

import Data.Tuple.Nested ((/\))
import Foreign.Object (fromFoldable)
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Tidal (make, s)
import WAGS.Lib.Tidal.Types (AFuture, BufferUrl(..))

wag :: AFuture
wag = make 4.0
  { earth: s "lowhit highhit"
  , sounds: fromFoldable $
      (map <<< map)
        ( BufferUrl
            <<< append "https://media.graphcms.com/"
        )
        [ "lowhit" /\ "I54aFAuRoq05CHlcK4aj"
        , "highhit" /\ "1fLcZIK9Twq8scW2Pv2G"
        ]
  }

main :: Player
main = player (tdl wag)