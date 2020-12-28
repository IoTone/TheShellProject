# Overview

This is a quick and dirty Dlang implementation.  Improve it, fix it, use it, and eventually a hero will offer to maintain it, make it into a proper Dlang module.

From NIST: NIST announced the SHA-3 Cryptographic Hash Algorithm Competition on November 2, 2007, and ended the competition on October 2, 2012, when it announced KECCAK as the winning algorithm to be standardized as the new SHA-3.

## References

- NIST SHA-3 Project https://csrc.nist.gov/projects/hash-functions/sha-3-project
- Inspired strongly by js-sha3: https://github.com/emn178/js-sha3
- Reading on @safe and @trusted: https://dlang.org/blog/2016/09/28/how-to-write-trusted-code-in-d/
## Building

We recommend a Dlang compiler based on DMD v2.076.1 or later.

dub --compiler=ldc2

## Testing

dub --compiler=ldc2 test
