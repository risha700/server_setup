read -p "js entry point > " app_entry
sudo apt install nodejs npm build-essential -y
sudo npm install pm2@latest -g
pm2 start $app_entry

pm2 startup systemd

sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u $whoami --hp /home/$whoami
pm2 save
sudo systemctl start pm2-$whoami
