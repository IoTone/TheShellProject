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


    bool keyPairStatus;

    string keyPair;

    string publicKey(string hash) {
        
        string publicKey;

        string hexData;

        string data;

        string signature;
        
        

        return publicKey;
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

