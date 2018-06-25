/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/

module keypair;

import shelld.addresscore;
import shelld.blockcore;
import shelld.cryptocore;
import shelld.persistence;
import deimos.sodium;

// This module generates a simple plain text keypair and persists it 
// into a file, thus, further recovering is done once the app.d is re-run
// and all the states before that are not lost.

    void publicKey() {
        return null;

        string publicKey;

        // Puts the public key generated from the hash into a file
        // for further recovery
        pushToFile;
    }

    void privateKey() {
        return null;
    }

    void generateKey() {
        return null;
    }

    bool verifyAddressKey() {
        
        if (addressKey) {

        } else {
            writeln("Address keypair does not match");
        }
        
        return null;
    }

