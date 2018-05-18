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

}

void setLocalAddress() {

	auto localAddress = addresscore.localAddress;

}

void setLocalAddressToPeer() {

}
