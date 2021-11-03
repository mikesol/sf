module FPSound.Intro.Intro where

import Prelude

import Data.Lens (_Just, set)
import Data.Map as Map
import Data.Newtype (unwrap)
import Data.Tuple.Nested ((/\))
import WAGS.Lib.Learn (Player, player)
import WAGS.Lib.Tidal (AFuture, tdl)
import WAGS.Lib.Tidal.Tidal (lnr, lnv, make, onTag, parse_, s)
import WAGS.Lib.Tidal.Types (BufferUrl(..), Sample(..))

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
            ( set (_Just <<< lnv)
                $ (if _ then 1.0 else 0.0)
                    <<< flip (<) 0.9
                    <<< _.normalizedLittleCycleTime
                    <<< unwrap
            )
        $ onTag "comp"
            ( set (_Just <<< lnr)
                $ add 0.95 
                    <<< mul 0.1
                    <<< _.initialEntropy
                    <<< unwrap
            )
        $ parse_ "wdm:1;comp"
    , sounds: Map.fromFoldable $ map (\(a /\ b) -> Sample a /\ BufferUrl b)
        [ "wdm:0" /\ "https://freesound.org/data/previews/332/332741_34095-lq.mp3"
        , "wdm:1" /\ "https://freesound.org/data/previews/332/332740_34095-hq.mp3"
        ]
    }

main :: Player
main = player $ tdl $ wag