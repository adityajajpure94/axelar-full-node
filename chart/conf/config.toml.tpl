proxy_app = "tcp://127.0.0.1:26658"
moniker = {{ required "a moniker is required" $.Values.moniker | quote }}
fast_sync = true
db_backend = "goleveldb"
db_dir = "data"
log_level = {{ $.Values.logLevel | default "info" | quote }}
log_format = "plain"
genesis_file = "config/genesis.json"
priv_validator_key_file = "config/priv_validator_key.json"
priv_validator_state_file = "data/priv_validator_state.json"
priv_validator_laddr = ""
node_key_file = "config/node_key.json"
abci = "socket"
filter_peers = false

[rpc]
laddr = {{ $.Values.rpc.laddr | default "tcp://127.0.0.1:26657" | quote }} 
cors_allowed_origins = {{ $.Values.rpc.cors_allowed_origins | default list | toJson }}
cors_allowed_methods = ["HEAD", "GET", "POST", ]
cors_allowed_headers = ["Origin", "Accept", "Content-Type", "X-Requested-With", "X-Server-Time", ]
grpc_laddr = {{ $.Values.rpc.grpc_laddr | default ""  | quote }}
grpc_max_open_connections = 900
unsafe = false
max_open_connections = 900
max_subscription_clients = 100
max_subscriptions_per_client = 5
timeout_broadcast_tx_commit = "20s"
max_body_bytes = 1000000
max_header_bytes = 1048576
tls_cert_file = ""
tls_key_file = ""
pprof_laddr = "localhost:6060"

[p2p]
laddr =  {{ $.Values.p2p.laddr | default "tcp://127.0.0.1:26656" | quote }}
external_address = {{ $.Values.p2p.externalAddress | default "" | quote  }}
seeds = {{ $.Values.p2p.seeds |  join "," | quote | default "" }}
persistent_peers = {{ $.Values.p2p.persistent_peers |  join ","  | default "" | quote }}
upnp = false
addr_book_file = "config/addrbook.json"
addr_book_strict = {{ hasKey $.Values.p2p "addr_book_strict" | ternary $.Values.p2p.addr_book_strict false }}
max_num_inbound_peers = {{ $.Values.p2p.max_num_inbound_peers | default 40 }}
max_num_outbound_peers = {{ $.Values.p2p.max_num_outbound_peers | default 10 }}
unconditional_peer_ids = {{ $.Values.p2p.unconditional_peers |  join ","  | default "" | quote }}
persistent_peers_max_dial_period = "0s"
flush_throttle_timeout = "100ms"
max_packet_msg_payload_size = 1024
send_rate = 5120000
recv_rate = 5120000
pex = {{ hasKey $.Values.p2p "pex" | ternary $.Values.p2p.pex true }}
seed_mode = {{ hasKey $.Values.p2p "seed_mode" | ternary $.Values.p2p.seed_mode false }}
private_peer_ids = {{ $.Values.p2p.private_peer_ids |  join ","  | default "" | quote }}
allow_duplicate_ip = {{ hasKey $.Values.p2p "allow_duplicate_ip" | ternary $.Values.p2p.allow_duplicate_ip true }}
handshake_timeout = "20s"
dial_timeout = "3s"

[mempool]
recheck = {{ hasKey $.Values.mempool "recheck" | ternary $.Values.mempool.recheck true }}
broadcast = {{ hasKey $.Values.mempool "broadcast" | ternary $.Values.mempool.broadcast true }}
wal_dir = ""
size = {{ $.Values.mempool.size | default 5000 }}
max_txs_bytes = {{ $.Values.mempool.max_txs_bytes | default 1073741824 }}
cache_size = {{ $.Values.mempool.cache_size | default 10000 }}
keep-invalid-txs-in-cache = {{ hasKey $.Values.mempool "keep_invalid_txs_in_cache" | ternary $.Values.mempool.keep_invalid_txs_in_cache false }}
max_tx_bytes = {{ $.Values.mempool.max_tx_bytes | default 1048576 }}
max_batch_bytes = {{ $.Values.mempool.max_batch_bytes | default 0 }}

[statesync]
enable = false
rpc_servers = ""
trust_height = 0
trust_hash = ""
trust_period = "168h0m0s"
discovery_time = "15s"
temp_dir = ""
chunk_request_timeout = "10s"
chunk_fetchers = "4"

[fastsync]
version = "v0"

[consensus]
wal_file = "data/cs.wal/wal"
timeout_propose = "3s"
timeout_propose_delta = "500ms"
timeout_prevote = "1s"
timeout_prevote_delta = "500ms"
timeout_precommit = "1s"
timeout_precommit_delta = "500ms"
timeout_commit = "5s"
double_sign_check_height = 0
skip_timeout_commit = false
create_empty_blocks = true
create_empty_blocks_interval = "0s"
peer_gossip_sleep_duration = "100ms"
peer_query_maj23_sleep_duration = "2s"

[tx_index]
indexer = "kv"

[instrumentation]
prometheus = {{ hasKey $.Values.instrumentation "prometheus" | ternary $.Values.instrumentation.prometheus false }}
prometheus_listen_addr = ":26660"
max_open_connections = 3
namespace = "tendermint"

##### EVM bridges options #####
# Each EVM chain needs the following
# 1. `[[axelar_bridge_evm]]` # header
# 2. `name`                  # chain name (eg. "Ethereum")
# 3. 'rpc_addr'              # EVM RPC endpoint URL; chain maintainers set their own endpoint
# 4. `start-with-bridge`     # `true` to support this chain
#
# see https://docs.axelar.dev/#/validator-zone/external-chains/overview

[[axelar_bridge_evm]]
name = "Ethereum"
rpc_addr = ""
start-with-bridge = false

[[axelar_bridge_evm]]
name = "Avalanche"
rpc_addr = ""
start-with-bridge = false

[[axelar_bridge_evm]]
name = "Fantom"
rpc_addr = ""
start-with-bridge = false

[[axelar_bridge_evm]]
name = "Moonbeam"
rpc_addr = ""
start-with-bridge = false

[[axelar_bridge_evm]]
name = "Polygon"
rpc_addr = ""
start-with-bridge = false

[[axelar_bridge_evm]]
name = "binance"
rpc_addr = ""
start-with-bridge = false

[[axelar_bridge_evm]]
name = "aurora"
rpc_addr = ""
start-with-bridge = false

[broadcast]
broadcaster-account = "broadcaster"
gas-adjustment = 1.0
max-retries = 10
min-timeout = "4s"
