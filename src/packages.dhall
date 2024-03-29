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
  , version = "v7.2.1"
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
, exceptions =
  { dependencies = [ "effect", "either", "maybe", "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-exceptions.git"
  , version = "v6.0.1"
  }
, functions =
  { dependencies = [ "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-functions.git"
  , version = "v6.0.1"
  }
, lua-ngx =
  { dependencies = [ "effect", "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-ngx.git"
  , version = "v0.1.0"
  }
, partial =
  { dependencies = [] : List Text
  , repo = "https://github.com/Unisay/purescript-lua-partial.git"
  , version = "v4.0.0"
  }
, prelude =
  { dependencies = [] : List Text
  , repo = "https://github.com/Unisay/purescript-lua-prelude.git"
  , version = "v7.1.0"
  }
, refs =
  { dependencies = [ "effect", "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-refs.git"
  , version = "v6.0.1"
  }
, safe-coerce =
  { dependencies = [ "unsafe-coerce" ]
  , repo = "https://github.com/Unisay/purescript-lua-safe-coerce.git"
  , version = "v2.0.0"
  }
, st =
  { dependencies = [ "partial", "prelude", "tailrec", "unsafe-coerce" ]
  , repo = "https://github.com/purescript-lua/purescript-lua-st.git"
  , version = "v6.2.0"
  }
, unfoldable =
  { dependencies =
    [ "foldable-traversable", "maybe", "partial", "prelude", "tuples" ]
  , repo = "https://github.com/Unisay/purescript-lua-unfoldable.git"
  , version = "v6.0.0"
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
  , version = "v6.0.0"
  }
}
