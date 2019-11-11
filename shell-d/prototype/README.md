# Overview

The Shell Project shell-d is a prototype version of the project.

## References

- See Project Milestone for Protoype of shell-d: https://github.com/IoTone/TheShellProject/milestone/18
- Adhere to dlang spec: 2.077.1 https://docarchives.dlang.io/v2.077.0/phobos/index.html
- NEM Blockchain White Paper https://nem.io/wp-content/themes/nem/files/NEM_techRef.pdf

## Inspirations

- NEM Library TS: https://github.com/NemProject/nem-library-ts/
- NEM2 Library TS/JS https://github.com/nemtech/nem2-sdk-typescript-javascript

## Design

As this is a strawman prototype, we are tracking the original NEM specification with modifications.

## Building

First obtain external dependencies  and they should build as well if needed:

> ./setup-deps.sh

Additional steps:
- On linux, for libsodium, build the library from source: https://github.com/jedisct1/libsodium/archive/1.0.16.zip , make sure to install automake, libtool, and compilers.  Run the autogen.sh script.  Then do configure.  Then do make and make install.
- if you have built libsodium, point your LD_LIBRARY_PATH to libsodium.  For a default linux install of libsodium, it would be under /usr/local/lib typically.  Set: export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
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

- TBD

## TODO

- initial commits
- project plan
- recruit more devs
