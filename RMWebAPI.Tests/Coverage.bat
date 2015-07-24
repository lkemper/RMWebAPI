REM @echo suppresses command line. ^ is line continuation character
REM $(BinDir) is VS command line parameter of bin folder path of the selected project
@ECHO ON

..\..\..\packages\OpenCover.4.6.166\tools\OpenCover.Console.exe ^
 -target:..\..\..\packages\NUnit.Runners.2.6.4\tools\nunit-console.exe ^
 -targetargs:RMWebAPI.Tests.dll /noshadow /nologo ^
 -register:user ^
 -filter:"+[RMWebAPI*]* -[RMWebAPI*Tests*]*" ^
 -filter:-excludebyfile:*\*Designer.cs -mergebyhash

REM Default filters are: -[mscorlib]* -[mscorlib.*]* -[System]* -[System.*]* -[Microsoft.VisualBasic]*
REM delete old coverage files
REM /F /Q switches to delete files and directories even with readonly attribute without confirmation
DEL /F /Q ..\..\..\coverage\*.*
REM Generate HTML based coverage reports
..\..\..\packages\ReportGenerator.2.1.8.0\tools\reportgenerator.exe ^
 -reports:results.xml -targetdir:..\..\..\coverage Verbosity: Error
REM invoke the html coverage summary in browser
START ..\..\..\coverage\index.htm /b "C:\Program Files\Internet Explorer\iexplore.exe"