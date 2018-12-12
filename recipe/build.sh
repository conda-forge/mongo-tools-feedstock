# Use upstream gopath setup
. ./set_gopath.sh

# Disable mongoreplay since we don't have libpcap
if [ $(uname) == "Darwin" ]; then
    sed -i 's/mongoreplay//' build.sh
else
    export CGO_ENABLED=1
    export CGO_CFLAGS=-I${PREFIX}/include
    export CGO_LDFLAGS=-L${PREFIX}/lib
fi

# Build binaries
./build.sh

# Move binaries in place
mkdir -p $PREFIX/bin
mv bin/* $PREFIX/bin
