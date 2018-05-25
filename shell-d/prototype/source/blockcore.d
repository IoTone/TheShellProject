/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/
module shelld.blockcore;

import std.stdio;
import std.string;
import std.random;

string localBlock;

string localBlockStack;

string localBlockAddress;


struct Block_ {
   string Hash;
   string Timestamp;
   string Nonce;
   string previousHash;
}

class Block {

    string newBlock() {

    this.Block_.Hash = generateHash();         
    this.Block_.previousHash; 
    this.Block_.Nonce;        
    this.Block_.Timestamp;
     
       return null;
   }

   Block block = new Block();

   
   // Will use simple SHA-1 to generate the hash
   string generateHash() {
       uint randomHash;

   }

   bool validBlock() {

       // Timestamp from the last block
       string lastTimestamp;
       this.Block_.Timestamp = currentTimestamp;

       if (currentTimestamp > lastTimestamp) {
           continue;
       } else {
           writeln("Incorrect timestamp and block sequence");
       }

       if (previousHash) {
           continue;
       } else {
           writeln("This blocks has an invalid order or does not exist!");
       }
       return true;

       unittest {
           assertion();
       }
   }

   string previousHash() {
       return null;
   }

   string Nonce() {
       return null;
   }
}
