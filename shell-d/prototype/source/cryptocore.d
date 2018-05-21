/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/
module shelld.cryptocore;
import deimos.sodium; // Read: https://sodium.dpldocs.info/wrapper.sodium.html

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

unittest {
    //
    // These tests just handle exercise of libsodium
    //
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