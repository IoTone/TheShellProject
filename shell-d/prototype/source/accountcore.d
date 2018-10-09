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
module shelld.accountcore;

import std.stdio;
// import rocksdb;
import std.conv : to;

import shelld.cryptocore;
import shelld.keypair;
import shelld.persistence;
import shelld.loggingcore;

struct Account {
    string accountId;
    string accountAddress;
    int[] accountBlocksIndex;
    int[] consensusIndex;
    double[] accountBalance;
    int[] harvestedBlocks;
    int[] transactionPerBlock;
    ubyte[] checkSum;
    ubyte[] networkPoolID;
    
}


/*
int checkAccountBalance() {

    return accountBalance;

}

int setHarvestedBlocks() {

    return harvestedBlocks;

    

}

int setVestedBalance() {
    
}


    //Account account;

    // Takes anything thats is an asset and attach to account
    auto publishAsset() {
        enum generalAsset;

        bool publishAsset;

        int[] assetIndex;
        ubyte[] assetHash;
        // This array holds the hash from the transaction 
        // which generated the asset
        ubyte[] transactionHash;

        return publishedAsset;
    }

    bool retrieveGlobalStatus() {
        bool accountStatus;
        bool globalStatus;

        // Here is good to check if the account is ok
        // The peer situation in which the account is hosted 
        // would be nice to check too
        // as the address that holds the account
        // KeyPair verification could be verified too, to
        // add consistence and trackability of global status
        if (!accountStatus) {

            string reportStatusError;



        } else {
            
            return accountStatus;

        }

        return globalStatus;

        

    }
*/

    unittest {
        //AccountManager am = new AccountManager();

        //assert(am !is null);
    }


