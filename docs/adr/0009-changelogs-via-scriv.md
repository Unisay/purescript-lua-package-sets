# 0009 — Keep changelogs with scriv

Status: Accepted (supersedes the no-changelog clause of [0006](0006-fork-release-by-annotated-tag.md))

## Context

[0006](0006-fork-release-by-annotated-tag.md) decided that a fork release is a
bare annotated tag with no GitHub Release and no changelog entry, on the grounds
that a per-release changelog would be over-process for a tag-driven fork.

The pre-release FFI campaign changed that calculus. Between #73 and #102 the
forks took a run of behavioural fixes — `Char` code-point handling in enums,
32-bit `Int` semantics in integers, the `Number` formatting contract in numbers,
`forE`/`ST.for` range fixes in effect and st, and more. The fork tags carry one
line each, and the only place those lines are aggregated is the set-bump commit
messages in this repository. A consumer pinning, say, numbers v9.1.3 has no way
to read what moved between v9.1.0 and v9.1.3 without walking the git log of two
repositories. The same gap exists for the compiler and for the set itself.

So the tradeoff flipped: the cost of a missing changelog now exceeds the cost of
maintaining one, especially once the FFI work is the thing people most need to
diff between versions.

## Decision

Every repository in the ecosystem keeps a `CHANGELOG.md` managed with
[scriv](https://scriv.readthedocs.io/): change fragments live in `changelog.d/`,
and `scriv collect --version <tag>` assembles them into a dated section on
release. This covers the [pslua compiler](https://github.com/purescript-lua/purescript-lua),
every set fork, and this set repository.

Concretely, per repository:

- A scriv config (`changelog.d/scriv.ini`): Markdown output, `md_header_level = 2`,
  categories `Added, Changed, Fixed, Removed`, and a hyphen entry-title separator
  so collected sections read as `## <version> - <date>` in the Keep a Changelog
  shape. The `%` in the title template are doubled (`%%`) because scriv reads the
  file through configparser interpolation.
- `scriv` in the dev shell. The forks add it to their `flake.nix` `buildInputs`;
  this set repository and any other flake-less consumer get it from the pslua dev
  shell (`nix develop github:purescript-lua/purescript-lua`), which carries it.
- A `CHANGELOG.md` seeded with the `<!-- scriv-insert-here -->` /
  `<!-- scriv-end-here -->` markers. Forks keep their inherited upstream history
  below the fork section; the scriv-managed region documents the Lua fork's own
  release line.

This reverses the no-changelog clause of [0006](0006-fork-release-by-annotated-tag.md).
The rest of 0006 stands: a fork release is still an annotated tag on `master`
followed by a `src/packages.json` bump and a `psc-*` set tag, and a tooling-only
change still needs no release.

## Consequences

- A change that touches `src/` adds a `changelog.d/` fragment in the same change.
  Tooling/CI/flake-only changes do not need one (they ship no release), matching
  the tag rule in 0006.
- On release, run `scriv collect --version <tag>` before tagging, review the
  assembled section, and commit it with the version bump. The annotated tag still
  points at that commit. There is no GitHub Release for a fork; the changelog is
  the human-readable record.
- The retroactive backfill prioritised the FFI campaign tags (#73–#102); older
  upstream-inherited versions are left to the inherited upstream changelog rather
  than reconstructed.
- CONTRIBUTING's release section and each fork's `AGENTS.md` "Releasing" note are
  updated to require the fragment and the collect step. The "no changelog entry"
  wording in those files is removed.
