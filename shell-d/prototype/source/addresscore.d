/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/
module shelld.addresscore;

import std.stdio;
import std.string;

// Inserts the address into a pool struct for full block stamping
struct addressPool {
     string addressHeader;
     string addressOfNode;
}

// Some infos about the pool of networking in which the address is integrating
struct networkPool {

}

class AddressCore {

    string generateAddress() {}

}
