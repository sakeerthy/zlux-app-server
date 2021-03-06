@echo off
REM This program and the accompanying materials are
REM made available under the terms of the Eclipse Public License v2.0 which accompanies
REM this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html
REM 
REM SPDX-License-Identifier: EPL-2.0
REM 
REM Copyright Contributors to the Zowe Project.
setlocal
if "%ZLUX_NODE_LOG_DIR%" == "" (
  set ZLUX_NODE_LOG_DIR="../log"
)
call :makedir %ZLUX_NODE_LOG_DIR%
set NODE_PATH=../..;../../zlux-server-framework/node_modules;%NODE_PATH%
cd ../lib
call :abspath %ZLUX_NODE_LOG_DIR%\nodeServer.log
set ZLUX_LOG_PATH=%RETVAL%
set minWorkers=2
set NODE_CLUSTER_SCHED_POLICY=rr
echo Server startup. Log location=%ZLUX_LOG_PATH%
node --harmony zluxCluster.js --config=../deploy/instance/ZLUX/serverConfig/zluxserver.json %* > %ZLUX_LOG_PATH% 2>&1
echo Ended with rc=%ERRORLEVEL%
endlocal
goto :eof

rem Create a directory if it does not exist yet
:makedir
if not exist %ZLUX_NODE_LOG_DIR% mkdir %ZLUX_NODE_LOG_DIR%
goto :eof

:abspath
set RETVAL=%~dpfn1
exit /B
REM This program and the accompanying materials are
REM made available under the terms of the Eclipse Public License v2.0 which accompanies
REM this distribution, and is available at https://www.eclipse.org/legal/epl-v20.html
REM 
REM SPDX-License-Identifier: EPL-2.0
REM 
REM Copyright Contributors to the Zowe Project.
