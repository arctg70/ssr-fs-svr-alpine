#PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
#export PATH
install_path=/fs/
#package_download_url=https://github.com/ucoker/finalspeed/raw/master/server/finalspeed_server.zip
#package_save_name=finalspeed_server.zip
#  Install finalspeed
#rm -f $package_save_name
echo "Download software..."
wget https://github.com/ucoker/finalspeed/raw/master/server/finalspeed_server.zip
if [[ ! -d "$install_path" ]]; then
                mkdir "$install_path"
                else
                echo "Update Software..."
        fi
unzip -o finalspeed_server.zip  -d $install_path
        sh ${install_path}"restart.sh" && exit 0
        tail -f ${install_path}"server.log"
