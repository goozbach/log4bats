
log_fatal(){
        printf ${LOG4BATS_FORMAT:-'%b\n'} "FATAL: $@"
        #TODO make exit optional
        #exit 255
}

log_error(){
        printf ${LOG4BATS_FORMAT:-'%b\n'} "ERROR: $@"
}

log_warn(){
        printf ${LOG4BATS_FORMAT:-'%b\n'} "WARN: $@"
}

log_info(){
        printf ${LOG4BATS_FORMAT:-'%b\n'} "INFO: $@"
}

log_debug(){
        printf ${LOG4BATS_FORMAT:-'%b\n'} "DEBUG: $@"
}

log_trace(){
        printf ${LOG4BATS_FORMAT:-'%b\n'} "TRACE: $@"
}
