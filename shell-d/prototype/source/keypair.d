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

module shelld.keypair;

import std.stdio;
import std.conv;
import std.string;
import std.array: array;
import std.range: chunks;
import std.algorithm: map;
import std.regex;

import shelld.addresscore;
// import shelld.blockcore;
import shelld.cryptocore;
// import shelld.persistence;
import dddb;
import shelld.loggingcore;
import deimos.sodium;

// This module generates a simple plain text keypair and persists it 
// into a file, thus, further recovering is done once the app.d is re-run
// and all the states before that are not lost.

/**
Some considerations on the steps to generate the hash
//
- Take pkBytes and convert it to hexadecimal;
- Take the output and convert to a length, maybe 160 is fine
- Apply the SHA-3 which was wrapped from external js lib
- Assign some data to verify its the correct associated entry with the keypair
- Apply the hexData to it
- Apply and verify through a signature to the keypair 

**/

ubyte[] generateKey(ubyte[] datain) {

        assert(sodium_init != -1);
        ubyte[8] buf;            
             
        ubyte[] pkBytes = buf;

        return pkBytes;

    }    

ubyte[] convertHexStringToUbytes(in string datain) {
        // This works also: immutable hexNum = cast(immutable(ubyte)[])x"16D81B16E091F31BEF";
        // also this: // conversion at compile time
        // auto string1 = hexString!"304A314B";
        ubyte[] hexnumbytes = datain /* "16D8..." */
        .chunks(2) /* "16", "D8", ... */
        .map!(twoDigits => twoDigits.parse!ubyte(16)) /* 0x16, 0xD8, */
        .array();

        return hexnumbytes;
    }
    
    /**
     * convertAsciiStringToHexString - use a regular ascii string as input
     * 
     */
string convertAsciiStringToHexString(in string datain) {
        // TODO: add error handling
        return datain.format!("%(%02X%)");
    }

    /**
     * convertToHex - takes ubyte array and converts to hexidecimal representation
     *
     */
string convertUbytesToHexString(in ubyte[] datain) {
        // immutable(ubyte)[] b = a.representation;
        // string c = b.assumeUTF;

        // ubyte[] publicKey;
        
        // generateKey(publicKey);

        // string keyToHex;

        // auto keyToHex = to!string(publicKey);
        
        // auto hexdata = hexString!(keyToHex);

        // Some example ways to do conversions
        // 
        // format("%.2x", dat[i])
        
        // TODO: Add some error handling

        return convertAsciiStringToHexString(datain.assumeUTF);
    }


    /**
        generateHash (XXX rename this to genHash)

        Hash wrapper around libsodium crypto_generichash()

    */
ubyte[] genHash(const ubyte[] message) {
        ubyte[] hash = new ubyte[crypto_generichash_bytes()];

        // Method Signature
        // https://download.libsodium.org/doc/hashing/generic_hashing#single-part-example-without-a-key
        assert(crypto_generichash(hash.ptr, hash.length, message.ptr, message.length, null, 0) == 0);

        return hash;
    }
   
ubyte[] privateKey(ubyte[] datakey) {

        ubyte[] privatekey;
        ubyte[] signature;
        
        generateKey(datakey);

        ubyte[] keypair = datakey;

        ubyte[] hashedKey = genHash(keypair);

        storeKeyPair("privatekey", privatekey);

        return privatekey;
    }

    int storeKeyPair(string key, ubyte[] value) {

        auto db = new ddb("keypair.db");
        // DDDB only supports string values
        db.set(key, value.assumeUTF);
                
        // This variable will be returned
        // as long the commit works fine
        // if not, an error stream will
        // be thrown
        int commitStatus;
        // Use an assert declaration to
        // guarantee of the persistence
        // session or something associated
        // to it for holding the keypair
        // assert(initPersistenceSession == true);
        // writeln("Keypair successfully persistence");

        return commitStatus;
    }

enum ShellKeyPairFactoryError {
            OK,
            ERROR_INIT,
            ERROR_INPUT_INVALID,
            ERROR_INPUT_INVALID_PRIVATE_KEY,
            ERROR_INPUT_INVALID_PRIVATE_KEY_LENGTH_WRONG,
            ERROR_INPUT_INVALID_PRIVATE_KEY_NOT_HEXIDECIMAL,
            ERROR_FINALIZE
        }
public class ShellKeyPairFactory {
    public:
        
        this() {

        }
    

        static ShellKeyPair createKeyPair(string privatekeyhexencoded) {
            if (privatekeyhexencoded == null) {
                throw new ShellKeyPairFactoryException("Can't create keypair, reason: "~ShellKeyPairFactoryError.ERROR_INPUT_INVALID_PRIVATE_KEY);
            } else {
                return new ShellKeyPair();
            }
        }

        // Double check these args, might use ubyte[] instead
        static bool verifySignature(string publickey, string data, string signature) {
            return false;
        }

        /* -------- EXCEPTIONS ------------- */
 
        
}

class ShellKeyPairFactoryException : Exception {
            this(string msg) { super(msg); }
}

public class ShellKeyPair {
    public:
        this() {

        }

        string getPublicKey() {
            return "";
        }

        string getPrivateKey() {
            return "";
        }

        string getSignature() {
            return "";
        }
    
    private:
        void foo() {

        } 

        /**
        * Check if a private key is valid
        *
        * @param {string} privatekey - A private key
        *
        * @return {boolean} - True if valid, false otherwise
        */
        static bool isPrivateKeyValid(string privateKey) {
            if (privateKey.length != 64 && privateKey.length != 66) {
                writeln("Private key length must be 64 or 66 characters");
                // throw new ShellKeyPairFactoryException("Can't create keypair, reason: "~ShellKeyPairFactoryError.ERROR_INPUT_INVALID_PRIVATE_KEY_LENGTH_WRONG);
                
                return false;
            } else if (matchFirst(privateKey, regex(`0[xX][0-9a-fA-F]+`))) {
                // throw new ShellKeyPairFactoryException("Can't create keypair, reason: "~ShellKeyPairFactoryError.ERROR_INPUT_INVALID_PRIVATE_KEY_NOT_HEXIDECIMAL);
                writeln("Private key must be in hexadecimal format");
                return false;
            } else {
                writeln("Private key is valid hexadecimal");
                return true;
            }
        }
        unittest {
            auto res1 = isPrivateKeyValid("AA123AA123AA123AA123AA123AA123AA123AA123AA123AA123AA123AA123AA12");
            assert(res1 == true);
            res1 = isPrivateKeyValid("1000001000012222223012222223012222223012222223012222223011222223");
            // XXX This fails and should not, double check the regex
            // assert(res1 == true);
            // res1 = isPrivateKeyValid("0x1000001000012222223012222223012222223012222223012222223011222223");
            assert(res1 == true);
            res1 = isPrivateKeyValid("ZZZZZZZ");
            assert(res1 == false);
            res1 = isPrivateKeyValid("abcdefg123456789bcdefg123456789bcdefg123456789bcdefg123fg123456789");
            assert(res1 == true);
            res1 = isPrivateKeyValid("");
            assert(res1 == false);
        }
}    

unittest {
    ShellKeyPair kp1 = new ShellKeyPair();

    assert(kp1 !is null);

    auto ex1 = new ShellKeyPairFactoryException("Can't create keypair, reason: "~ShellKeyPairFactoryError.ERROR_INPUT_INVALID_PRIVATE_KEY);
    assert(ex1.msg == "Can't create keypair, reason: "~ShellKeyPairFactoryError.ERROR_INPUT_INVALID_PRIVATE_KEY);

    auto kp2 = ShellKeyPairFactory.createKeyPair("foobar");
    assert(kp2 !is null);
    
    
    
    /*
    ubyte[] keypair;
    generateHash(keypair);
    auto response = keypair;
    writeln("Stick 1:")
    writeln("Generated keypair: ");
    assert(response == "");

    ubyte[] genericHash;
    writeln("Stick 2:");
    writeln("Applied generic hash:");
    auto response = genericHash;
    assert(response == "");

    writeln("Stick 3:");
    writeln("Apply everything to hexString");

    auto dbSession = new ddb("yes.db");

    */

    
    
}
