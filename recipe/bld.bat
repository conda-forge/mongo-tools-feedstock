@echo on

go build -buildmode=pie -trimpath -o=${PREFIX}/bin/bsondump -ldflags="-s -w" bsondump || goto :error
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongodump -ldflags="-s -w" mongodump || goto :error
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongorestore -ldflags="-s -w" mongorestore || goto :error
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongoimport -ldflags="-s -w" mongoimport || goto :error
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongoexport -ldflags="-s -w" mongoexport || goto :error
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongostat -ldflags="-s -w" mongostat || goto :error
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongotop -ldflags="-s -w" mongotop || goto :error
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/mongofiles -ldflags="-s -w" mongofiles || goto :error
go-licenses save bsondump --save_path=license-files_bsondump || goto :error
go-licenses save mongodump --save_path=license-files_mongodump || goto :error
go-licenses save mongorestore --save_path=license-files_mongorestore || goto :error
go-licenses save mongoimport --save_path=license-files_mongoimport || goto :error
go-licenses save mongoexport --save_path=license-files_mongoexport || goto :error
go-licenses save mongostat --save_path=license-files_mongostat || goto :error
go-licenses save mongotop --save_path=license-files_mongotop || goto :error
go-licenses save mongofiles --save_path=license-files_mongofiles || goto :error

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
