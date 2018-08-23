/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/

module shelld.keypair;

import std.stdio;
import std.conv;
import std.string;
import std.array: array;
import std.range: chunks;
import std.algorithm: map;

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

<<<<<<< HEAD
    /*
    
    string convertToHex() {
        
        ubyte[] publicKey;
=======
    /**
     *
     *
    */
    ubyte[] convertHexStringToUbytes(in string datain) {
        // This works also: immutable hexNum = cast(immutable(ubyte)[])x"16D81B16E091F31BEF";
        // also this: // conversion at compile time
        // auto string1 = hexString!"304A314B";
        ubyte[] hexnumbytes = datain /* "16D8..." */
        .chunks(2) /* "16", "D8", ... */
        .map!(twoDigits => twoDigits.parse!ubyte(16)) /* 0x16, 0xD8, */
        .array();

        return hexnumbytes;
    }
    
    /**
     * convertAsciiStringToHexString - use a regular ascii string as input
     * 
     */
    string convertAsciiStringToHexString(in string datain) {
        // TODO: add error handling
        return datain.format!("%(%02X%)");
    }

    /**
     * convertToHex - takes ubyte array and converts to hexidecimal representation
     *
     */
    string convertUbytesToHexString(in ubyte[] datain) {
        // immutable(ubyte)[] b = a.representation;
        // string c = b.assumeUTF;

        // ubyte[] publicKey;
>>>>>>> b47a5eed33c82fbe465309f080c529194dd6e1f7
        
        // publicKey = generateKey();

<<<<<<< HEAD
        auto keyToHex = to!string(publicKey);
=======
        // string keyToHex;

        // auto keyToHex = to!string(publicKey);
>>>>>>> b47a5eed33c82fbe465309f080c529194dd6e1f7
        
        // auto hexdata = hexString!(keyToHex);

        // Some example ways to do conversions
        // 
        // format("%.2x", dat[i])
        
        // TODO: Add some error handling

        return convertAsciiStringToHexString(datain.assumeUTF);
    }

<<<<<<< HEAD
    */

    
    ubyte[] generateHash() {
=======

    ubyte[] generateHash(ubyte[] datain, ubyte[] key) {
>>>>>>> b47a5eed33c82fbe465309f080c529194dd6e1f7
        // What is crypto_hash_sha_init?
        // assert(crypto_hash_sha_init() != -1);

        // crypto_hash_sha256_BYTES;
        ubyte[] hash;
        ubyte[] dataLength;

        ubyte[8] buf;

       // generateHash = buf;
        
        //ubyte[] [crypto_generichash_BYTES] generalHash;

        //crypto_generichash(generalHash.ptr, generalHash.length);
<<<<<<< HEAD
=======
        ubyte[] generalHash;
        generalHash = new ubyte[crypto_generichash_BYTES];

        /* deimos.sodium.crypto_generichash.crypto_generichash 
            (ubyte* out_, 
            ulong outlen, 
            const(ubyte)* in_, 
            ulong inlen, 
            const(ubyte)* key, 
            ulong keylen)
        */
        // (ubyte[]*, ulong, ubyte*, ulong, ubyte*, ulong)
        crypto_generichash(generalHash.ptr,
                           generalHash.length,
                           datain.ptr,
                           datain.length,
                           key.ptr,
                           key.length);
>>>>>>> b47a5eed33c82fbe465309f080c529194dd6e1f7

        return generalHash;
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
