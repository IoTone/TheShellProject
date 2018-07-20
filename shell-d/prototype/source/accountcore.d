/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/
module shelld.accountcore;

import std.stdio;
// import rocksdb;
import std.conv : to;

import shelld.cryptocore;
import shelld.keypair;
import shelld.persistence;

struct Account {
    string accountId;
    string accountAddress;
    int[] accountBlocksIndex;
    int[] consensusIndex;
    double[] accountBalance;
    int[] harvestedBlocks;
    int[] transactionPerBlock;
    
}

auto checkAccountBalance() {

}

auto setHarvestedBlocks() {

}

auto setVestedBalance() {
    
}

    //Account account;

    // Takes anything thats is an asset and attach to account
    auto publishAsset() {
        enum generalAsset;

        int[] assetIndex;
        ubyte[] assetHash;
        // This array holds the hash from the transaction 
        // which generated the asset
        ubyte[] transactionHash;
    }

    bool retrieveGlobalStatus() {
        bool accountStatus;

        // Here is good to check if the account is ok
        // The peer situation in which the account is hosted 
        // would be nice to check too
        // as the address that holds the account
        // KeyPair verification could be verified too, to
        // add consistence and trackability of global status
        if (!accountStatus) {

        }

        return accountStatus;

    }

    unittest {
        //AccountManager am = new AccountManager();

        //assert(am !is null);
    }


