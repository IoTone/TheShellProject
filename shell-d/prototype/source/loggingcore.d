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

    auto commitErrorStream() {

   }

   auto retrieveErrorStream(auto errFile) {

   }

}

class ConfigurationException : GeneralShellException {

}

class CryptocoreException : GeneralShellException {
    
}

unittest {}