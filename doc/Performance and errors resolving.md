In case of errors about open files:
worker_rlimit_nofile 16384;
worker_connections `2000-8000`;

For performance:
timer_resolution 100ms;
worker_priority -5;
buffers

If worker_processes = 1:
accept_mutex off;

Hashes increase:
types_hash_max_size 2048;
server_names_hash_bucket_size 64;

For large files sharing:
read about aio, directio, etc.
output_buffers 2 64k; or else