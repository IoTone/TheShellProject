#!/bin/sh

cd external

#
# This is how to build a standard C or C++ library
# wget -O libsodium-1.0.18.tar.gz https://download.libsodium.org/libsodium/releases/libsodium-1.0.18-stable.tar.gz
# tar -xvf libsodium-1.0.18.tar.gz
# cd libsodium-stable
# ./configure
# make
# sudo make install
# Build libraries will be under
# 


# This grabs rocksdb
# It does not build it.  Do that manually
#
# cd ..
# wget -O rocksdb-v5.12.4.tar.gz https://github.com/facebook/rocksdb/archive/v5.12.4.tar.gz
# tar -xvf rocksdb-v5.12.4.tar.gz
# cd rocksdb-5.12.4
# mkdir -p build && cd build && cmake .. && make
# cd ..
# cd ..

# This grabs rocksdb
# This grabs the rocksdb d wrapper library
# It does not build it.  It assumes the d build will do that
#
# wget -O rocksdb.zip https://github.com/IoTone/rocksdb/archive/master.zip
# unzip rocksdb.zip
# cd rocksdb-master
# cd ..

#
# We use a fork that has specific fixes checked into the build
#
wget -O libkeccak-tiny.zip https://github.com/IoTone/keccak-tiny/archive/singlefile.zip
unzip libkeccak-tiny.zip
cd keccak-tiny-singlefile
sh ./simple_do.sh
cp libkeccak-tiny* ../../../libkeccak-d
# cp libkeccak-tiny* ../../../../libkeccak-d

# cd ..
cd ../..

# We good
cd ..
