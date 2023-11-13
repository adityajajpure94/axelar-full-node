minimum-gas-prices = {{ $.Values.minimumGasPrices | default "0.007uaxl" | quote }}
pruning = {{ $.Values.pruning | default "default" | quote }}
pruning-keep-recent = {{ $.Values.pruningKeepRecent | default "0" | quote }}
pruning-keep-every = {{ $.Values.pruningKeepEvery | default "0" | quote }}
pruning-interval = {{ $.Values.pruningInterval | default "0" | quote }}
halt-height = {{ $.Values.haltHeight | default 0 }}
halt-time = {{ $.Values.haltTime | default 0 }}
min-retain-blocks = {{ $.Values.minRetainBlocks | default 0 }}
inter-block-cache = true
index-events = []


[telemetry]
service-name = ""
enabled = {{ hasKey $.Values.telemetry "enabled" | ternary $.Values.telemetry.enabled true }}
enable-hostname = false
enable-hostname-label = false
enable-service-label = false
prometheus-retention-time = 0
global-labels = []

[api]
enable = {{ hasKey $.Values.api "enable" | ternary $.Values.api.enable true }}
swagger = false
address = {{ $.Values.api.address | default "tcp://0.0.0.0:1317" | quote }}
max-open-connections = 1000
rpc-read-timeout = 10
rpc-write-timeout = 0
rpc-max-body-bytes = 1000000
enabled-unsafe-cors = false

[rosetta]
enable = false
address = ":8080"
blockchain = "app"
network = "network"
retries = 3
offline = false

[grpc]
enable =  {{ hasKey $.Values.grpc "enable" | ternary $.Values.grpc.enable true }}
address = {{ $.Values.grpc.address | default "0.0.0.0:9090" | quote }} 

[grpc-web]
enable = true
address = "0.0.0.0:9091"
enable-unsafe-cors = false

[state-sync]
snapshot-interval = 0
snapshot-keep-recent = 2
