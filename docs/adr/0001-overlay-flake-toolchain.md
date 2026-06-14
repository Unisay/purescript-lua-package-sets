# 0001 — Pin the toolchain with purescript-overlay

Status: Accepted

## Context

Each fork needs a reproducible PureScript toolchain (purs, spago) and a Lua 5.1
runtime for the FFI checks. Early forks pinned their tools through
easy-purescript-nix, which tracked purs 0.15.15 and pulled an unpinned spago.
The compiler and the later forks moved to `thomashoneyman/purescript-overlay`,
which packages exact purs and spago releases as nix attributes.

## Decision

Every fork pins its toolchain through purescript-overlay: purs 0.15.16
(`purs-bin.purs-0_15_16`), spago 0.21.0 (`spago-bin.spago-0_21_0`), and a Lua 5.1
toolchain (`lua51Packages`). The dev shell also carries dhall, luacheck,
luaformatter, nixfmt, and treefmt. The pslua compiler is a flake input tracking
`github:purescript-lua/purescript-lua`.

## Consequences

- One flake.nix shape across the set. Converting a fork is copying the canonical
  flake.nix and running `nix flake update`.
- purs and spago versions are exact and shared through the binary caches.
- Keep flake.lock reasonably current. A long-stale pslua pin predates the
  output-directory and codegen fixes and breaks CI (see 0002, 0003).
