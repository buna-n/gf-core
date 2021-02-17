# LPGF testsuite & benchmark

## Test

LPGF must be equivalent to PGF in terms of linearisation output.

Possible exceptions:
- No handling of variants (design choice)
- Rendering of missing fucntions

## Benchmark

### Compilation

Comparing PGF, LPGF along following criteria:

- Time
- Memory
- Binary file size

### Runtime (linearisation)

Comparing PGF, PGF2, LPGF along following criteria:

- Time
- Memory

### Running

```
stack build --test --bench --no-run-tests --no-run-benchmarks
stack bench --benchmark-arguments "+RTS -T -RTS"
PGF_ONLY=1 stack bench --benchmark-arguments "+RTS -T -RTS"
LPGF_ONLY=1 stack bench --benchmark-arguments "+RTS -T -RTS"
```