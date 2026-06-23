# 0006 — Release forks with annotated tags

Status: Accepted

## Context

The forks are consumed by spago through git refs and are aggregated into the
package set. They inherit upstream CHANGELOGs and do not track fork versions
there. The existing fork tags (for example effect v4.1.0) are bare annotated
tags with no GitHub Release attached.

## Decision

A fork release is an annotated git tag on `master`, pushed to the fork. No GitHub
Release and no per-fork changelog entry. After tagging, bump the fork's `version`
in this repository's `src/packages.json`, refresh `latest-compatible-sets.json`,
and push a `psc-0.15.15-<YYYYMMDD>[-N]` set tag, which the release workflow turns
into the set asset. A pull request that touches only tooling, CI, or the flake
(not `src/`) needs no tag or set bump, because spago consumes `src/` only.

## Consequences

- Consumers resolve a fork by its tag; the set tag pins a compatible combination.
- Tooling-only sweeps (for example the AGENTS.md and CI alignment) ship without a
  release.
- A `src/*.lua` or `src/*.purs` change does require a tag and a set bump.
