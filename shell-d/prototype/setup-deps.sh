#!/bin/sh

cd external

#
# This is how to build a standard C or C++ library
# wget https://github.com/jedisct1/libsodium/releases/download/1.0.3/libsodium-1.0.3.tar.gz
# tar -xvf libsodium-1.0.3.tar.gz
# cd libsodium-1.0.3
# ./configure --host=$TARGET
# make


# This grabs rocksdb
# It does not build it.  Do that manually
#
# cd ..
wget -O rocksdb-v5.12.4.tar.gz https://github.com/facebook/rocksdb/archive/v5.12.4.tar.gz
tar -xvf rocksdb-v5.12.4.tar.gz
cd rocksdb-5.12.4
mkdir -p build && cd build && cmake .. && make
cd ..
cd ..

# This grabs rocksdb
# This grabs the rocksdb d wrapper library
# It does not build it.  It assumes the d build will do that
#
wget -O rocksdb.zip https://github.com/IoTone/rocksdb/archive/master.zip
unzip rocksdb.zip
cd ..

# We good
cd ..
