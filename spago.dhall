{-
Welcome to a Spago project!
You can edit this file as you like.

Need help? See the following resources:
- Spago documentation: https://github.com/purescript/spago
- Dhall language tour: https://docs.dhall-lang.org/tutorials/Language-Tour.html

When creating a new Spago project, you can use
`spago init --no-comments` or `spago init -C`
to generate this file without the comments in this block.
-}
{ name = "my-project"
, dependencies =
  [ "aff"
  , "affjax"
  , "argonaut-codecs"
  , "arrays"
  , "bifunctors"
  , "control"
  , "effect"
  , "either"
  , "exceptions"
  , "foldable-traversable"
  , "foreign"
  , "foreign-object"
  , "math"
  , "maybe"
  , "newtype"
  , "nonempty"
  , "nullable"
  , "parallel"
  , "prelude"
  , "profunctor"
  , "profunctor-lenses"
  , "psci-support"
  , "refs"
  , "simple-json"
  , "strings"
  , "transformers"
  , "tuples"
  , "wags"
  , "wags-lib"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
