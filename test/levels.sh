#!/bin/bash

source lib/log4bats.sh

log_fatal "this is a fatal message"

log_error "this is an error message"

log_warn "this is a warning message"

log_info "this is an info message"

log_debug "this is a debug message"

log_trace "this is a trace message"

