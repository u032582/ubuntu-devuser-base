sudo usermod -u ${USERID:-999} devuser
sudo groupmod -g ${GID:-999} devusers
sudo usermod -aG devusers devuser

trap : TERM INT
exec "$@"
sleep infinity & wait
