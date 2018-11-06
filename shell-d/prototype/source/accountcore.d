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
import core.stdc.stdint;

import shelld.cryptocore;
import shelld.keypair;
import shelld.persistence;
import shelld.loggingcore;



/**
 * Some design questions:
 * - Should we store ubyte[] internally?
 * - Should we provide convenience methods to quickly do the ubytes<->string conversion
 * - number formats for storing value ... how big do we need to go?  Do we ever need to store a negative value for balances?
 * - What are limits on sizes of various fields?  These should be documented and enforced
 * - create an Interface later.  Implement that Interface.  Interfaces can be nice for IDL and generating code, also allows us a cleaner design
 *
 * Intermediate decisions:
 * - use string internally, cut over to ubyte[] later in next iteration
 * - balances are assumed to be positive, and therefore we could use uint32.  I guess the question is what is the max balance possible?
 * Don't know that answer, need to look at the spec.  For now just use double.
 * - Adding in a friendly account name, used for internal referencing to accounts.  An app might use this internally.  Cloud services might use this.
 * This is likely to get abused at Internet scale (people posting racist names), however I counterbalance this with the notion that TheShellProject
 * is going to be used by machines and entperises and isn't intended for local yokels.
 * - Don't make decisions on internal field lengths yet, though this is dictated by the spec
 * - Implement as a class right now
 * - adding a metadata namespace component, can be external namespace URI used for transaction metadata (not carried in the block)
 */
public class Account {
    protected:

        string mPublicKey;
        string mFriendlyName;
        string mAddress;
        uint64_t mHeight;
        double mBalance;
        double mVestedBalance;
        double mPOI;
        string mMetadataNamespace;

        int[] accountBlocksIndex;
        int[] consensusIndex;
        double accountBalance;
        int[] harvestedBlocks;
        int  transactionPerBlock;
        ubyte[] checkSum;
        ubyte[] networkPoolID;

    public:
        this() {
            // Basic constructor
        }

        string getAddress() {
            return mAddress;
        }
        void setAddress(string address) {
            mAddress = address;
        }
        string getFriendlyName() {
            return mFriendlyName;
        }
        void setFriendlyName(string friendlyName) {
            mFriendlyName = friendlyName;
        }
        string getPublicKey() {
            return mPublicKey;
        }
        void setPublicKey(string publicKey) {
            mPublicKey = publicKey;
        }
        uint64_t getHeight() {
            return mHeight;
        }
        void setHeight(uint64_t height) {
            mHeight = height;
        }
        double getBalance() {
            return mBalance;
        }
        void setBalance(double balance) {
            mBalance = balance;
        }
        double getVestedBalance() {
            return mVestedBalance;
        }
        void setVestedBalance(double vestedbalance) {
            mVestedBalance = vestedbalance;
        }
        double getPOI() {
            return mPOI;
        }
        void setPOI(double poi) {
            mPOI = poi;
        }
        string getMetadataNamespace() {
            return mMetadataNamespace;
        }
        void setMetadataNamespace(string metadatanamespace) {
            mMetadataNamespace = metadatanamespace;
        }
}

struct AccountStructDepr {
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

    unittest {
        string validaddress = "NCKZD7-JGDLND-IVVPH6-U2PG2Q-KD3PX3-FX4CPZ-MF2A";
        string validPublicKey = "d22b047b670fd32ad9fa421a37415ab0677a786b916cad34820bcd395066cd49
";
        string friendlyname = "BabaSim's Account";
        string metadatanamespace = "ccnx:/ldp.iotone.io/pg/default/peers/transaction/1234";
        uint64_t validheight = 1875151;
        immutable double startingbalance = 6956.388885;
        immutable double vestedbalance = 1006.388885;
        immutable double poi = 10;
        Account a1 = new Account();
        assert(a1 !is null);
        a1.setAddress(validaddress);
        assert(a1.getAddress() == validaddress);
        a1.setFriendlyName(friendlyname);
        assert(a1.getFriendlyName() == friendlyname);
        a1.setPublicKey(validPublicKey);
        assert(a1.getPublicKey() == validPublicKey);
        a1.setHeight(validheight);
        assert(a1.getHeight() == validheight);
        a1.setBalance(startingbalance);
        assert(a1.getBalance() == startingbalance);
        a1.setVestedBalance(vestedbalance);
        assert(a1.getVestedBalance() == vestedbalance);
        a1.setPOI(poi);
        assert(a1.getPOI() == poi);
        a1.setMetadataNamespace(metadatanamespace);
        assert(a1.getMetadataNamespace() == metadatanamespace);
    }


