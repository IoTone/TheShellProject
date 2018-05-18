/**
#
#Copyright (c) 2018 IoTone, Inc. All rights reserved.
#
**/
module shelld.persistence;

import std.stdio;
import std.string;
import std.file;
import std.json;


//
// XXX TODO: Fix this.  It doesn't work well
// Reads the file, but when writing the JSON, it writes quotes!!!
//
class shelldb {
    static const auto SHELL_DB = "shell_db.json"; // this is the filename
                    
    //
    // Not thread safe
    // TODO: Fix improper serialization of string to file (all json is quoted)
    // TODO: add atomic operations
    // TODO: implement a singleton that ensures we only
    // have one handle to the db
    // TODO: Implement a configurable peristence layer
    // TODO: Add a decent enterprise logger
    // TODO: Switch to a better JSON library
    static void write_db(JSONValue jsondata) {
        immutable jsonstr = jsondata.toString();
        std.file.write(SHELL_DB, jsonstr);
    }
    
    static JSONValue load_db() {
        auto datastr = `{ "foo" : 1, "bar": 1, "crypto": 0, "cars": 1}`;
        auto jsondata = parseJSON("{}");
        if (!exists(SHELL_DB.dup)) {
            jsondata = parseJSON(datastr);
            std.file.write(SHELL_DB, toJSON(jsondata)); // XXX Add exception handling
            writeln("SHELL_DB file does not exist, created, and loaded a dummy default ", datastr);
        } else {
            datastr = std.file.readText(SHELL_DB);
        }

        jsondata = parseJSON(datastr);
        writeln("SHELL_DB read ", jsondata.toPrettyString());
        return jsondata;
    }

    unittest {
        auto jsondata = shelldb.load_db();
        assert(!jsondata.isNull);
        /*
        writeln(jsondata.type);
        // assert(jsondata.type == JSON_TYPE.OBJECT);
        assert("crypto" in jsondata.object);
        JSONValue jsondata2 = `{ "foo" : 1, "bar": 1, "crypto": 0, "cars": 1, "cats": -1}`;
        shelldb.write_db(jsondata2);
        jsondata = shelldb.load_db();
        assert("cats" in jsondata);
        */
    }
}