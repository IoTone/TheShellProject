/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/

module shelld.loggingcore;

import std.stdio;
import std.file : FileException, readText;
import std.exception;

import core.stdc.errno;
import shelld.persistence;

class GeneralShellException : Exception {
<<<<<<< HEAD

    /*
    this(string msg, string file = __FILE__, size_t line = __LINE__) {
        super(msg, file, line);
    }
    */

    GeneralShellException exceptionHandler = new GeneralShellException;
    
    string readErrorStream(string errorStream) {

    }

    string printErrorStream(string errorStream)
    {

=======
    this(string msg) { super(msg); }
    // auto exceptionHandler = new GeneralShellException;
    
    string readErrorStream(string err) {
        return null; // If you put in a return type it must return something
    }

    string printErrorStream()
    { 
        return null; // If you put in a return type it must return something
>>>>>>> 14884fa8aab38144f4474eb13ee37ab999377a52
    }

    string commitErrorStream(string errorStream) {

<<<<<<< HEAD
   }

   string retrieveErrorStream(string errorStream) {
=======
    }
    // Don't check in half baked ideas that don't compile please
    /*
   auto retrieveErrorStream(auto errFile) {
>>>>>>> 14884fa8aab38144f4474eb13ee37ab999377a52

   }
   */

}
//throw new GeneralShellException("General Shell operation didn't get as expected");

class ConfigurationException : GeneralShellException {
<<<<<<< HEAD

    /*
    this(string msg, string file = __FILE__, size_t line = __LINE__) {
        super(msg, file, line);
    }
    */

    // Here would be nice to specify
    // the OS being in use, so any
    // divergence in the local sys
    // configurations could be addressed
    // right the way.
    // Directives to identify the 
    // OS will be entry point.

    // Refers to Windows environmental 
    // variable to detect issues from
    // this OS    
    // auto const MSWindows = new ;
    
    // Refers to macOS environmental 
    // variable to detect issues from
    // this OS    
    // auto const macOS = new ...;

    // Refers to Linux environmental 
    // variable to detect issues from
    // this OS    
    // auto const Unix = new ...;

=======
    this(string msg) { super(msg); }
>>>>>>> 14884fa8aab38144f4474eb13ee37ab999377a52
}
//throw new ConfigurationException("Crypto operation didn't get as expected");

class CryptocoreException : GeneralShellException {
<<<<<<< HEAD

    /*
    this(string msg, string file = __FILE__, size_t line = __LINE__) {
        super(msg, file, line);
    }
    */
    // For some reason I'm getting
    // circular reference with this
    // instance declaration
    //CryptocoreException cryptoCoreErrorHandler = new CryptocoreException;

=======
    this(string msg) { super(msg); }
>>>>>>> 14884fa8aab38144f4474eb13ee37ab999377a52
}
//throw new CryptocoreException("Crypto operation didn't get as expected");

unittest {}