# Overview

The Shell Project shell-d is a prototype version of the project.

## References

- See Project Milestone for Protoype of shell-d: https://github.com/IoTone/TheShellProject/milestone/1
- Adhere to dlang spec: 2.077.1 https://docarchives.dlang.io/v2.077.0/phobos/index.html

## Design

TODO

## Building

First obtain external dependencies  and they should build as well if needed:

> ./setup-deps.sh

Additional steps:
- You will need a rocksdb library .so.  Build rocksdb directly, and copy the library into the root of this folder


Then
- Use Dub, ldc2
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

## TODO

- initial commits
- project plan
- Find some helpers

## General Notes

TODO
