/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/

module shelld.loggingcore;

import std.stdio;
import std.file : FileException, readText;

import core.stdc.errno;
import shelld.persistence;

class GeneralShellException : Exception {
    this(string msg) { super(msg); }
    // auto exceptionHandler = new GeneralShellException;
    
    string readErrorStream(string err) {
        return null; // If you put in a return type it must return something
    }

    string printErrorStream()
    { 
        return null; // If you put in a return type it must return something
    }

    auto commitErrorStream() {

    }
    // Don't check in half baked ideas that don't compile please
    /*
   auto retrieveErrorStream(auto errFile) {

   }
   */

}

class ConfigurationException : GeneralShellException {
    this(string msg) { super(msg); }
}

class CryptocoreException : GeneralShellException {
    this(string msg) { super(msg); }
}

unittest {}