@echo on

set bin_names=bsondump mongodump mongorestore mongoimport mongoexport mongostat mongotop mongofiles

( for %%a in (%bin_names%) do (
        go build -buildmode=pie -trimpath -o=%LIBRARY_PREFIX%\bin\%%a.exe -ldflags="-X main.VersionStr=%PKG_VERSION% -s -w" .\%%a\main\%%a.go || goto :error
        go-licenses save .\%%a --save_path=license-files_%%a || goto :error
    )
)

go clean -modcache

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
