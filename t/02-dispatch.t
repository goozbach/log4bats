#!/bin/bash
#===============================================================================
#
#         FILE: 02-dispatch.t
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: YOUR NAME (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 06/09/2012 05:01:16 PM
#     REVISION: ---
#===============================================================================
DIR=${0%%/*}

# TAP producer
source ${DIR}/lib/tap-functions

plan_tests 4

source ${DIR}/../lib/log4bats

FATAL_OUTPUT=$(log_fatal "this is a fatal message")
TIMESTAMP=${FATAL_OUTPUT%% *}
like "${FATAL_OUTPUT}" "${TIMESTAMP} FATAL this is a fatal message" "Fatal Default Output"

# change the dispatcher
_log_do_dispatch(){
    echo "yup"
}
FATAL_OUTPUT=$(log_fatal "this is a fatal message")
like "${FATAL_OUTPUT}" "yup" "Dispatcher output can change"

# change the dispatcher to do a file
DISPATCHFILE=$(mktemp)
_log_do_dispatch(){
    echo "$@" > ${DISPATCHFILE}
}
FATAL_OUTPUT=$(log_fatal "this is a fatal message")
if [[ -z "${FATAL_OUTPUT}" ]]
then
  pass "File dispatcher output not echoed"
else
  fail "File dispatcher output not echoed"
fi

FATAL_OUTPUT=$(cat ${DISPATCHFILE})
TIMESTAMP=${FATAL_OUTPUT%% *}
like "${FATAL_OUTPUT}" "${TIMESTAMP} FATAL this is a fatal message" "Fatal file Default Output"
rm ${DISPATCHFILE}
