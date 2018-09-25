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
	
	// XXX This is not how you do the conversion
	// XXX ubyte[] datain = to!(ubyte[]) ("This is NachoCheese");

	// We can do this a this conversation a number of ways
	ubyte[] datain;
	ubyte[] pvkey;
	ubyte[] privatekey;
	ubyte[] ripemd, rpmd;

	string s1 = "This is Nacho Cheese";
	datain = cast(ubyte[])("This is Nacho Cheese".dup);
	// XXX This isn't supported in 2.077.1 datain = s1.representation;
	// For immutable
	// datain = cast(immutable(ubyte)[])"This is Nacho Cheese";
	keypairHash = genHash(datain);
	keypair = generateKey(pkBytes);
	privatekey = privateKey(pvkey);
	ripemd = applyRipemd160(keypairHash);
	writeln("Your public keypair is: ", keypair);
	writeln("Hashed public key: ", keypairHash);
	writeln("Your private key:", privatekey);
	writeln("Test RIPEMD-160:", ripemd);

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
