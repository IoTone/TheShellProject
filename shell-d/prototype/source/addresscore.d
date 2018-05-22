/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/
module shelld.addresscore;

import std.stdio;
import std.string;

string addressHash;

struct associatedBlock {
    
}


// Inserts the address into a pool struct for full block address stamping
struct addressPool {
     string addressHeader;
     string addressOfNode;
}

// Some infos about the pool of networking in which the address is integrating
struct networkPool {
     string address;

}



class AddressCore {

    string generateAddress() {
        return null;
    }

    // Returns status about the status of the hits for the broadcast over the network
    bool BroadcastStatus() {
        return false;
    }

    // Check for the local address and sync with the broadcast index of adressess
    void checkAddressIndex() {
        
    }

    // Checks for the existence of the address over the network
    bool checkNetworkAddress() {
        return false;
    }

    // Checks for the existence of the address over the network and fetch the genesis block to verify integrity through blockchain
    bool checkNetworkAddressBlock() {
        return false;
    }
    
    unittest {
        AddressCore obj = new AddressCore();

        // assert(obj.generateAddress() !is null);
    }
}
