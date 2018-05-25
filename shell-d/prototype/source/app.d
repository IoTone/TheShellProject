/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/

import std.stdio;
import shelld.accountcore;
import shelld.addresscore;
import shelld.blockcore;
import shelld.consensuscore;
import shelld.cryptocore;
import shelld.shellclient;
import shelld.shellnode;



void main()
{
	writeln("Entry point for The Shell Blockchain.");
	writeln("Starting to call block and address managers...");
	writeln("The local address is :", setLocalAddress());
	writeln("Status of genesis block: ", genesisBlockStatus());
	
	int globalBlocksCounter;
	writeln("Total global blocks created: ", globalBlocksCounter);

}

void setLocalAddress() {

	auto localAddress = addresscore.localAddress;

}

void setLocalAddressToPeer() {

}

// Returns the status of the genesis
bool genesisBlockStatus() {
	return false;
}
