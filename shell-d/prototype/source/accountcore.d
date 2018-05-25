/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/
module shelld.accountcore;

import std.stdio;
// import rocksdb;
import std.conv : to;

struct Account_ {
    string accountId;
    string accountAddress;
    []
}

class AccountManager {

    Account account = new Account();

    // Takes anything thats is an asset and attach to account
    void publishAsset() {
        return null;
    }

    void retrieveGlobalStatus() {

    }
}

unittest
{
    
}