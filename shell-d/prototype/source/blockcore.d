/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/
module shelld.blockcore;

import std.stdio;
import std.string;
import std.random;

class Block {

   struct Block {
      string Hash;
      string Timestamp;
      string Nonce;
      string previousHash;
   }

   string newBlock() {
       return null;
   }

   bool validBlock() {
       return false;
   }

   string previousHash() {
       return null;
   }

   string Nonce() {
       return null;
   }
}
