#!/bin/bash

source lib/log4bats

_log_do_dispatch(){
        echo got a message $@
}


mylog(){
        log_fatal "$@"
}

source test/tests
