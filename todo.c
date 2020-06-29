//uninstal old version
sudo apt-get remove docker docker-engine docker.io containerd runc

//update + install package to allow apt to use a repository over HTTPS
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

//add docker official GPG key
$ curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

//verify if have the key 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD8
sudo apt-key fingerprint 0EBFCD88
