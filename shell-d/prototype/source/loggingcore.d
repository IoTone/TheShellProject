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

module shelld.loggingcore;

import std.stdio;
import std.file : FileException, readText;
import std.exception;

import core.stdc.errno;
import shelld.persistence;

class GeneralShellException : Exception {

    
    this(string msg, string file = __FILE__, size_t line = __LINE__) {
        super(msg, file, line);
    }
    

    // string exceptionHandler = new GeneralShellException;
    
    string readErrorStream(string errorStream) {

        string outputError;
       
        return outputError;

    }

    string printErrorStream(string errorStream)
    {
        string outputError;
       
        return outputError;

    }

    string commitErrorStream(string errorStream) {

        string outputError;
       
        return outputError;

   }

   string retrieveErrorStream(string errorStream) {

       string outputError;
       
       return outputError;

   }
   

}
//throw new GeneralShellException("General Shell operation didn't get as expected");

class ConfigurationException : GeneralShellException {

    
    this(string msg, string file = __FILE__, size_t line = __LINE__) {
        super(msg, file, line);
    }
    

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

}
//throw new ConfigurationException("Crypto operation didn't get as expected");

class CryptocoreException : GeneralShellException {

    
    this(string msg, string file = __FILE__, size_t line = __LINE__) {
        super(msg, file, line);
    }
    
    // For some reason I'm getting
    // circular reference with this
    // instance declaration
    //CryptocoreException cryptoCoreErrorHandler = new CryptocoreException;

}
//throw new CryptocoreException("Crypto operation didn't get as expected");

unittest {}