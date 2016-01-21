#!/bin/bash
# start server with cat /tmp/f | xargs -n 1 -d '\n' ./parser.sh  2>&1 | nc -lvk 127.0.0.1 1234 > /tmp/f

printfile(){
	size=`cat $1 | wc -c`
	echo -e "HTTP/1.1 200 OK\r\nContent-Length: $(( $size ))\r\nContent-Type: text/html\r\n\r"
	less $1
}

requestPath=`echo $1 | awk '/GET/ {print $2}'` # get the request path

	if [ "$requestPath" == "" ]; then #if the request is not a GET request	
		:
	else  # if it is a GET request
		wd=`pwd`
		fp="$wd$requestPath" # path for requested file 
		df="${wd}${requestPath}dirfile"   # path for dir listing page
			
			if [ -d "$fp" ]; then # if requested path is directory 
				`>$df` 				
				dirlist=$(ls -a $fp | awk '{print $NF}')
				echo "<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN"><html><title>Directory listing for $df</title><body><h2>Directory listing for $df</h2><hr><ul>" >> $df
				for i in `echo $dirlist` #writing dir content into a htmlfile
				do
					if [ "$i" == "index.html" ]; then # if dir has index.html
						printfile "$fp/$i"						
						exit 0
					fi					
					echo "<li><a href=\"$requestPath/$i\"/>$i</a>" >> $df
				done
				echo "</ul><hr></body></html>" >> $df
				size=`cat $df | wc -c`
				#echo -e "HTTP/1.1 200 OK\r\nContent-Length: $size\r\nContent-Type: text/html\r\n\r"			
				#cat "$df"
				printfile $df				
				exit 0

			fi	
		
			if [ -f "$fp" ]; then # if requested path is file
				printfile $fp
			else # if file does not exist
				echo -e "HTTP/1.1 404 Not Found\r\nContent-Length:30\r\nContent-Type: text/html\r\n\r\n<h1>404 Not Found</h1><br><br>"
				exit 1
			fi

	fi
