/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/
module shelld.blockcore;

import std.stdio;
import std.string;
import std.random;

import shelld.cryptocore;
import shelld.persistence;
import shelld.keypair;



string localBlock;

string localBlockStack;

string localBlockAddress;


struct Block_ {
   string Hash;
   string Timestamp;
   string Nonce;
   string previousHash;
}

/**
TODO: XXX fix compile errors and uncomment this block
source/blockcore.d(36,5): Error: cannot implicitly convert expression this of type shelld.blockcore.Block to string
source/blockcore.d(37,5): Error: cannot implicitly convert expression this of type shelld.blockcore.Block to string
source/blockcore.d(38,5): Error: cannot implicitly convert expression this of type shelld.blockcore.Block to string
source/blockcore.d(39,5): Error: cannot implicitly convert expression this of type shelld.blockcore.Block to string
source/blockcore.d(49,12): Error: function shelld.blockcore.Block.generateHash has no return statement, but is expected to return a value of type string
source/blockcore.d(64,9): Error: cannot implicitly convert expression this of type shelld.blockcore.Block to string
source/blockcore.d(66,13): Error: undefined identifier currentTimestamp
source/blockcore.d(67,13): Error: continue is not inside a loop
source/blockcore.d(73,13): Error: continue is not inside a loop
*/
class Block {

/**

    string newBlock() {

    this.Block_.Hash = generateHash();         
    this.Block_.previousHash; 
    this.Block_.Nonce;        
    this.Block_.Timestamp;
     
       return null;
    }

   // Each block has its own root hash which is a way to another hashes combination
   string rootHash;

   
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
    }

    string previousHash() {
        return null;
    }

    string Nonce() {
        return null;
    }

    unittest{
        Block ablock = new Block();

        assert(ablock != null);
    }
    */
}
