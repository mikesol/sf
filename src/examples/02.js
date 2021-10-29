export const simple = `module Main where

import Prelude

import Data.NonEmpty ((:|))
import Effect (Effect)
import WAGS.Lib.Learn (play)
import WAGS.Lib.Learn.Note (accelerando, noteFromPitch_, repeat, seq)
import WAGS.Lib.Learn.Pitch (c4, d4, e4, fSharp4, gSharp4, bFlat4, c5)


main :: Effect Unit
main =
  play
    $ repeat
    $ accelerando
    $ seq
    $ map noteFromPitch_
    $ c4 :| [ d4, e4, fSharp4, gSharp4, bFlat4, c5, bFlat4, gSharp4, fSharp4, e4, d4, c4 ]`;