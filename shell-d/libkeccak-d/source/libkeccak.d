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
module iotone.libkeccak;

import core.stdc.config;
import core.stdc.stdint;


//
// Major code debt/inspiration goes to https://github.com/coruus/keccak-tiny
// for the super minified C code library
// All data output can be hex encoded using preferred method
// 
enum RET
{
    OK                          =   0,
    ERROR_INIT                  =   -1,
    ERROR_INPUT_INVALID         =   -2,
    ERROR_FINALIZE              =   -3
}

nothrow extern (C)
{
    /*
	int init_mdns_service(const char* name, const char* type, const char *domain, int port, const char* txt);
	int update_txt_record(const char* txt, int isEventLoopActive);
	int resolve_mdns_service(int isEventLoopActive);
	int add_mdns_service(const char* txt, int isEventLoopActive);
	int create_mdns_service_conn();
	int release_mdns_service();
	int sprintf(char *s, const char *format, ...);
    */

    int shake128(uint8_t*, size_t /* bytes */, const uint8_t*, size_t);
    int shake256(uint8_t*, size_t /* bytes */, const uint8_t*, size_t);

    int sha3_224(uint8_t*, size_t /* bytes */, const uint8_t*, size_t);
    int sha3_256(uint8_t*, size_t /* bytes */, const uint8_t*, size_t);
    int sha3_384(uint8_t*, size_t /* bytes */, const uint8_t*, size_t);
    int sha3_512(uint8_t*, size_t /* bytes */, const uint8_t*, size_t);

    int keccak_224(uint8_t*, size_t /* bytes */, const uint8_t*, size_t);
    int keccak_256(uint8_t*, size_t /* bytes */, const uint8_t*, size_t);
    int keccak_384(uint8_t*, size_t /* bytes */, const uint8_t*, size_t);
    int keccak_512(uint8_t*, size_t /* bytes */, const uint8_t*, size_t);
};




unittest {
    import std.stdio;
    import std.string;

    //
    // Including simple+efficient ubyte2hex converter
    // from https://forum.dlang.org/post/opsfp9hj065a2sq9@digitalmars.com
    //
    const char[16] hexdigits = "0123456789abcdef";
    char[] hexStringT(ubyte[] d) {
        char[] result;

        /* No point converting an empty array now is there? */
        if (d.length != 0) {
            ubyte u;
            uint sz = u.sizeof*2; /* number of chars required to represent one 'u' */
            uint ndigits = 0;

            /* pre-allocate space required. */
            result = new char[sz*d.length];
            
            /* start at end of resulting string, loop back to start. */
            for(int i = cast(int)d.length-1; i >= 0; i--) {
                /*this loop takes the remainder of u/16, uses it as an index
                into the hexdigits array, then does u/16, repeating
                till u == 0
                */
                u = d[i];
                for(; u; u /= 16) {
                    /* you can use u & 15 or u % 16 below
                    both give you the remainder of u/16
                    */
                    result[result.length-1-ndigits] = hexdigits[u & 15];
                    ndigits++;
                }
                
                /* Pad each value with 0's */
                for(; ndigits < (d.length-i)*sz; ndigits++)
                    result[result.length-1-ndigits] = '0';
            }
        }

        return result;
    }

    ubyte[28] dataout28;
    ubyte[32] dataout32;
    ubyte[48] dataout48;
    ubyte[56] dataout56;
    ubyte[64] dataout64;
    ubyte[128] dataout128;
    ubyte[256] dataout256;
    ubyte[] datain = cast(ubyte[])("The quick brown fox jumps over the lazy dog".dup);
    ubyte[] datain2 = cast(ubyte[])("".dup);
    ubyte[] datain3 = cast(ubyte[])("The quick brown fox jumps over the lazy dog.".dup);
    

    // A basic example
    shake256(dataout32.ptr, 32 /* bytes */, datain.ptr, datain.length);
    assert(dataout32.length == 32);
    writeln(dataout32);
    // writeln(hexStringT(dataout32));
    assert(hexStringT(dataout32) == "2f671343d9b2e1604dc9dcf0753e5fe15c7c64a0d283cbbf722d411a0e36f6ca");

    sha3_512(dataout64.ptr, 64, datain2.ptr, datain2.length);
    assert(dataout64.length == 64);
    writeln(dataout64);
    assert(hexStringT(dataout64) == "a69f73cca23a9ac5c8b567dc185a756e97c982164fe25859e0d1dcc1475c80a615b2123af1f5f94c11e3e9402c3ac558f500199d95b6d3e301758586281dcd26");

    
    sha3_512(dataout64.ptr, 64, datain.ptr, datain.length);
    assert(dataout64.length == 64);
    writeln(dataout64);
    assert(hexStringT(dataout64) == "01dedd5de4ef14642445ba5f5b97c15e47b9ad931326e4b0727cd94cefc44fff23f07bf543139939b49128caf436dc1bdee54fcb24023a08d9403f9b4bf0d450");

    sha3_512(dataout64.ptr, 64, datain3.ptr, datain3.length);
    assert(dataout64.length == 64);
    writeln(dataout64);
    assert(hexStringT(dataout64) == "18f4f4bd419603f95538837003d9d254c26c23765565162247483f65c50303597bc9ce4d289f21d1c2f1f458828e33dc442100331b35e7eb031b5d38ba6460f8");

    sha3_384(dataout48.ptr, 48, datain2.ptr, datain2.length);
    assert(dataout48.length == 48);
    writeln(dataout48);
    assert(hexStringT(dataout48) == "0c63a75b845e4f7d01107d852e4c2485c51a50aaaa94fc61995e71bbee983a2ac3713831264adb47fb6bd1e058d5f004");

    sha3_384(dataout48.ptr, 48, datain.ptr, datain.length);
    assert(dataout48.length == 48);
    writeln(dataout48);
    assert(hexStringT(dataout48) == "7063465e08a93bce31cd89d2e3ca8f602498696e253592ed26f07bf7e703cf328581e1471a7ba7ab119b1a9ebdf8be41");

    sha3_384(dataout48.ptr, 48, datain3.ptr, datain3.length);
    assert(dataout48.length == 48);
    writeln(dataout48);
    assert(hexStringT(dataout48) == "1a34d81695b622df178bc74df7124fe12fac0f64ba5250b78b99c1273d4b080168e10652894ecad5f1f4d5b965437fb9");

    sha3_256(dataout32.ptr, 32, datain2.ptr, datain2.length);
    assert(dataout32.length == 32);
    writeln(dataout32);
    assert(hexStringT(dataout32) == "a7ffc6f8bf1ed76651c14756a061d662f580ff4de43b49fa82d80a4b80f8434a");

    sha3_256(dataout32.ptr, 32, datain.ptr, datain.length);
    assert(dataout32.length == 32);
    writeln(dataout32);
    assert(hexStringT(dataout32) == "69070dda01975c8c120c3aada1b282394e7f032fa9cf32f4cb2259a0897dfc04");

    sha3_256(dataout32.ptr, 32, datain3.ptr, datain3.length);
    assert(dataout32.length == 32);
    writeln(dataout32);
    assert(hexStringT(dataout32) == "a80f839cd4f83f6c3dafc87feae470045e4eb0d366397d5c6ce34ba1739f734d");

    sha3_224(dataout28.ptr, 28, datain2.ptr, datain2.length);
    assert(dataout28.length == 28);
    writeln(dataout28);
    assert(hexStringT(dataout28) == "6b4e03423667dbb73b6e15454f0eb1abd4597f9a1b078e3f5b5a6bc7");

    sha3_224(dataout28.ptr, 28, datain.ptr, datain.length);
    assert(dataout28.length == 28);
    writeln(dataout28);
    assert(hexStringT(dataout28) == "d15dadceaa4d5d7bb3b48f446421d542e08ad8887305e28d58335795");

    sha3_224(dataout28.ptr, 28, datain3.ptr, datain3.length);
    assert(dataout28.length == 28);
    writeln(dataout28);
    assert(hexStringT(dataout28) == "2d0708903833afabdd232a20201176e8b58c5be8a6fe74265ac54db0");

    shake128(dataout32.ptr, 32 /* bytes */, datain2.ptr, datain2.length);
    assert(dataout32.length == 32);
    writeln(dataout32);
    assert(hexStringT(dataout32) == "7f9c2ba4e88f827d616045507605853ed73b8093f6efbc88eb1a6eacfa66ef26");

    shake256(dataout64.ptr, 64 /* bytes */, datain2.ptr, datain2.length);
    assert(dataout64.length == 64);
    writeln(dataout64);
    assert(hexStringT(dataout64) == "46b9dd2b0ba88d13233b3feb743eeb243fcd52ea62b81b82b50c27646ed5762fd75dc4ddd8c0f200cb05019d67b592f6fc821c49479ab48640292eacb3b7c4be");

    keccak_512(dataout64.ptr, 64, datain2.ptr, datain2.length);
    assert(dataout64.length == 64);
    writeln(dataout64);
    assert(hexStringT(dataout64) == "0eab42de4c3ceb9235fc91acffe746b29c29a8c366b7c60e4e67c466f36a4304c00fa9caf9d87976ba469bcbe06713b435f091ef2769fb160cdab33d3670680e");

    keccak_512(dataout64.ptr, 64, datain.ptr, datain.length);
    assert(dataout64.length == 64);
    writeln(dataout64);
    assert(hexStringT(dataout64) == "d135bb84d0439dbac432247ee573a23ea7d3c9deb2a968eb31d47c4fb45f1ef4422d6c531b5b9bd6f449ebcc449ea94d0a8f05f62130fda612da53c79659f609");

    keccak_512(dataout64.ptr, 64, datain3.ptr, datain3.length);
    assert(dataout64.length == 64);
    writeln(dataout64);
    assert(hexStringT(dataout64) == "ab7192d2b11f51c7dd744e7b3441febf397ca07bf812cceae122ca4ded6387889064f8db9230f173f6d1ab6e24b6e50f065b039f799f5592360a6558eb52d760");

    keccak_384(dataout48.ptr, 48, datain2.ptr, datain2.length);
    assert(dataout48.length == 48);
    writeln(dataout48);
    assert(hexStringT(dataout48) == "2c23146a63a29acf99e73b88f8c24eaa7dc60aa771780ccc006afbfa8fe2479b2dd2b21362337441ac12b515911957ff");

    keccak_384(dataout48.ptr, 48, datain.ptr, datain.length);
    assert(dataout48.length == 48);
    writeln(dataout48);
    assert(hexStringT(dataout48) == "283990fa9d5fb731d786c5bbee94ea4db4910f18c62c03d173fc0a5e494422e8a0b3da7574dae7fa0baf005e504063b3");

    keccak_384(dataout48.ptr, 48, datain3.ptr, datain3.length);
    assert(dataout48.length == 48);
    writeln(dataout48);
    assert(hexStringT(dataout48) == "9ad8e17325408eddb6edee6147f13856ad819bb7532668b605a24a2d958f88bd5c169e56dc4b2f89ffd325f6006d820b");

    keccak_256(dataout32.ptr, 32 /* bytes */, datain2.ptr, datain2.length);
    assert(dataout32.length == 32);
    writeln(dataout32);
    assert(hexStringT(dataout32) == "c5d2460186f7233c927e7db2dcc703c0e500b653ca82273b7bfad8045d85a470");

    keccak_256(dataout32.ptr, 32 /* bytes */, datain.ptr, datain.length);
    assert(dataout32.length == 32);
    writeln(dataout32);
    assert(hexStringT(dataout32) == "4d741b6f1eb29cb2a9b9911c82f56fa8d73b04959d3d9d222895df6c0b28aa15");

    keccak_256(dataout32.ptr, 32 /* bytes */, datain3.ptr, datain3.length);
    assert(dataout32.length == 32);
    writeln(dataout32);
    assert(hexStringT(dataout32) == "578951e24efd62a3d63a86f7cd19aaa53c898fe287d2552133220370240b572d");

    keccak_224(dataout28.ptr, 28, datain2.ptr, datain2.length);
    assert(dataout28.length == 28);
    writeln(dataout28);
    assert(hexStringT(dataout28) == "f71837502ba8e10837bdd8d365adb85591895602fc552b48b7390abd");

    keccak_224(dataout28.ptr, 28, datain.ptr, datain.length);
    assert(dataout28.length == 28);
    writeln(dataout28);
    assert(hexStringT(dataout28) == "310aee6b30c47350576ac2873fa89fd190cdc488442f3ef654cf23fe");

    keccak_224(dataout28.ptr, 28, datain3.ptr, datain3.length);
    assert(dataout28.length == 28);
    writeln(dataout28);
    assert(hexStringT(dataout28) == "c59d4eaeac728671c635ff645014e2afa935bebffdb5fbd207ffdeab");
}