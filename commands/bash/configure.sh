# !/bin/bash
echo "-----Setting-up-Bash-----"
echo "Moving DotFiles to user root..."
cp ~/.nova/.bashrc ~/.bashrc
cp ~/.nova/.toprc ~/.toprc
echo "Setting file watchers"
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf
sudo sysctl -p 
echo "-----Setup-complete-----"
