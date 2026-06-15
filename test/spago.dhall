-- Depends on every package in the set so `spago build` compiles them all
-- together, surfacing version incompatibilities between the pinned tags.
-- Keep this list in sync with the keys of ../src/packages.dhall.
{ name = "set-coherence-check"
, dependencies =
  [ "arrays"
  , "assert"
  , "console"
  , "control"
  , "effect"
  , "enums"
  , "exceptions"
  , "foldable-traversable"
  , "functions"
  , "integers"
  , "lazy"
  , "lua-ngx"
  , "numbers"
  , "partial"
  , "prelude"
  , "refs"
  , "safe-coerce"
  , "st"
  , "strings"
  , "unfoldable"
  , "unsafe-coerce"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
}
