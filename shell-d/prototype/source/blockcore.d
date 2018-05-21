/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/
module shelld.blockcore;

import std.stdio;
import std.string;
import std.random;

<<<<<<< HEAD
string localBlock;

string localBlockStack;

string localBlockAddress;


struct Block_ {
   string Hash;
   string Timestamp;
   string Nonce;
   string previousHash;
}

=======
>>>>>>> 80575b96a2bf9ee96f4622a303ccc3a40dd0a092
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
