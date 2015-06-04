@echo off
set ACTIVEMQ_HOME="/home/duff/activemq/activemq"
set ACTIVEMQ_BASE="/home/duff/activemq/edge2"

set PARAM=%1
:getParam
shift
if "%1"=="" goto end
set PARAM=%PARAM% %1
goto getParam
:end

%ACTIVEMQ_HOME%/bin/activemq %PARAM%