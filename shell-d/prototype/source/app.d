/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/

import std.stdio;
import std.conv;
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
	//writeln("The local address is :");
	//writeln("Status of genesis block: ", genesisBlockStatus());
	//int globalBlocksCounter;
	//writeln("Total global blocks created: ", globalBlocksCounter);

	//writeln("Hash of actual address : ", );
	ubyte[8] pkBytes;
	ubyte[] keypair;	
	// keypair.genHash() returns ubyte[]
	ubyte[] keypairHash;
	ubyte[] datain = to!(ubyte[]) ("This is NachoCheese");
	keypairHash = genHash(datain);
	keypair = generateKey(pkBytes);
	writeln("Your public keypair is: ", keypair);
	writeln("Hashed public key: ", keypairHash);

}


/**
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
