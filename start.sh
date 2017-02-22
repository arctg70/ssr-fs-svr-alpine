cd /fs
sh restart.sh
cd /ssr/shadowsocks
python server.py -c /config.json > /dev/null
