# 0003 — Target Lua 5.1 and parenthesise FFI values

Status: Accepted

## Context

The set targets Lua 5.1. pslua reads each fork's foreign file (`src/*.lua`) and
extracts the exported values. Its reader does not parse Lua: it requires every
exported value to be wrapped in parentheses and finds the end of a value by
matching those parentheses (`Foreign.hs`, `valueParser`).

## Decision

- Generated and hand-written Lua must run on Lua 5.1: no `table.unpack`, `bit32`,
  `utf8`, or the `//` operator; `math.pow` and `math.atan2` do exist; array-style
  tables are 1-indexed; Lua 5.1 mangles some Lua 5.3 string escapes, so keep FFI
  escapes 5.1-safe.
- Every FFI export is parenthesised: `return { name = (<value>), ... }`. A bare
  `function ... end` or an unparenthesised expression fails to parse.

## Consequences

- luacheck `--std lua51` is the gate that catches 5.1 violations, for example
  `table.pack`/`unpack`/`move` slipping in from Lua 5.2/5.3 habits.
- Lua formatters that strip "redundant" parentheses (StyLua) break the FFI
  reader; the set uses lua-format, which preserves them (see 0007).
- Relaxing the parenthesis requirement would mean teaching pslua to find a value's
  end without the parentheses, which needs real Lua parsing. That is a compiler
  decision, recorded in the pslua repository, not here.
