/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/
module shelld.addresscore;

import std.stdio;
import std.string;
import std.digest.md;


import shelld.accountcore;
import shelld.cryptocore;
import shelld.keypair;
import shelld.persistence;


ubyte[] addressHash;

ubyte[] addressNetwork;

ubyte[] accountHash;

struct associatedBlock {
    

}

ubyte[] generateEncoded(ubyte[] version, ubyte[] publicKey) {
  ubyte[] data;
  ubyte[] md5CheckSum;

  generateKey(publickey);

  pbkey = publickey;
 
  ubyte[] sha256PublicKey = new ubyte[crypto_hash_sha256_BYTES(pbkey)];

  return encodedAddress;

  
}


int storeAddress(ubyte[] address) {

    auto db = new dddb("address.db");

    if (!storeAdressStatus) {
        storeAdressStatus = -1;
    } else {
        storeAdressStatus = 0;

    }

    return storeAdressStatus;
}

// Inserts the address into a pool struct for full block address stamping
struct addressPool {
     ubyte[] addressHeader;
     ubyte[] addressOfNode;
}

// Some infos about the pool of networking in which the address is integrating
struct networkPool {
     ubyte[] address;

}
    
// AddressCore localAddress = new AddressCore();

/*
ubyte[] generateAddress(ubyte[] address) {

    auto hashedKey = address;

        return hashedKey;
    }
    */

// Returns status about the status of the hits for the broadcast over the network
bool BroadcastStatus() {
        return false;
    }

auto setCheckSum() {
        
    }

// Persist all the states to the persistence layer
auto postAddressState() {

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

 bool verifyAddressKey() {
        bool addressKeyIsVerified = false;
        if (addressKeyIsVerified) {

        } else {
            writeln("Address keypair does not match");
        }
        
        return false;
    }

unittest {
        //AddressCore obj = new AddressCore();

        // assert(obj.generateAddress() !is null);
}