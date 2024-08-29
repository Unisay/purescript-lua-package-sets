{ `assert` =
  { dependencies = [ "effect", "console", "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-assert.git"
  , version = "v6.1.0"
  }
, arrays =
  { dependencies =
    [ "foldable-traversable"
    , "functions"
    , "nonempty"
    , "partial"
    , "prelude"
    , "st"
    , "unfoldable"
    , "unsafe-coerce"
    ]
  , repo = "https://github.com/Unisay/purescript-lua-arrays.git"
  , version = "v7.3.0"
  }
, console =
  { dependencies = [ "effect", "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-console.git"
  , version = "v6.1.0"
  }
, control =
  { dependencies = [ "newtype", "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-control.git"
  , version = "v6.0.0"
  }
, effect =
  { dependencies = [ "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-effect.git"
  , version = "v4.1.0"
  }
, enums =
  { dependencies =
    [ "control"
    , "either"
    , "gen"
    , "maybe"
    , "newtype"
    , "nonempty"
    , "partial"
    , "prelude"
    , "tuples"
    , "unfoldable"
    ]
  , repo = "https://github.com/Unisay/purescript-lua-enums.git"
  , version = "v6.1.0"
  }
, exceptions =
  { dependencies = [ "effect", "either", "maybe", "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-exceptions.git"
  , version = "v6.1.0"
  }
, functions =
  { dependencies = [ "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-functions.git"
  , version = "v6.1.0"
  }
, lazy =
  { dependencies = [ "control", "foldable-traversable", "invariant", "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-lazy.git"
  , version = "v7.0.0"
  }
, lua-ngx =
  { dependencies = [ "effect", "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-ngx.git"
  , version = "v0.2.0"
  }
, integers =
  { dependencies = [ "maybe", "numbers", "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-integers.git"
  , version = "v6.1.0"
  }
, numbers =
  { dependencies = [ "functions", "maybe", "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-numbers.git"
  , version = "v9.1.0"
  }
, partial =
  { dependencies = [] : List Text
  , repo = "https://github.com/Unisay/purescript-lua-partial.git"
  , version = "v4.1.0"
  }
, prelude =
  { dependencies = [] : List Text
  , repo = "https://github.com/Unisay/purescript-lua-prelude.git"
  , version = "v7.1.2"
  }
, refs =
  { dependencies = [ "effect", "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-refs.git"
  , version = "v6.1.0"
  }
, safe-coerce =
  { dependencies = [ "unsafe-coerce" ]
  , repo = "https://github.com/Unisay/purescript-lua-safe-coerce.git"
  , version = "v2.0.0"
  }
, st =
  { dependencies = [ "partial", "prelude", "tailrec", "unsafe-coerce" ]
  , repo = "https://github.com/purescript-lua/purescript-lua-st.git"
  , version = "v6.3.0"
  }
, strings =
  { dependencies =
    [ "arrays"
    , "enums"
    , "foldable-traversable"
    , "gen"
    , "integers"
    , "maybe"
    , "newtype"
    , "nonempty"
    , "partial"
    , "prelude"
    , "tailrec"
    , "tuples"
    , "unfoldable"
    , "unsafe-coerce"
    ]
  , repo = "https://github.com/Unisay/purescript-lua-strings.git"
  , version = "v6.1.0"
  }
, unfoldable =
  { dependencies =
    [ "foldable-traversable", "maybe", "partial", "prelude", "tuples" ]
  , repo = "https://github.com/Unisay/purescript-lua-unfoldable.git"
  , version = "v6.1.0"
  }
, unsafe-coerce =
  { dependencies = [] : List Text
  , repo = "https://github.com/Unisay/purescript-lua-unsafe-coerce.git"
  , version = "v6.1.0"
  }
, foldable-traversable =
  { dependencies =
    [ "bifunctors"
    , "const"
    , "control"
    , "either"
    , "functors"
    , "identity"
    , "maybe"
    , "newtype"
    , "orders"
    , "prelude"
    , "tuples"
    ]
  , repo = "https://github.com/Unisay/purescript-lua-foldable-traversable.git"
  , version = "v6.1.0"
  }
}
