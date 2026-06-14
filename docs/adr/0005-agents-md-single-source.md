# 0005 — AGENTS.md is the single agent instruction file

Status: Accepted

## Context

Several AI coding agents read repository-level instructions. Most of them
(Codex, Cursor, Copilot, Gemini CLI, Aider) read `AGENTS.md` natively; Claude
Code reads `CLAUDE.md`. Keeping two instruction files per fork drifts them out of
sync.

## Decision

Each fork has one `AGENTS.md` with the build/test/lint commands, the Lua 5.1
constraints, the FFI parenthesisation rule, the toolchain pins, and a pointer to
the ADRs. `CLAUDE.md` is a one-line `@AGENTS.md` import, not a symlink (symlinks
break on Windows and on some CI checkouts). `AGENTS.md` stays short and
command-first; the full rationale lives in these ADRs and in `CONTRIBUTING.md`.

## Consequences

- One file to edit; every agent reads the same content.
- `AGENTS.md` links to the package-set `CONTRIBUTING.md` for the release process
  and the ADRs, so neither is duplicated across forks.
- Agents are pointed at the ADRs: read them before a cross-cutting decision, add
  one after making such a decision (see the ADR index README).
