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

    string publicKey() {
        
        string publicKey;

        // Puts the public key generated from the hash into a file
        // for further recovery
        enum keypair_secret = "keypair_secret";
        auto pushToFile = File(keypair_secret, "w");

        bool keyPairStatus;

        return publicKey;
    }

    string privateKey() {

        return null;

    }

    string generateKey() {

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

