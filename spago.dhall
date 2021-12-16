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
{ name = "fp-sound"
, dependencies =
  [ "aff"
  , "affjax"
  , "argonaut-codecs"
  , "arrays"
  , "bifunctors"
  , "control"
  , "distributive"
  , "effect"
  , "either"
  , "everythings-better-with-variants"
  , "exceptions"
  , "foldable-traversable"
  , "foreign"
  , "foreign-object"
  , "free"
  , "identity"
  , "integers"
  , "jit"
  , "lists"
  , "math"
  , "maybe"
  , "newtype"
  , "nonempty"
  , "nullable"
  , "ordered-collections"
  , "parallel"
  , "prelude"
  , "profunctor"
  , "profunctor-lenses"
  , "psci-support"
  , "quickcheck"
  , "refs"
  , "simple-json"
  , "strings"
  , "transformers"
  , "tuples"
  , "unfoldable"
  , "wags"
  , "wags-lib"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
