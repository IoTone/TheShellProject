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
import dddb;
// import rocksdb;

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
            //
            // XXX This is failing with gdc
            //
            // std.file.write(SHELL_DB, toJSON(jsondata)); // XXX Add exception handling
            writeln("SHELL_DB file does not exist, created, and loaded a dummy default ", datastr);
        } else {
            datastr = std.file.readText(SHELL_DB);
        }

        jsondata = parseJSON(datastr);
        writeln("SHELL_DB read ", jsondata.toPrettyString());
        return jsondata;
    }
/* 
    unittest {
        import std.conv : to;
        auto jsondata = shelldb.load_db();
        assert(!jsondata.isNull);

        // writeln(jsondata.type);
        // assert(jsondata.type == JSON_TYPE.OBJECT);
        // assert("crypto" in jsondata.object);
        // JSONValue jsondata2 = `{ "foo" : 1, "bar": 1, "crypto": 0, "cars": 1, "cats": -1}`;
        // shelldb.write_db(jsondata2);
        // jsondata = shelldb.load_db();
        // assert("cats" in jsondata);

        auto opts = new DBOptions;
        opts.createIfMissing = true;
        opts.errorIfExists = false;

        auto db = new Database(opts, "testdb");

        // Put a value into the database
        db.putString("key", "value");

        // Get a value out
        assert(db.getString("key") == "value");

        ubyte[] key = ['\x00', '\x00'];
        // Delete a value
        db.remove(key);

        // Add values in bulk
        auto batch = new WriteBatch;
        for (int i = 0; i < 1000; i++) {
        batch.putString(i.to!string, i.to!string);
        }
        db.write(batch);

        // Iterate over the DB
        auto iter = db.iter();
        foreach (key, value; iter) {
        db.remove(key);
        }
        destroy(iter);

        // Close the database
        db.close();
    } */

    unittest {
auto db = new ddb("yes.db");
    

    // set multiple values to social_networks
    db.set("social_networks", "facebook");
    db.set("social_networks", "twitter");
    db.set("social_networks", "linkedin");

    writeln(db.get("social_networks"));
    // ["facebook", "twitter", "linkedin"]

    writeln(db.count("social_networks"));
    // will return 3, because we have add ["facebook", "twitter", "linkedin"]

    assert(db.count("social_networks") == 3);
    // no error because there are 3 ["facebook", "twitter", "linkedin"]

    db.update("social_networks", "facebook", "instagram");
    // update facebook to instagram 
    writeln(db.get("social_networks"));
    // ["instagram", "twitter", "linkedin"]

    assert(db.countkeys() == 1);
    writeln(db.getkeys()); 
    // db.getkeys() return a list of all keys,
    // ["social_networks"]

    assert(db.getsize() == 54);
    writeln(db.getsize());
    // db.getsize() return the database size in bytes
    // 58
    

    assert(db.havevalue("social_networks", "facebook") == false);
    writeln(db.havevalue("social_networks", "facebook")); // expected false
    // because facebook not exists in social_networks, we update it with instagram in line 240

    assert(db.havevalue("social_networks", "instagram") == true);
    writeln(db.havevalue("social_networks", "instagram")); // expected true 
    // true 


    // db.drop() delete database 
    // NOTE: all db data will be lost
    db.drop();
    assert(exists(db.db) == false);
    }
}
