# 0008 — Publish a consumable JSON package set for the new spago

Status: Accepted (supersedes the spago pin in [0001](0001-overlay-flake-toolchain.md))

## Context

The set was built for the legacy spago (0.21.0): a Dhall overlay
(`src/packages.dhall`) holding only the Lua forks, released as a `packages.dhall`
asset that a consumer merged with the upstream PureScript set
(`upstream-ps // upstream-lua`). The right operand won, so each fork overrode its
JavaScript-targeting upstream. ADR 0001 pinned spago 0.21.0 across the forks to
make this work.

The PureScript toolchain has moved to the new spago (1.x), which drives
`spago.yaml` + `spago.lock` and the PureScript Registry, and dropped Dhall. pslua
itself migrated its test toolchain to it (pslua #54, #55). The new spago has no
Dhall and no set-merge operator: `workspace.packageSet` takes a *single* source —
a registry version, a URL, or a path. So the old "merge two Dhall sets" model
cannot be expressed, and a forks-only overlay is no longer directly consumable.

A spike (pslua #115) confirmed three ways — the spago docs, the `core/src/Config.purs`
codecs (`RemotePackage = git | registry-version | legacy`), and a working PoC —
that the new spago consumes a *custom* set through `packageSet.url` / `packageSet.path`,
and that such a set may carry git-based package entries. So the set can become a
single, self-contained, consumable input again.

## Decision

Each release publishes a `packages.json` asset: a RemotePackageSet
(`{ compiler, version, packages }`) where the pure packages come from a pinned
upstream **registry package set** baseline (the proven-compatible 77.x set; see
the generator) and the Lua forks are overlaid as **git entries**
(`{ git, ref, dependencies }`). `src/packages.dhall` stays the single source of
truth for the forks; `scripts/gen-package-set-json` reshapes it onto the baseline.
Consumers point `workspace.packageSet.url` at the published `packages.json` and
drop `extraPackages` entirely.

The forks and the set's own coherence check migrate to the new spago (1.x):
`spago.yaml` replaces `spago.dhall`/`packages.dhall`, and the toolchain pin moves
from `spago-bin.spago-0_21_0` to `spago-bin.spago-1_0_4`. This **supersedes the
spago 0.21.0 pin in ADR 0001**; the purs 0.15.16 and Lua 5.1 pins there stand.

The legacy `packages.dhall` asset is still published alongside `packages.json`,
so existing Dhall / spago 0.21 consumers are not broken.

## Consequences

- The set is a live build input again — one URL, no `//` merge, no inlined
  `extraPackages` dependency lists in every consumer.
- `packages.json` is generated, never committed: `scripts/gen-package-set-json`
  builds it from `src/packages.dhall` + the pinned registry baseline. The
  coherence check (`test-set.yml`) regenerates it and builds against it, so the
  generator is exercised on every push.
- The published `version`/`compiler` fields are the registry baseline's
  (`0.15.15` / its set version); the GitHub release tag (`psc-0.15.15-<date>`)
  identifies our revision. purs 0.15.16 against a 0.15.15-built set is the same
  proven-compatible pairing pslua's `test/ps` already relies on.
- A fork tag bump flows through unchanged: bump `src/packages.dhall`, regenerate
  the README table, refresh `latest-compatible-sets.json`, push a `psc-*` tag —
  the release workflow now emits both assets (see [0006](0006-fork-release-by-annotated-tag.md)).
- Each fork's own build migrates to `spago.yaml` + spago 1.x (rolled out per
  fork; CONTRIBUTING reflects the new toolchain).
