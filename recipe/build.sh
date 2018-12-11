# Git Initialize
# Apps tend to use git info to create version string
git init
git config --local user.email "conda@conda-forge.github.io"
git config --local user.name "conda-forge"

echo $PKG_VERSION >> .conda_version
git add .conda_version
git commit -m "conda build of $PKG_NAME-r$PKG_VERSION"
git tag -a -m "conda build of $PKG_NAME-r$PKG_VERSION" r${PKG_VERSION}

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
