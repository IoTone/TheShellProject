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
import shelld.loggingcore;
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

ubyte[] generateKey(ubyte[] datain) {

        assert(sodium_init != -1);
        ubyte[8] buf;            
             
        ubyte[] pkBytes = buf;

        return pkBytes;

    }    

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
        
        // generateKey(publicKey);

        // string keyToHex;

        // auto keyToHex = to!string(publicKey);
        
        // auto hexdata = hexString!(keyToHex);

        // Some example ways to do conversions
        // 
        // format("%.2x", dat[i])
        
        // TODO: Add some error handling

        return convertAsciiStringToHexString(datain.assumeUTF);
    }


    /**
        generateHash (XXX rename this to genHash)

        Hash wrapper around libsodium crypto_generichash()

    */
ubyte[] genHash(const ubyte[] message) {
        ubyte[] hash = new ubyte[crypto_generichash_bytes()];

        // Method Signature
        // https://download.libsodium.org/doc/hashing/generic_hashing#single-part-example-without-a-key
        assert(crypto_generichash(hash.ptr, hash.length, message.ptr, message.length, null, 0) == 0);

        return hash;
    }
   
ubyte[] privateKey(ubyte[] datakey) {

        ubyte[] privatekey;
        ubyte[] signature;
        
        generateKey(datakey);

        ubyte[] keypair = datakey;

        ubyte[] hashedKey = genHash(keypair);

        return privatekey;
    }

    bool commitKeyPair(ubyte[] keypair) {

        bool initPersistenceSession;
        
        // This variable will be returned
        // as long the commit works fine
        // if not, an error stream will
        // thrown
        bool commitStatus;
        // Use an assert declaration to
        // guarantee of the persistence
        // session or something associated
        // to it for holding the keypair
        // assert(initPersistenceSession == true);
        // writeln("Keypair successfully persistence");

        return commitStatus;
    }
     

unittest {
    
    /*
    ubyte[] keypair;
    generateHash(keypair);
    auto response = keypair;
    writeln("Stick 1:")
    writeln("Generated keypair: ");
    assert(response == "");

    ubyte[] genericHash;
    writeln("Stick 2:");
    writeln("Applied generic hash:");
    auto response = genericHash;
    assert(response == "");

    writeln("Stick 3:");
    writeln("Apply everything to hexString");

    auto dbSession = new ddb("yes.db");

    */
    
}
