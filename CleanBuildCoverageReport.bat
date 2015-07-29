.\.nuget\Nuget.exe restore .\RMWebAPI.sln
"C:\Program Files (x86)\MSBuild\12.0\Bin\msbuild.exe" /t:Clean;Build /p:Configuration=Debug .\RMWebAPI.sln
call runandprintcoverage.bat
.\coverage\index.htm
REM .\HISC.WebInquiry.AcceptanceTests\bin\Debug\BDDfy.html
