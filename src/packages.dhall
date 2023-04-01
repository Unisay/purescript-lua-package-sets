{ lua-console =
  { dependencies = [ "lua-effect", "lua-prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-console.git"
  , version = "v6.0.0"
  }
, lua-control =
  { dependencies = [ "lua-newtype", "lua-prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-control.git"
  , version = "v6.0.0"
  }
, lua-effect =
  { dependencies = [ "lua-prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-effect.git"
  , version = "v4.0.0"
  }
, lua-newtype =
  { dependencies = [ "lua-prelude", "lua-safe-coerce" ]
  , repo = "https://github.com/Unisay/purescript-lua-newtype.git"
  , version = "v5.0.0"
  }
, lua-ngx =
  { dependencies = [ "lua-effect", "lua-prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-ngx.git"
  , version = "v0.1.0"
  }
, lua-prelude =
  { dependencies = [] : List Text
  , repo = "https://github.com/Unisay/purescript-lua-prelude.git"
  , version = "v6.0.2"
  }
, lua-safe-coerce =
  { dependencies = [ "lua-unsafe-coerce" ]
  , repo = "https://github.com/Unisay/purescript-lua-safe-coerce.git"
  , version = "v2.0.0"
  }
, lua-unsafe-coerce =
  { dependencies = [] : List Text
  , repo = "https://github.com/Unisay/purescript-lua-unsafe-coerce.git"
  , version = "v6.0.0"
  }
}
