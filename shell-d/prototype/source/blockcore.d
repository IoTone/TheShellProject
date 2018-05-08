/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/
module shelld.blockcore;

import std.stdio;
import std.string;
import std.algorithm: random, maps;
class Block {

   struct Block {
      string Hash;
      string Timestamp;
      string Nonce;
      string previousHash;
   }

   string newBlock() {}

   bool validBlock() {}

   string previousHash() {}

   string Nonce() {}
}
