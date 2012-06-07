#!/bin/bash
_log_do_dispatch(){
  #TODO make dispatcher
  echo -e ${@}
}
_log_dispatch(){
  _LOG_DATE=$(date -u ${LOG4BATS_DATE_FORMAT:-"+%F-%T.%N"} -d @${_LOG_STAMP})
  _LOG_MESSAGE=$(printf ${LOG4BATS_FORMAT:-"${_LOG_DATE} ${_LOG_LVL} %b\n"} "$@")
  if [[ ${LOG4BATS_LEVEL:-'TRACE'} == 'TRACE' || ${LOG4BATS_LEVEL:-'TRACE'} == 'ALL' ]]
  then
    _log_do_dispatch ${_LOG_MESSAGE}
  elif [[ ${LOG4BATS_LEVEL:-'TRACE'} == 'DEBUG' ]]
  then
    case ${_LOG_LVL} in
      'DEBUG'|'INFO'|'WARN'|'ERROR'|'FATAL')
        _log_do_dispatch ${_LOG_MESSAGE}
    esac 
  elif [[ ${LOG4BATS_LEVEL:-'TRACE'} == 'INFO' ]]
  then
    case ${_LOG_LVL} in
      'INFO'|'WARN'|'ERROR'|'FATAL')
        _log_do_dispatch ${_LOG_MESSAGE}
    esac 
  elif [[ ${LOG4BATS_LEVEL:-'TRACE'} == 'WARN' ]]
  then
    case ${_LOG_LVL} in
      'WARN'|'ERROR'|'FATAL')
        _log_do_dispatch ${_LOG_MESSAGE}
    esac 
  elif [[ ${LOG4BATS_LEVEL:-'TRACE'} == 'ERROR' ]]
  then
    case ${_LOG_LVL} in
      'ERROR'|'FATAL')
        _log_do_dispatch ${_LOG_MESSAGE}
    esac 
  elif [[ ${LOG4BATS_LEVEL:-'TRACE'} == 'FATAL' ]]
  then
    case ${_LOG_LVL} in
      'FATAL')
        _log_do_dispatch ${_LOG_MESSAGE}
    esac 
  elif [[ ${LOG4BATS_LEVEL:-'TRACE'} == 'DEBUG' ]]
  then
    return
  fi
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
  _LOG_LVL="ERROR"
  _LOG_FUNC=${FUNCNAME[1]}
  _LOG_FILE=${BASH_SOURCE[1]}
  _LOG_LINE=${BASH_LINENO[1]}
  _LOG_SECONDS=${SECONDS}
  _LOG_STAMP=$(date +%s.%N)
  _log_dispatch "$@"
  unset _LOG_LVL _LOG_FUNC _LOG_FILE _LOG_LINE _LOG_SECONDS _LOG_STAMP
}

log_warn(){
  _LOG_LVL="WARN"
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
