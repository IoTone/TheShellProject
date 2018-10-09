/**
#
# Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of this
# software and associated documentation files (the "Software"), to deal in the 
# Software without restriction, including without limitation the rights to use, 
# copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the 
# Software, and to permit persons to whom the Software is furnished to do so, subject
# to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A 
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT 
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
# CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
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

ubyte[] generateEncoded(ubyte[] version, ubyte[] publickey) {
  ubyte[] data;
  ubyte[] step4CheckSum;

  generateKey(publickey);

  pbkey = publickey;
 
  ubyte[] sha256PublicKey = new ubyte[crypto_hash_sha256_BYTES(pbkey)];

  step2Key = applyRipemd160(sha256PublicKey);
  
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

/*
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


ubyte[] generateAddress(ubyte[] address) {

    auto hashedKey = address;

        return hashedKey;
    }
    

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
*/    

unittest {
        //AddressCore obj = new AddressCore();

        // assert(obj.generateAddress() !is null);
}