{ console =
  { dependencies = [ "effect", "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-console.git"
  , version = "v6.0.0"
  }
, control =
  { dependencies = [ "newtype", "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-control.git"
  , version = "v6.0.0"
  }
, effect =
  { dependencies = [ "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-effect.git"
  , version = "v4.0.0"
  }
, lua-ngx =
  { dependencies = [ "effect", "prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-ngx.git"
  , version = "v0.1.0"
  }
, prelude =
  { dependencies = [] : List Text
  , repo = "https://github.com/Unisay/purescript-lua-prelude.git"
  , version = "v6.0.2"
  }
, safe-coerce =
  { dependencies = [ "unsafe-coerce" ]
  , repo = "https://github.com/Unisay/purescript-lua-safe-coerce.git"
  , version = "v2.0.0"
  }
, unsafe-coerce =
  { dependencies = [] : List Text
  , repo = "https://github.com/Unisay/purescript-lua-unsafe-coerce.git"
  , version = "v6.0.0"
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
