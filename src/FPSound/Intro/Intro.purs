module FPSound.Intro.Intro where

import Prelude

import Data.Lens (traversed, set)
import Data.Newtype (unwrap)
import Data.Tuple.Nested ((/\))
import Foreign.Object as Object
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (tdl)
import WAGS.Lib.Tidal.Types (AFuture)
import WAGS.Lib.Tidal.Tidal (lnr, lnv, make, onTag, parse, s)
import WAGS.Lib.Tidal.Types (BufferUrl(..))

wag :: AFuture
wag =
  make (4.0 * 1.0 * 60.0 / 111.0)
    { earth: s
        """bass:1 msg hh ~ [hh:6 bass:0] msg:2 hh ~ ,
    ~ chin*4 ~ ~ ~ tech:0*2 ~ ~ ,
    ~ ~ hh:2 ~ ~ newnotes [~ newnotes:2] ~  ,
    ~ ~ ~ ~ hh:7 ~ ~ tech:2*4 ,
    ~ ~ ~ ~ ~ ~ ~ chin:1*2 ,
    pad:3"""
    , wind: s
        $ onTag "comp"
            ( set (traversed <<< lnv)
                $ (if _ then 1.0 else 0.0)
                    <<< flip (<) 0.9
                    <<< _.normalizedLittleCycleTime
                    <<< unwrap
            )
        $ onTag "comp"
            ( set (traversed <<< lnr)
                $ add 0.95
                    <<< mul 0.1
                    <<< _.initialEntropy
                    <<< unwrap
            )
        $ parse "wdm:1;comp"
    , sounds: map BufferUrl $ Object.fromFoldable $
        [ "wdm:0" /\ "https://freesound.org/data/previews/332/332741_34095-lq.mp3"
        , "wdm:1" /\ "https://freesound.org/data/previews/332/332740_34095-hq.mp3"
        ]
    }

main :: Player
main = player $ tdl $ wag