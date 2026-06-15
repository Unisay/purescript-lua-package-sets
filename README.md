# PureScript Lua Package Set

The package set for [pslua](https://github.com/purescript-lua/purescript-lua),
the PureScript-to-Lua compiler backend. It collects the core PureScript
libraries as Lua forks: each fork keeps the upstream PureScript sources and
replaces the JavaScript FFI with Lua that runs on Lua 5.1.

[`src/packages.dhall`](src/packages.dhall) holds only these Lua forks. It is the
*overrides* half of a set, not a whole set: the release workflow copies it
verbatim into each `psc-*` release asset. To build a project you merge it with
the standard PureScript set and let the Lua forks win over their
JavaScript-targeting upstreams.

## Using the set with spago

In your project's `packages.dhall`, import both the upstream PureScript set and a
released Lua set, then merge them so the Lua forks override the upstreams:

```dhall
let upstream-ps =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.15-20240309/packages.dhall

let upstream-lua =
      https://github.com/purescript-lua/purescript-lua-package-sets/releases/download/psc-0.15.15-20260615/packages.dhall

in  upstream-ps // upstream-lua
```

The right operand wins, so every package that has a Lua fork comes from this set
and everything else comes straight from the PureScript set. Pointing `upstream`
at the Lua release on its own would give you only the forks, which is why the
merge is required.

Lua releases are tagged `psc-0.15.15-<YYYYMMDD>[-N]`;
[`latest-compatible-sets.json`](latest-compatible-sets.json) records the most
recent one, and `spago upgrade-set --tag <tag>` moves between them.

## Packages

The Lua forks in this set. Each keeps its upstream PureScript API and ships a Lua
FFI in place of the JavaScript one. The package name is the Dhall key in
`src/packages.dhall` — note that the OpenResty bindings are keyed `lua-ngx`.

| Package | Repository | Version |
|---|---|---|
| arrays | https://github.com/purescript-lua/purescript-lua-arrays | v7.4.1 |
| assert | https://github.com/purescript-lua/purescript-lua-assert | v6.1.1 |
| console | https://github.com/purescript-lua/purescript-lua-console | v6.1.1 |
| control | https://github.com/purescript-lua/purescript-lua-control | v6.0.1 |
| effect | https://github.com/purescript-lua/purescript-lua-effect | v4.1.3 |
| enums | https://github.com/purescript-lua/purescript-lua-enums | v6.1.1 |
| exceptions | https://github.com/purescript-lua/purescript-lua-exceptions | v6.1.1 |
| foldable-traversable | https://github.com/purescript-lua/purescript-lua-foldable-traversable | v6.1.1 |
| functions | https://github.com/purescript-lua/purescript-lua-functions | v6.1.0 |
| integers | https://github.com/purescript-lua/purescript-lua-integers | v6.1.2 |
| lazy | https://github.com/purescript-lua/purescript-lua-lazy | v7.0.0 |
| lua-ngx | https://github.com/purescript-lua/purescript-lua-ngx | v0.2.0 |
| numbers | https://github.com/purescript-lua/purescript-lua-numbers | v9.1.3 |
| partial | https://github.com/purescript-lua/purescript-lua-partial | v4.1.0 |
| prelude | https://github.com/purescript-lua/purescript-lua-prelude | v7.3.0 |
| refs | https://github.com/purescript-lua/purescript-lua-refs | v6.1.0 |
| safe-coerce | https://github.com/purescript-lua/purescript-lua-safe-coerce | v2.0.1 |
| st | https://github.com/purescript-lua/purescript-lua-st | v6.4.0 |
| strings | https://github.com/purescript-lua/purescript-lua-strings | v6.2.0 |
| unfoldable | https://github.com/purescript-lua/purescript-lua-unfoldable | v6.1.0 |
| unsafe-coerce | https://github.com/purescript-lua/purescript-lua-unsafe-coerce | v6.1.0 |

Every other package in the set is an unmodified PureScript package that needs no
Lua-specific FFI.

## Maintaining a fork

[`CONTRIBUTING.md`](CONTRIBUTING.md) is the practical canon: the toolchain, the
Lua 5.1 and FFI rules, CI, and the release process. The reasoning behind each
rule is recorded as an ADR under [`docs/adr/`](docs/adr/). Read the ADRs before a
decision that affects the whole set, and add one after making such a decision.
