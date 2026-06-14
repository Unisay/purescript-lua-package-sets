# 0002 — Shared hardened CI workflow

Status: Accepted

## Context

Forks drifted across CI shapes: some on the old npm/setup-purescript flow, some
on an early nix workflow that set `accept-flake-config = true` and ran luacheck
with `--std min`. `accept-flake-config` lets a pull request's own flake nixConfig
inject substituters and signing keys, which is a supply-chain risk. `--std min`
is the intersection of all Lua versions and flags `math.pow`/`math.atan2`, which
are valid on the Lua 5.1 target.

## Decision

All forks share one CI workflow:

- `cachix/install-nix-action@v27`, with substituters and keys pinned in
  `extra_nix_config`. `accept-flake-config` is dropped.
- Build: `nix develop -c ./scripts/build`.
- Test: `if [ -f scripts/test ]; then nix develop -c bash ./scripts/test; fi`,
  run via `bash` so it does not depend on the execute bit.
- Lint: `nix develop -c luacheck --quiet --std lua51 --no-unused-args src/`
  (`dist/` for forks without hand-written FFI). `--no-unused-args` tolerates the
  curried fallback arguments the native FFI stubs ignore.
- `scripts/build` starts with `set -euo pipefail`.

## Consequences

- A pull request's flake config can no longer add caches or keys.
- luacheck matches the real target and the FFI idiom, so it stops flagging
  `math.pow`/`math.atan2` and starts catching real Lua 5.1 violations (see 0003).
- A stale pslua pin still breaks the build step; keep flake.lock current (0001).
