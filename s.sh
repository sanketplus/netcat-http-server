rm -f foo && rm -f req && echo "del pipes" && sleep 2 && mkfifo foo && mkfifo req && echo "made pipes"
#while true;
#do
	echo "starting server"
	netcat -l -k -v 4444 0<foo >req | /home/sanket/workspace/webserver/a >foo
	cat req
	requestPath=`awk '/GET/ {print $2}' req`
	echo $requestPath
#done
