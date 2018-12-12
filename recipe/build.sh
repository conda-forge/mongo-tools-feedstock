# Use upstream gopath setup
. ./set_gopath.sh

# Disable mongoreplay since we don't have libpcap
sed -i 's/mongoreplay//' build.sh

# Build binaries
export CGO_ENABLED=0
./build.sh

# Move binaries in place
mkdir -p $PREFIX/bin
mv bin/* $PREFIX/bin
