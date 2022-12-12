A simple PBFT protocol over HTTP, using python3 asyncio/aiohttp. This is just a proof of concept implementation.

## Configuration
A `pbft.yaml` config file is needed for the nodes to run. A sample is as follows:
```Yaml
nodes:
    - host: localhost
      port: 30000
    - host: localhost
      port: 30001
    - host: localhost
      port: 30002
    - host: localhost
      port: 30003

clients:
    - host: localhost
      port: 20001
    - host: localhost
      port: 20002

loss%: 0

ckpt_interval: 10

retry_times_before_view_change: 2

sync_interval: 5

misc:
    network_timeout: 5
```

## Run the nodes
`for i in {0..3}; do python ./node.py -i $i -lf False  &; done`

## Send request to any one of the nodes
e.g. `curl -vLX POST --data '{ 'id': (0, 0), 'client_url': http://localhost:20001/reply,
    'timestamp': time.time(),'data': 'data_string'}' http://localhost:30000/request`
The `id` here is a tuple of `(client_id, seq_id)`, `client_url` is the url for sending request to the get_reply function,
`timestamp` is the current time, `data` is whatever data in string format, 

## Run the clients
`for i in {0...2}; do python client.py -id $i -nm 5 &; done`

## Environment
```
Python: 3.5.3
aiohttp: 3.4.4
yaml: 3.12
```


## Testing plan

### Sequences that depict fail stop errors
blah blah

### Sequences that depict Byzantine faults
blah blah blah


1. Plot overhead of adding PBFT (Time overhead % vs number of nodes)
1. Number of messages (?)

1. f vs number of messages / latency - no effect of f on latency or number of messages

1. effect of delay on messages vs f - effect on latency / number of messages
1. byzantine fault in slot selection
1. why 3f + 1 - we will drop the reply from f non-faulty nodes and another f nodes are displaying byzantine faults.

1. Manually, delete or modify KVS of faulty nodes and check if it still works. return wrong value from KVS

1. Optimnize GET operations by reduces messages

1. check effect of multiple clients on time/latency/correctness

