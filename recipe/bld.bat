@echo on

go build -buildmode=pie -trimpath -o=%LIBRARY_PREFIX%\bin\bsondump.exe -ldflags="-X main.VersionStr=%PKG_VERSION% -s -w" .\bsondump\main\bsondump.go || goto :error
go build -buildmode=pie -trimpath -o=%LIBRARY_PREFIX%\bin\mongodump.exe -ldflags="-X main.VersionStr=%PKG_VERSION% -s -w" .\mongodump\main\mongodump.go || goto :error
go build -buildmode=pie -trimpath -o=%LIBRARY_PREFIX%\bin\mongorestore.exe -ldflags="-X main.VersionStr=%PKG_VERSION% -s -w" .\mongorestore\main\mongorestore.go || goto :error
go build -buildmode=pie -trimpath -o=%LIBRARY_PREFIX%\bin\mongoimport.exe -ldflags="-X main.VersionStr=%PKG_VERSION% -s -w" .\mongoimport\main\mongoimport.go || goto :error
go build -buildmode=pie -trimpath -o=%LIBRARY_PREFIX%\bin\mongoexport.exe -ldflags="-X main.VersionStr=%PKG_VERSION% -s -w" .\mongoexport\main\mongoexport.go || goto :error
go build -buildmode=pie -trimpath -o=%LIBRARY_PREFIX%\bin\mongostat.exe -ldflags="-X main.VersionStr=%PKG_VERSION% -s -w" .\mongostat\main\mongostat.go || goto :error
go build -buildmode=pie -trimpath -o=%LIBRARY_PREFIX%\bin\mongotop.exe -ldflags="-X main.VersionStr=%PKG_VERSION% -s -w" .\mongotop\main\mongotop.go || goto :error
go build -buildmode=pie -trimpath -o=%LIBRARY_PREFIX%\bin\mongofiles.exe -ldflags="-X main.VersionStr=%PKG_VERSION% -s -w" .\mongofiles\main\mongofiles.go || goto :error
go-licenses save .\bsondump --save_path=license-files_bsondump || goto :error
go-licenses save .\mongodump --save_path=license-files_mongodump || goto :error
go-licenses save .\mongorestore --save_path=license-files_mongorestore || goto :error
go-licenses save .\mongoimport --save_path=license-files_mongoimport || goto :error
go-licenses save .\mongoexport --save_path=license-files_mongoexport || goto :error
go-licenses save .\mongostat --save_path=license-files_mongostat || goto :error
go-licenses save .\mongotop --save_path=license-files_mongotop || goto :error
go-licenses save .\mongofiles --save_path=license-files_mongofiles || goto :error
go clean -modcache

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
