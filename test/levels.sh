#!/bin/bash

source lib/log4bats.sh

mylog(){
        log_fatal "$@"
}

mylog "this is a fatal message on line nine"

log_error "this is an error message on line eleven"

log_warn "this is a warning message"

sleep 7

log_info "this is an info message"

log_debug "this is a debug message"

log_trace "this is a trace message"

