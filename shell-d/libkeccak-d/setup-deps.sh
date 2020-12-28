#
# We use a fork that has specific fixes checked into the build
#
wget -O libkeccak-tiny.zip https://github.com/IoTone/keccak-tiny/archive/singlefile.zip
unzip libkeccak-tiny.zip
cd keccak-tiny-singlefile
sh ./simple_do.sh
cp libkeccak-tiny* ..
cd ..
