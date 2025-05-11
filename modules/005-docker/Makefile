include ../../lib/const.mk ../../lib/cache.mk

ARCH := $(shell dpkg --print-architecture)
DISTRO_NAME := $(shell . /etc/os-release && echo "$${UBUNTU_CODENAME:-$VERSION_CODENAME}")

# See: https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
# and: https://docs.docker.com/engine/install/linux-postinstall/
install:
	for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $$pkg; done
	sudo apt-get update
	sudo apt-get install ca-certificates curl
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc
	echo \
		"deb [arch=$(ARCH) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
		$(DISTRO_NAME) stable" | \
		sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	sudo groupadd -f docker
	sudo usermod -aG docker $(USER)

# See: https://docs.docker.com/engine/install/ubuntu/#uninstall-docker-engine
remove:
	sudo apt-get purge -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
	sudo rm -rf /var/lib/docker
	sudo rm -rf /var/lib/containerd
	sudo rm /etc/apt/sources.list.d/docker.list
	sudo rm /etc/apt/keyrings/docker.asc
	groupdel docker
