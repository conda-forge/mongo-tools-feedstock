@echo on

set bin_names=bsondump mongodump mongorestore mongoimport mongoexport mongostat mongotop mongofiles

( for %%bin_name in (%bin_names%) do (
        go build -buildmode=pie -trimpath -o=%LIBRARY_PREFIX%\bin\%%bin_name.exe -ldflags="-X main.VersionStr=%PKG_VERSION% -s -w" .\%%bin_name\main\%%bin_name.go || goto :error
        go-licenses save .\%%bin_name --save_path=license-files_%%bin_name || goto :error
    )
)

go clean -modcache

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit 1
