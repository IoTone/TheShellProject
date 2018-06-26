/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/
module shelld.blockcore;

import std.stdio;
import std.string;
import std.random;

import shelld.persistence;
import shelld.keypair;

import deimos.sodium;


/**
// Variables which serves the network's pool of blocks to assign transactions to addresses
// Perhaps, if needed, they can turn into structs

// This holds reference to the blocks generated locally
string localBlock;
//All blocks generated locally fits into this reference
string localBlockStack;
// All blocks addresses, in case of more than one block per address and it's chains
string localBlockAddress;
**/


struct Block {
   string Hash;
   string blockHash;
   string Timestamp;
   string Nonce;
   string previousHash;   
}


    string newBlock(string Hash, string previousHash, string Nonce, string Timestamp) {

    import shelld.cryptocore;    

    string Hash         = this.Block.Hash ;         
    string previousHash = this.Block.previousHash; 
    string Nonce        = nonce;        
    string Timestamp    = this.Block.Timestamp;
    string blockHash    = this.Block.blockHash;
     
       return true;
    }

    void includeBlock() {
        return true;
    }

   

   // Each block has its own root hash which is a way to another hashes combination
   string rootHash;

   
    // Will use simple SHA-1 to generate the hash
    string generateHash() {
        string Hash;  

        return null;  

    }

    bool validBlock() {

        // Timestamp from the last block
        string lastTimestamp;

        // Current timestamp for the recent block
        string currentTimestamp;
    
        this.Block.Timestamp = currentTimestamp;

        if (currentTimestamp > lastTimestamp) {
            
        } else {
            writeln("Incorrect timestamp and block sequence");
        }

        if (previousHash) {
           
        } else {
            writeln("This blocks has an invalid order or does not exist!");
        }
        return true;

        
    }

    string previousHash() {
        string lastBlockHash;
        return null;

    }

    string Nonce() {
        
        import shelld.cryptocore;

        string nonce = nonce;


        return nonce;
    }

    

    unittest{
        Block ablock = new Block();

        assert(ablock != null);
    }

 
