#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

go build -buildmode=pie -trimpath -o=${PREFIX}/bin/bsondump -ldflags="-X main.VersionStr=${PKG_VERSION} -s -w" ./bsondump/main/bsondump.go
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongodump -ldflags="-X main.VersionStr=${PKG_VERSION} -s -w" ./mongodump/main/mongodump.go
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongorestore -ldflags="-X main.VersionStr=${PKG_VERSION} -s -w" ./mongorestore/main/mongorestore.go
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongoimport -ldflags="-X main.VersionStr=${PKG_VERSION} -s -w" ./mongoimport/main/mongoimport.go
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongoexport -ldflags="-X main.VersionStr=${PKG_VERSION} -s -w" ./mongoexport/main/mongoexport.go
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongostat -ldflags="-X main.VersionStr=${PKG_VERSION} -s -w" ./mongostat/main/mongostat.go
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongotop -ldflags="-X main.VersionStr=${PKG_VERSION} -s -w" ./mongotop/main/mongotop.go
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongofiles -ldflags="-X main.VersionStr=${PKG_VERSION} -s -w" ./mongofiles/main/mongofiles.go
go-licenses save ./bsondump --save_path=license-files_bsondump
go-licenses save ./mongodump --save_path=license-files_mongodump
go-licenses save ./mongorestore --save_path=license-files_mongorestore
go-licenses save ./mongoimport --save_path=license-files_mongoimport
go-licenses save ./mongoexport --save_path=license-files_mongoexport
go-licenses save ./mongostat --save_path=license-files_mongostat
go-licenses save ./mongotop --save_path=license-files_mongotop
go-licenses save ./mongofiles --save_path=license-files_mongofiles
go clean -modcache
