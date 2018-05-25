/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/
module shelld.consensuscore;

import shelld.cryptocore;
import shelld.blockcore;
import shelld.addresscore;
import shelld.keypair;
import shelld.persistence;
import shelld.shellnode;

class Consensus {

    unittest {

    }

    void checkBlockProof() {
        return null;
    }

    void checkBlockAtomicity() {
        return null;
    }

    void includeAssetIndex() {
        return null;
    }

    // 
    void verifyAssetMatrix() {
        return null;
    }

    // Determine which peer can perform some operation once green light is took
    void determinePeerReflection() {
        return null;
    }

    // Looks for the whole state of blocks that already passed in consensus
    void checkGlobalState() {
        return null;
    }
}