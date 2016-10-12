@echo off
SetLocal EnableExtensions EnableDelayedExpansion
for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
     set /A day=%%i-7
	 set month=%%j
     set year=%%k
)
set datestr=%day%/%month%/%year%
echo stadium,meeting_date,file_name,mean_volume(db),max_volume(db) > results.csv
set file_count=0
set dir=C:\videos\mp4\
for /f %%f in ('forfiles /p !dir! /s /m *.mp4 /D +%datestr% /c "cmd /c if @ISDIR==FALSE echo @FILE"') do (
	set file_name=%%~nf%%~xf
	ffmpeg.exe -i !dir!!file_name! -af "volumedetect" -f null NUL > vid_temp_file.txt 2>&1	
	for /f "tokens=1,2 delims=:" %%i in ('FINDSTR / "max_volume:" vid_temp_file.txt %tmp_result_file%') do (
		set max_volume=%%j
	)
	for /f "tokens=1,2 delims=:" %%i in ('FINDSTR / "mean_volume:" vid_temp_file.txt %tmp_result_file%') do (
		set mean_volume=%%j
	)	
	echo !file_name:~0,3!,!file_name:~4,10!,!file_name!,!mean_volume:~0,-3!,!max_volume:~0,-3! >> results.csv
	set /A file_count=file_count+1
)
echo !file_count! files checked since !datestr! >> results.csv
echo Volume Check Complete !file_count! files checked since !datestr!.
echo Check results.csv for full details.
pause