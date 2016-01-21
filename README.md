# netcat-http-server
Simple webserver using netcat.

## Start the server

cd in to the code directory and start server with 

$ rm -f /tmp/f;mkfifo /tml/f
$ cat /tmp/f | xargs -n 1 -d '\n' ./parser.sh  2>&1 | nc -lvk 127.0.0.1 1234 > /tmp/f

### the server logic is in parser.sh file

### works similarly like python -m SimpleHTTPServer
