/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/
module shelld.blockcore;

import std.stdio;
import std.string;
import std.algorithm: random, maps;

struct Block {
   string Hash;
   string Timestamp;
   string Nonce;
   string previousHash;
}

class Block {

   this.Hash         = Hash;
   this.newBlock     = newBlock;
   this.previousHash = previousHash;
   this.Nonce        = Nonce;
   this.Timestamp    = Timestamp;

   string newBlock() {}

   bool validBlock() {}

   string previousHash() {}

   string Nonce() {}
}
