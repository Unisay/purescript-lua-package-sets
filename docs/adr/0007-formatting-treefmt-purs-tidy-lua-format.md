# 0007 — Formatting via treefmt: purs-tidy and lua-format

Status: Accepted

## Context

Formatting was unconfigured across the set: treefmt and luaformatter were in the
dev shell, but there was no treefmt config. We want one setup that runs the same
way locally (`nix fmt`), as a pre-commit guard, and as a CI gate
(`treefmt --ci`). Two formatter choices needed care.

- PureScript: purs-tidy is the ecosystem standard. purty is deprecated, and
  purescript-contrib mandates purs-tidy. The forks' `.purs` are vendored from
  upstream and are mostly already purs-tidy-formatted, so reformatting them is a
  small, layout-only diff (mostly import and export lists; measured at 0 changed
  files for arrays, 1 of 50 for prelude, more for foldable-traversable). Running
  purs-tidy over the upstream snapshot before an upstream sync keeps that sync
  free of formatting conflicts.
- Lua: StyLua is modern and lightweight but removes parentheses it considers
  redundant, including the wrapping parentheses the FFI reader depends on (0003).
  Tested on a real FFI file, StyLua turned `name = (function ... end)` into
  `name = function ... end`, which fails to parse. There is no StyLua option to
  preserve them (only per-node `-- stylua: ignore`, which skips formatting that
  node entirely). lua-format preserves the parentheses.

## Decision

Configure treefmt with treefmt-nix: nixfmt (`*.nix`), purs-tidy with a shared
`.tidyrc.json` (`*.purs`), dhall format (`*.dhall`), and lua-format (the FFI
`src/*.lua`). The flake exposes `formatter` (so `nix fmt` works) and a
`checks.formatting` (so `nix flake check` / `treefmt --ci` gates CI), and a
pre-commit hook runs `nix fmt`. Generated and vendored trees are excluded:
`dist/`, `output/`, `.spago/`, `*.lock`, `.tidyrc.json`.

## Consequences

- One config drives local formatting, the pre-commit guard, and the CI gate.
- StyLua stays unusable until pslua's foreign reader no longer requires grouping
  parentheses, which is a compiler change recorded in the pslua repository.
- Vendored `.purs` take a small one-time reflow; future upstream syncs normalise
  both sides with purs-tidy to stay conflict-free.
