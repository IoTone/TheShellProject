/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/

module shelld.keypair;

import std.stdio;
import std.conv;
import shelld.addresscore;
// import shelld.blockcore;
import shelld.cryptocore;
import shelld.persistence;
import deimos.sodium;

// This module generates a simple plain text keypair and persists it 
// into a file, thus, further recovering is done once the app.d is re-run
// and all the states before that are not lost.

/**
Some considerations on the steps to generate the hash
//
- Take pkBytes and convert it to hexadecimal;
- Take the output and convert to a length, maybe 160 is fine
- Apply the SHA-2 (Blake2b) from libsodium
- Assign some data to verify its the correct associated entry with the keypair
- Apply the hexData to it
- Apply and verify through a signature to the keypair 

**/


    // These tests handles the generation and verification of keypair

    ubyte[] pkBytes;

    ubyte[] hexData;

    ubyte[] data;

    ubyte[] signature; 
    
    ubyte[] generateKey() {

        assert(sodium_init != -1);
        ubyte[8] buf;            
             
        pkBytes = buf;

        return pkBytes;

    }    

    /*
    
    string convertToHex() {
        
        ubyte[] publicKey;
        
        publicKey = generateKey();

        auto keyToHex = to!string(publicKey);
        
        auto finalHex = hexString!(keyToHex);

        return finalHex;

    }

    */

    
    ubyte[] generateHash() {
        // What is crypto_hash_sha_init?
        // assert(crypto_hash_sha_init() != -1);

        // crypto_hash_sha256_BYTES;
        ubyte[] hash;
        ubyte[] dataLength;

        ubyte[8] buf;
        ubyte[] generateHash;

       // generateHash = buf;
        
        //ubyte[] [crypto_generichash_BYTES] generalHash;

        //crypto_generichash(generalHash.ptr, generalHash.length);

        //return generalHash;
    }

   
    /** ubyte[] publicKey() {
        
        
    }
    **/

    ubyte[] privateKey() {

        ubyte[] privateKey;

        return privateKey;

    }
    
    bool verifyAddressKey() {
        bool addressKeyIsVerified = false;
        if (addressKeyIsVerified) {

        } else {
            writeln("Address keypair does not match");
        }
        
        return false;
    }

unittest {}
