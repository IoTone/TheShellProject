/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/

module shelld.keypair;

import std.stdio;
import shelld.addresscore;
// import shelld.blockcore;
import shelld.cryptocore;
import shelld.persistence;
import deimos.sodium;

// This module generates a simple plain text keypair and persists it 
// into a file, thus, further recovering is done once the app.d is re-run
// and all the states before that are not lost.

unittest {

    // These tests handles the generation and verification of keypair

    string keyPair;

    ubyte publicKey() {
        
        assert(sodium_init != -1);
        ubyte[8] buf;
        if (buf.length <= 256) // limit, that linux guarantees by default, using getrandom(); figure can be higher with added True Random Number Generator
		   randombytes_buf(buf.ptr, buf.length);

        string hexData;

        string data;

        string signature;   
             

        return buf;
    }

    string privateKey() {

        string privateKey;

        return privateKey;

    }

    string generateKey() {

        string keyAllocator;
        
        return null;

    }

    bool verifyAddressKey() {
        bool addressKeyIsVerified = false;
        if (addressKeyIsVerified) {

        } else {
            writeln("Address keypair does not match");
        }
        
        return false;
    }

}