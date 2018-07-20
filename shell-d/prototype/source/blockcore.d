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

/**
struct Block {
   ubyte[] Hash;
   string Timestamp;
   string Nonce;
   ubyte[] previousHash;   
}

uint genesisBlock() {
    uint blockIndex;

    return blockIndex;
}

    string newBlock(string Hash, string previousHash, string Nonce, string Timestamp) {

       import shelld.cryptocore;    

       ubyte[] Hash         = Block.Hash ;         
       ubyte[] previousHash = Block.previousHash; 
       string Nonce        = nonce;        
       string Timestamp    = Block.Timestamp;
       ubyte[] blockHash    = Block.blockHash;
     
       
       
       bool blockStatus;
       
       return blockStatus;


    }

    auto includeBlock() {
        
        bool blockIncluded;

        if (!blockIncluded) {
            writeln("Block could not be included, aborting the shell-d...");
        } else {
            newBlock();
            writeln("Block created successfully, reaching next step...");
        }

        return true;
    }

      
   
    // Will use generichash from cryptocore module, which is based on libsodium
    string generateHash() {
        ubyte Hash = crypto_generichash;  

        return Hash;  

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

        assert(ablock !is null);
    }
**/

 
