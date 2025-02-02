#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

install_bin() {
    bin_name=$1
    go build -buildmode=pie -trimpath -o=${PREFIX}/bin/${bin_name} -ldflags="-X main.VersionStr=${PKG_VERSION} -s -w" ./${bin_name}/main/${bin_name}.go
    go-licenses save ./${bin_name} --save_path=license-files_${bin_name}
}

export -f install_bin

bin_names=(
    bsondump
    mongodump
    mongorestore
    mongoimport
    mongoexport
    mongostat
    mongotop
    mongofiles
)

echo ${bin_names[@]} | tr ' ' '\n' | xargs -I % bash -c "install_bin %"

go clean -modcache
