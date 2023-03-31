{ lua-console =
  { dependencies = [ "lua-effect", "lua-prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-console.git"
  , version = "v6.0.0"
  }
, lua-effect =
  { dependencies = [ "lua-prelude" ]
  , repo = "https://github.com/Unisay/purescript-lua-effect.git"
  , version = "v4.0.0"
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
, lua-unsafe-coerce =
  { dependencies = [] : List Text
  , repo = "https://github.com/Unisay/purescript-lua-unsafe-coerce.git"
  , version = "v6.0.0"
  }
}
