# docker install (https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# docker post-install (https://docs.docker.com/engine/install/linux-postinstall/)
sudo groupadd docker
sudo usermod -aG docker $USER

# docker aliases
echo "alias dcbuild='docker build'" >> ~/.bashrc
echo "alias dcup='docker compose up'" >> ~/.bashrc
echo "alias dcdown='docker compose down'" >> ~/.bashrc
echo "alias dockps='docker ps --format \"{{.ID}} {{.Names}}\"'"  >> ~/.bashrc
echo "docksh(){ docker exec -it \$1 /bin/bash; }"  >> ~/.bashrc
source ~/.bashrc

# VIM
sudo apt install vim

# add user to vboxsf group for permissions
sudo adduser $USER vboxsf
