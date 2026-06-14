# Architecture Decision Records

Decisions that apply across the whole purescript-lua package set live here. Each
record is a short Markdown file in the MADR style: a status, the context, the
decision, and its consequences.

Scope: these ADRs cover the set as a whole, its forks, their toolchain, CI, FFI
conventions, release process, and formatting. Decisions about the pslua compiler
itself live in its own repository (`Unisay/purescript-lua`, under `docs/adr/`).
The rule of thumb: a decision about the compiler goes there; a decision about
the forks, the set, or the shared tooling goes here.

Status values: `Proposed`, `Accepted`, `Superseded by NNNN`, `Deprecated`.

The practical, do-this summary of these decisions is in the repository root
[`CONTRIBUTING.md`](../../CONTRIBUTING.md); the records here hold the reasoning.

## Maintaining these records

- **Read before deciding.** Before making a change that affects the set as a
  whole, check whether an ADR already covers it. The relevant record is usually
  linked from `CONTRIBUTING.md`.
- **Write after deciding.** Once a cross-cutting decision is made, add a record:
  copy the shape of an existing one (Status, Context, Decision, Consequences),
  give it the next number, and add a line to the index below.
- **Supersede, do not rewrite.** When a decision changes, write a new ADR and set
  the old one's status to `Superseded by NNNN`. The history stays readable.

## Index

- [0001](0001-overlay-flake-toolchain.md) — Pin the toolchain with purescript-overlay
- [0002](0002-hardened-ci-canon.md) — Shared hardened CI workflow
- [0003](0003-lua-51-target-and-ffi-parens.md) — Target Lua 5.1 and parenthesise FFI values
- [0004](0004-unit-is-empty-table.md) — Represent unit as an empty table, never nil
- [0005](0005-agents-md-single-source.md) — AGENTS.md is the single agent instruction file
- [0006](0006-fork-release-by-annotated-tag.md) — Release forks with annotated tags
- [0007](0007-formatting-treefmt-purs-tidy-lua-format.md) — Formatting via treefmt: purs-tidy and lua-format
