# netcat-http-server
Simple webserver using netcat.

## Start the server

cd in to the code directory and start server with 

    $ rm -f /tmp/f;mkfifo /tml/f
    $ cat /tmp/f | xargs -n 1 -d '\n' ./parser.sh  2>&1 | nc -lvk 127.0.0.1 1234 > /tmp/f
    
It will serve the contents in the code directory itself.

#### The server logic is in parser.sh file

#### Looks pretty much like python -m SimpleHTTPServer
