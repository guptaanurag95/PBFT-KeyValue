# ./run_node.sh
# sleep 15 
# ./run_client.sh
ps |  awk '/python3/{print "kill -9 "$1}' | tr '\n' "; " | bash
./run_node.sh
python3 ./client.py -id 0 &
