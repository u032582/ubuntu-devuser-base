sudo usermod -u ${USERID:1001} devuser
sudo groupmod -g ${GID:1001} devuser
sudo usermod -aG devuser devuser

trap : TERM INT
exec "$@"
sleep infinity & wait
