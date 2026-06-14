# 0004 — Represent unit as an empty table, never nil

Status: Accepted

## Context

Lua tables cannot hold nil values: assigning nil removes the key. If the prelude
defines `unit = nil`, an `Array Unit` collapses to an empty table and a length
check silently returns 0.

## Decision

`unit` is `{}` (an empty table), never nil. This requires
`Unisay/purescript-lua-prelude` v7.2.0 or newer.

## Consequences

- `Array Unit` keeps its length.
- If eval goldens for unit arrays start printing 0, a package set has downgraded
  the prelude below v7.2.0. Do not accept such goldens.
