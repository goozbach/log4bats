#!/bin/bash
_log_dispatch(){
  _LOG_DATE=$(date -u ${LOG4BATS_DATE_FORMAT:-"+%F-%T.%N"} -d @${_LOG_STAMP})
  _LOG_MESSAGE=$(printf ${LOG4BATS_FORMAT:-"${_LOG_DATE} ${_LOG_LVL} %b\n"} "$@")
  #TODO make dispatcher
  echo -e ${_LOG_MESSAGE}
}

log_fatal(){
  _LOG_LVL="FATAL"
  _LOG_FUNC=${FUNCNAME[1]}
  _LOG_FILE=${BASH_SOURCE[1]}
  _LOG_LINE=${BASH_LINENO[1]}
  _LOG_SECONDS=${SECONDS}
  _LOG_STAMP=$(date +%s.%N)
  _log_dispatch "$@"
  unset _LOG_LVL _LOG_FUNC _LOG_FILE _LOG_LINE _LOG_SECONDS _LOG_STAMP
}

log_die(){
  log_fatal "$@"
  exit 200
}

log_error(){
  _LOG_LVL="FATAL"
  _LOG_FUNC=${FUNCNAME[1]}
  _LOG_FILE=${BASH_SOURCE[1]}
  _LOG_LINE=${BASH_LINENO[1]}
  _LOG_SECONDS=${SECONDS}
  _LOG_STAMP=$(date +%s.%N)
  _log_dispatch "$@"
  unset _LOG_LVL _LOG_FUNC _LOG_FILE _LOG_LINE _LOG_SECONDS _LOG_STAMP
}

log_warn(){
  _LOG_LVL="WARNING"
  _LOG_FUNC=${FUNCNAME[1]}
  _LOG_FILE=${BASH_SOURCE[1]}
  _LOG_LINE=${BASH_LINENO[1]}
  _LOG_SECONDS=${SECONDS}
  _LOG_STAMP=$(date +%s.%N)
  _log_dispatch "$@"
  unset _LOG_LVL _LOG_FUNC _LOG_FILE _LOG_LINE _LOG_SECONDS _LOG_STAMP
}

log_info(){
  _LOG_LVL="INFO"
  _LOG_FUNC=${FUNCNAME[1]}
  _LOG_FILE=${BASH_SOURCE[1]}
  _LOG_LINE=${BASH_LINENO[1]}
  _LOG_SECONDS=${SECONDS}
  _LOG_STAMP=$(date +%s.%N)
  _log_dispatch "$@"
  unset _LOG_LVL _LOG_FUNC _LOG_FILE _LOG_LINE _LOG_SECONDS _LOG_STAMP
}

log_debug(){
  _LOG_LVL="DEBUG"
  _LOG_FUNC=${FUNCNAME[1]}
  _LOG_FILE=${BASH_SOURCE[1]}
  _LOG_LINE=${BASH_LINENO[1]}
  _LOG_SECONDS=${SECONDS}
  _LOG_STAMP=$(date +%s.%N)
  _log_dispatch "$@"
  unset _LOG_LVL _LOG_FUNC _LOG_FILE _LOG_LINE _LOG_SECONDS _LOG_STAMP
}

log_trace(){
  _LOG_LVL="TRACE"
  _LOG_FUNC=${FUNCNAME[1]}
  _LOG_FILE=${BASH_SOURCE[1]}
  _LOG_LINE=${BASH_LINENO[1]}
  _LOG_SECONDS=${SECONDS}
  _LOG_STAMP=$(date +%s.%N)
  _log_dispatch "$@"
  unset _LOG_LVL _LOG_FUNC _LOG_FILE _LOG_LINE _LOG_SECONDS _LOG_STAMP
}
