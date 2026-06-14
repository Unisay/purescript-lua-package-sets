# PureScript Lua Package Set

The package set for [pslua](https://github.com/Unisay/purescript-lua), the
PureScript-to-Lua compiler backend. It starts from the standard PureScript
package set and overrides the core libraries with Lua forks: each fork keeps the
upstream PureScript sources and replaces the JavaScript FFI with Lua that runs on
Lua 5.1.

The set is defined in [`src/packages.dhall`](src/packages.dhall) as
`upstream-ps // upstream-lua`. The right operand wins, so the Lua forks override
their JavaScript-targeting upstreams while every other package comes straight
from the PureScript set.

## Using the set with spago

Point the `upstream` import in your `packages.dhall` at a released set:

```dhall
let upstream =
      https://github.com/Unisay/purescript-lua-package-sets/releases/download/psc-0.15.15-20260614-4/packages.dhall
```

Releases are tagged `psc-0.15.15-<YYYYMMDD>[-N]`, and
[`latest-compatible-sets.json`](latest-compatible-sets.json) records the most
recent one. Move between versions with `spago upgrade-set --tag <tag>`.

## Packages

The Lua forks in this set. Each keeps its upstream PureScript API and ships a Lua
FFI in place of the JavaScript one.

| Package | Repository |
|---|---|
| arrays | https://github.com/Unisay/purescript-lua-arrays |
| assert | https://github.com/Unisay/purescript-lua-assert |
| console | https://github.com/Unisay/purescript-lua-console |
| control | https://github.com/Unisay/purescript-lua-control |
| effect | https://github.com/Unisay/purescript-lua-effect |
| enums | https://github.com/Unisay/purescript-lua-enums |
| exceptions | https://github.com/Unisay/purescript-lua-exceptions |
| foldable-traversable | https://github.com/Unisay/purescript-lua-foldable-traversable |
| functions | https://github.com/Unisay/purescript-lua-functions |
| integers | https://github.com/Unisay/purescript-lua-integers |
| lazy | https://github.com/Unisay/purescript-lua-lazy |
| ngx | https://github.com/Unisay/purescript-lua-ngx |
| numbers | https://github.com/Unisay/purescript-lua-numbers |
| partial | https://github.com/Unisay/purescript-lua-partial |
| prelude | https://github.com/Unisay/purescript-lua-prelude |
| refs | https://github.com/Unisay/purescript-lua-refs |
| safe-coerce | https://github.com/Unisay/purescript-lua-safe-coerce |
| strings | https://github.com/Unisay/purescript-lua-strings |
| unfoldable | https://github.com/Unisay/purescript-lua-unfoldable |
| unsafe-coerce | https://github.com/Unisay/purescript-lua-unsafe-coerce |

Every other package in the set is an unmodified PureScript package that needs no
Lua-specific FFI.

## Maintaining a fork

[`CONTRIBUTING.md`](CONTRIBUTING.md) is the practical canon: the toolchain, the
Lua 5.1 and FFI rules, CI, and the release process. The reasoning behind each
rule is recorded as an ADR under [`docs/adr/`](docs/adr/).
