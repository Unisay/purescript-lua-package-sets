-- Package set under test: the official PureScript set overridden by THIS
-- repo's Lua forks (../src/packages.dhall). Mirrors how pslua's own test/ps
-- consumes the released set, but points at the working tree instead of a
-- published release so CI validates the set before it is tagged.
let upstream-ps =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.15-20260605/packages.dhall
        sha256:e48c9b283ca89ec994453459fb74c4b5b5a9432349f83a2e104f39dd869a0f6e

let upstream-lua = ../src/packages.dhall

in  upstream-ps // upstream-lua
