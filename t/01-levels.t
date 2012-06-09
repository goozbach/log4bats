#!/usr/bin/bash
#===============================================================================
#
#         FILE: 01-levels.t
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 06/09/2012 03:32:14 PM
#     REVISION: ---
#===============================================================================
DIR=${0%%/*}

# TAP producer
source ${DIR}/lib/tap-functions

plan_tests 6

source ${DIR}/../lib/log4bats

FATAL_OUTPUT=$(log_fatal "this is a fatal message")
TIMESTAMP=${FATAL_OUTPUT%% *}
like "${FATAL_OUTPUT}" "${TIMESTAMP} FATAL this is a fatal message" "Fatal Default Output"

ERROR_OUTPUT=$(log_error "this is an error message")
TIMESTAMP=${ERROR_OUTPUT%% *}
like "${ERROR_OUTPUT}" "${TIMESTAMP} ERROR this is an error message" "Error Default Output"

WARN_OUTPUT=$(log_warn "this is a warning message")
TIMESTAMP=${WARN_OUTPUT%% *}
like "${WARN_OUTPUT}" "${TIMESTAMP} WARN this is a warning message" "Warning Default Output"

INFO_OUTPUT=$(log_info "this is an info message")
TIMESTAMP=${INFO_OUTPUT%% *}
like "${INFO_OUTPUT}" "${TIMESTAMP} INFO this is an info message" "Information Default Output"

DEBUG_OUTPUT=$(log_debug "this is a debug message")
TIMESTAMP=${DEBUG_OUTPUT%% *}
like "${DEBUG_OUTPUT}" "${TIMESTAMP} DEBUG this is a debug message" "Debug Default Output"

TRACE_OUTPUT=$(log_trace "this is a trace message")
TIMESTAMP=${TRACE_OUTPUT%% *}
like "${TRACE_OUTPUT}" "${TIMESTAMP} TRACE this is a trace message" "Trace Default Output"

