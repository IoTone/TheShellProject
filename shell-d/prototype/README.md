# Overview

The Shell Project shell-d is a prototype version of the project.

## References

- See Project Milestone for Protoype of shell-d: https://github.com/IoTone/TheShellProject/milestone/18
- Adhere to dlang spec: 2.077.1 https://docarchives.dlang.io/v2.077.0/phobos/index.html

## Design

TODO

## Building

First obtain external dependencies  and they should build as well if needed:

> ./setup-deps.sh

Additional steps:
- For libsodium, if you have built libsodium, point your LD_LIBRARY_PATH to libsodium.  For a default linux install of libsodium, it would be under /usr/local/lib typically.  Set: export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
- On Mac OS X, you can't set the LD_LIBRARY_PATH explicitly anymore, so a different approach is needed.  It's for security.  Instead, ldc2 is expecting to link libraries from /usr/local possibly, so for libsodium, make
- ~~You will need a rocksdb library .so.  Build rocksdb directly, and copy the library into the root of this folder~~


Then
- Use Dub, ldc2 or gdc.  We have not tested with DMD.
- run: dub build --compiler=ldc2 (use compiler flag in case you also have DMD in the path)

## Running

TODO

## Testing

Currently tested on:

```
LDC - the LLVM D compiler (1.7.0git-07b7abe):
  based on DMD v2.077.1 and LLVM 5.0.1
  built with LDC - the LLVM D compiler (1.6.0)
  Default target: x86_64-pc-windows-msvc
  Host CPU: nehalem
```

- run: dub test --compiler=ldc2

## Known Issues

- The libkeccak-d implementation won't currently run on windows because it keccak-tiny doesn't build on windows.

## TODO

- initial commits
- project plan
- recruit more devs
