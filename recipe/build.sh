#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

go build -buildmode=pie -trimpath -o=${PREFIX}/bin/bsondump -ldflags="-s -w" bsondump
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongodump -ldflags="-s -w" mongodump
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongorestore -ldflags="-s -w" mongorestore
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongoimport -ldflags="-s -w" mongoimport
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongoexport -ldflags="-s -w" mongoexport
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongostat -ldflags="-s -w" mongostat
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongotop -ldflags="-s -w" mongotop
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongofiles -ldflags="-s -w" mongofiles
go-licenses save bsondump --save_path=license-files_bsondump
go-licenses save mongodump --save_path=license-files_mongodump
go-licenses save mongorestore --save_path=license-files_mongorestore
go-licenses save mongoimport --save_path=license-files_mongoimport
go-licenses save mongoexport --save_path=license-files_mongoexport
go-licenses save mongostat --save_path=license-files_mongostat
go-licenses save mongotop --save_path=license-files_mongotop
go-licenses save mongofiles --save_path=license-files_mongofiles
