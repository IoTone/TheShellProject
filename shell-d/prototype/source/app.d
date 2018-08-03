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
import shelld.keypair;
import shelld.shellclient;
import shelld.shellnode;



void main()
{
	writeln("Entry point for The Shell Blockchain.");
	writeln("Starting to call block and address managers...");
	//writeln("Pushing a Hello World to the blockchain...", pushHelloWorld());
	writeln("The local address is :");
	//writeln("Status of genesis block: ", genesisBlockStatus());
	
	//int globalBlocksCounter;
	//writeln("Total global blocks created: ", globalBlocksCounter);

	writeln("Hash of actual address : ", );
	ubyte[8] pkBytes;
	pkBytes = generateKey();
	char[] genHash;
	genHash = generateHash();
	writeln("Your public keypair is: ", pkBytes);
	writeln("Hashed public key: ", genHash);

}

/**
string pushHelloWorld() {
	auto helloWorld_msg = `Hello World into the Blockchain \o/`;

	return helloWorld_msg;
}

void setLocalAddress() {

	//  auto localAddress = addresscore.localAddress;

}

void setLocalAddressToPeer() {

}

// Returns the status of the genesis
bool genesisBlockStatus() {
	return false;
}
**/
