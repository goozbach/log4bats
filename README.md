Bash Archive of Tricks and Scripts -- Log for bats

#Log4BATS Logging levels
Same as Log4Perl and Log4J.
Each level includes the one below. (ie `WARN` will print `WARN`, `ERROR`, and `FATAL` messages)

        ALL -- synonym for TRACE
        TRACE
        DEBUG
        INFO
        WARN
        ERROR
        FATAL
        NONE -- no logging

#Log4BATS control variables

## LOG4BATS_DATE_FORMAT 
same as format for `date` command (default `"+%F-%T.%N"`)

## LOG4BATS_FORMAT 
printf style format (uses printf and other vars, default `"${_LOG_DATE} ${_LOG_LVL} %b\n"`)

### Format Variables (can be included in `LOG4BATS_FORMAT`)

* _LOG_DATE -- date/timestamp formatted using `LOG4BATS_DATE_FORMAT` and the date command

* _LOG_LVL -- the priority of the log message

* _LOG_FUNC -- the function which called the logging command

* _LOG_FILE -- the file which called the logging command

* _LOG_LINE -- the line number which called the logging command

* _LOG_SECONDS -- number of seconds since script execution that the log message was created

* _LOG_STAMP -- timestamp of the log message in format `+%s.%N`. This is for internal use and, shouldn't be used directly, try `_LOG_DATE` instead.

## LOG4BATS_LEVEL 
sets the Logging Level (default `TRACE`)

# using Log4BATS

1) Source the library

        source lib/log4bats.sh

2) (OPTIONAL) Set a logging level

        export LOG4BATS_LEVEL='WARN'

3) (OPTIONAL) Set a dispatcher (NOT YET IMPLEMENTED, might work however)

        _log_do_dispatch(){
          echo "$@" >> /tmp/logfile
        }

4) Use the log_* functions

        mylog "this is a fatal message"
        log_error "this is an error message"
        log_warn "this is a warning message"
        log_die "goodbye cruel world"
        log_fatal "this log message won't ever get sent" # remember log_die 'exit's

## Log functions

There are the normal logging message functions, each corresponds to a given log level

* log_trace
* log_debug
* log_info
* log_warn
* log_error
* log_fatal

There are also special logging functions each has a different outcome

* log_die -- issue a `log_fatal` message and then exit with code 200

