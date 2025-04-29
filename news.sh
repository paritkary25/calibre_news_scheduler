#!/bin/bash
# Filename: news.sh
# Author: Yash Paritker
# Last modified: 2025-04-29 Tue 15:31
# Created: 2025-04-29 Tue 15:03
# Schedule download calibre news

# Schedule this daily with cron to download news everyday
# This script assumes that you are running a calibre-server service as mentioned in calibre-server service git repo
# For monthly publications, this script checks the date and downloads on the 1st

lib_path="~/Calibre Library/"

daily_list=("The Hindu" "Hindustan Times")
monthly_list=("IEEE Spectrum Magazine")

# Turning off calibre-server service
sudo service calibre-server stop

# Converting daily
for news in "${daily_list[@]}"
do
    ebook-convert "$news.recipe" "/tmp/$news.epub"
    calibredb add "$lib_path" "/tmp/$news.epub"
    rm "/tmp/$news.epub"
done

# Converting Weekly

if [ `date +%d` -eq 01 ];
then
    for news in "${monthly_list[@]}"
    do
        ebook-convert "$news.recipe" "/tmp/$news.epub"
        calibredb add "$lib_path" "/tmp/$news.epub"
        rm "/tmp/$news.epub"
    done
fi

# Turning the service back on
sudo service calibre-server start
