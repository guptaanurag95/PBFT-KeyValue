ps |  awk '/python3/{print "kill -9 "$1}' | tr '\n' "; " | bash
./run_node.sh
python3 ./client.py -id 0 &
sleep 1
curl -vLX POST --data '{ 'id': (0, 0), 'client_url': http://localhost:20001/reply, 'timestamp': time.time(),'data': 'data_string'}' http://localhost:20001/request