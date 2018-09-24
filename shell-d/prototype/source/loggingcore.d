/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/

module loggingcore;

import std.stdio;
import std.file : FileException, readText;

import core.stdc.errno;
import shelld.persistence;

class GeneralShellException : Exception {

    auto exceptionHandler = new GeneralShellException;
    
    string readErrorStream(string err) {

    }

    string printErrorStream()
    {

    }

    string commitErrorStream() {

   }

   string retrieveErrorStream(auto errFile) {

   }

}

class ConfigurationException : GeneralShellException {

    // Here would be nice to specify
    // the OS being in use, so any
    // divergence in the local sys
    // configurations could be addressed
    // right the way.
    // Directives to identify the 
    // OS will be entry point.

    auto MSWindows = new ...;

    auto macOS = new ...;

    auto Unix = new ...;

}

class CryptocoreException : GeneralShellException {

}

unittest {}