/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/
module shelld.blockcore;

import std.stdio;
import std.string;
import std.random;

struct Block_ {
   string Hash;
   string Timestamp;
   string Nonce;
   string previousHash;
}

class Block {

   //this.Hash         = Hash;
   //this.newBlock     = newBlock;
   //this.previousHash = previousHash;
   //this.Nonce        = Nonce;
   //this.Timestamp    = Timestamp;

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
