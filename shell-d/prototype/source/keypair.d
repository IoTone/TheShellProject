/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/

module shelld.keypair;

import shelld.addresscore;
import shelld.blockcore;
import shelld.cryptocore;
import shelld.persistence;
import deimos.sodium;


class KeyPair {

    void publicKey() {
        return null;
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

    unittest {
        
    }
}