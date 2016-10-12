for /r %%f in (.\*) do (
	ECHO %%~dpf,%%~nxf
)>> files.csv
pause