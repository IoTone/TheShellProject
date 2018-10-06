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
module shelld.cryptocore;

import deimos.sodium; // Read: https://sodium.dpldocs.info/wrapper.sodium.html
import std.digest.ripemd;
import std.digest.md;
import std.stdio;
//
// Some thoughts:
//
// This can be the place to expose any other crypto libraries 
// using dlangs FFI via nothrow extern (C) as wrappers
// around any libraries that are linked in.
// To link in a new c library, precompile the library,
// and then link it in using lflags and libs in the dub.json
//
// If needed, we can precompile .so or .dlls and put them into 
// a top level libs directory.
//
// For now, we've got the basic libsodium exposed.
// If the documented set of apis that are wrapped are not
// enough, you'll need to look into further how to use
// the sodium library and demios wrapper.  
// https://github.com/carblue/sodium/blob/master/README.md
//
ubyte[] applyRipemd160(ubyte[] datain) {

	ubyte[] appliedRipemd;
	auto md = new RIPEMD160Digest();
	ubyte[] hash = md.digest(datain);
	writeln(toHexString(hash)); // "8EB208F7E05D987A9B044A8E98C6B087F15A0BFC"

	//Feeding data
	ubyte[1024] data;
	md.put(data[]);
	md.reset(); //Start again
	md.put(data[]);
	hash = md.finish();
	// XXX This is an error ... RIPEMD160 datain;
	/*
	appliedRipemd = datain;

	appliedRipemd.start();
	*/
	return hash;
}

unittest {
    //
    // These tests just handle exercise of libsodium
    //
	ubyte[crypto_aead_aes256gcm_KEYBYTES]  testdata;
    randombytes_buf(testdata.ptr, testdata.length);
	applyRipemd160(testdata);

	import std.stdio : writefln, writeln;
    assert(sodium_init != -1);
    // Borrow from : https://github.com/carblue/sodium/blob/master/example/source/app.d#L16
    // Manual sodium, chapter "Generating random data":
	ubyte[8] buf;
	if (buf.length <= 256) // limit, that linux guarantees by default, using getrandom(); figure can be higher with added True Random Number Generator
		randombytes_buf(buf.ptr, buf.length);
    writefln("Unpredictable sequence of %s bytes: %s", buf.length, buf);

    // Borrow from https://github.com/carblue/sodium/blob/master/example/source/app.d#L23
    // Secret-key authentication example
	auto MESSAGE = cast(immutable(ubyte)[4]) "test";

	if (crypto_aead_aes256gcm_is_available) {
		writeln("crypto_aead_aes256gcm_is_available");
		auto ADDITIONAL_DATA = cast(immutable(ubyte)[6]) "123456";
		ubyte[crypto_aead_aes256gcm_NPUBBYTES] nonce;
		ubyte[crypto_aead_aes256gcm_KEYBYTES]  key;
		ubyte[MESSAGE.length + crypto_aead_aes256gcm_ABYTES] ciphertext;
		ulong ciphertext_len;

		randombytes_buf(key.ptr, key.length);
		randombytes_buf(nonce.ptr, nonce.length);

		crypto_aead_aes256gcm_encrypt(ciphertext.ptr, &ciphertext_len,
                                  MESSAGE.ptr, MESSAGE.length,
                                  ADDITIONAL_DATA.ptr, ADDITIONAL_DATA.length,
                                  null, nonce.ptr, key.ptr);

		writeln("ciphertext: ", ciphertext);
		ubyte[MESSAGE.length] decrypted;
		ulong decrypted_len;
		if (ciphertext_len < crypto_aead_aes256gcm_ABYTES ||
			crypto_aead_aes256gcm_decrypt(decrypted.ptr, &decrypted_len,
                                    null,
                                    ciphertext.ptr, ciphertext_len,
                                    ADDITIONAL_DATA.ptr,
                                    ADDITIONAL_DATA.length,
                                    nonce.ptr, key.ptr) != 0) {
			writeln("The message has been forged!");
		}
	}
	else {
		writeln("NOT crypto_aead_aes256gcm_is_available");
		ubyte[crypto_auth_KEYBYTES] key;
		ubyte[crypto_auth_BYTES]    mac;

		randombytes_buf(key.ptr, key.length);
		crypto_auth(mac.ptr, MESSAGE.ptr, MESSAGE.length, key.ptr);


		if (crypto_auth_verify(mac.ptr, MESSAGE.ptr, MESSAGE.length, key.ptr) != 0) {
			writeln("The message has been forged!");
        } else {
            writeln("The message is authentic");
        }
    }
}