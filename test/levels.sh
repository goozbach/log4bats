#!/bin/bash

source lib/log4bats

mylog(){
        log_fatal "$@"
}

source test/tests
