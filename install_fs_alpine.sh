#PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
#export PATH
install_path=/fs/
package_download_url=https://github.com/ucoker/finalspeed/raw/master/server/finalspeed_server.zip
package_save_name=finalspeed_server.zip
#  Install finalspeed
        rm -f $package_save_name
        echo "Download software..."
        if ! wget -O $package_save_name $package_download_url ; then
                echo "Download software failed!"
                exit 1
        fi
        if [[ ! -d "$install_path" ]]; then
                mkdir "$install_path"
                else
                echo "Update Software..."
        fi

        unzip -o $package_save_name  -d $install_path

        sh ${install_path}"restart.sh" && exit 0
        tail -f ${install_path}"server.log"
