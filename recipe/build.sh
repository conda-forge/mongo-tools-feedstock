pushd src/github.com/mongodb/mongo-tools

# Use upstream gopath setup
. ./set_goenv.sh
set_goenv

export CGO_ENABLED=1
export CGO_CFLAGS="${CPPFLAGS:-} ${CFLAGS:-} -I${PREFIX}/include"
export CGO_LDFLAGS="${LDFLAGS:-} -L${PREFIX}/lib"

# Build binaries
./build.sh ssl

# Move binaries in place
mkdir -p $PREFIX/bin
mv bin/* $PREFIX/bin
