# Contributing to the purescript-lua package set

This set is a collection of PureScript libraries forked to run on Lua 5.1 through
the [pslua](https://github.com/purescript-lua/purescript-lua) compiler. Each fork keeps
the upstream PureScript sources and replaces the JavaScript FFI with Lua. This
document is the practical canon for maintaining a fork; the reasoning behind each
rule lives in [`docs/adr/`](docs/adr/).

## Toolchain

Pinned through purescript-overlay ([ADR 0001](docs/adr/0001-overlay-flake-toolchain.md)):
purs 0.15.16, spago 0.21.0, Lua 5.1. Enter the dev shell with `nix develop`. Keep
`flake.lock` reasonably current with `nix flake update`; a long-stale pslua pin
breaks the build.

## Commands

- Build: `nix develop -c ./scripts/build`
- Test: `nix develop -c bash ./scripts/test` (forks that ship Lua regression tests)
- Lint: `nix develop -c luacheck --quiet --std lua51 --no-unused-args src/`
- Format: `nix fmt` ([ADR 0007](docs/adr/0007-formatting-treefmt-purs-tidy-lua-format.md))

## Lua 5.1 and FFI ([ADR 0003](docs/adr/0003-lua-51-target-and-ffi-parens.md))

- No `table.unpack`, `bit32`, `utf8`, or `//`. `math.pow` and `math.atan2` exist.
  Array-style tables are 1-indexed. Keep string escapes 5.1-safe.
- Parenthesise every FFI export: `return { name = (<value>), ... }`.
- `unit` is `{}`, never nil ([ADR 0004](docs/adr/0004-unit-is-empty-table.md)).

## CI ([ADR 0002](docs/adr/0002-hardened-ci-canon.md))

All forks share one workflow: substituters pinned in `extra_nix_config` (no
`accept-flake-config`), build, optional test via `bash`, and luacheck with
`--std lua51 --no-unused-args`.

## Agent instructions ([ADR 0005](docs/adr/0005-agents-md-single-source.md))

Each fork has an `AGENTS.md` (the single source) and a one-line `CLAUDE.md` that
imports it with `@AGENTS.md`. Edit `AGENTS.md`; never duplicate.

## Releasing ([ADR 0006](docs/adr/0006-fork-release-by-annotated-tag.md))

Annotated git tag on `master` → bump the fork's version in `src/packages.dhall` →
refresh `latest-compatible-sets.json` → push a `psc-*` set tag. A tooling-only PR
needs no release.

## Decisions and ADRs

Cross-cutting decisions are recorded as ADRs in [`docs/adr/`](docs/adr/).

- **Read them before a decision** that affects the set (toolchain, CI, FFI
  conventions, release, formatting). The relevant ADR is usually linked from the
  section above.
- **Add one after a decision.** Copy the shape of an existing record (status,
  context, decision, consequences), give it the next number, and add it to the
  ADR index. Supersede rather than rewrite an accepted record.

Decisions about the pslua compiler itself live in the
[pslua repository](https://github.com/purescript-lua/purescript-lua) under its own
`docs/adr/`.
