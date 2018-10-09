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
	applyRipemd160(keypairHash);
	ripemd = keypairHash;
	writeln("Your public keypair is: ", keypair);
	writeln("Hashed public key: ", keypairHash);
	writeln("Your private key:", privatekey);
	writeln("Test RIPEMD-160:", ripemd);

}