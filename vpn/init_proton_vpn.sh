#!/bin/bash
sudo wget -O protonvpn-cli.sh https://raw.githubusercontent.com/ProtonVPN/protonvpn-cli/master/protonvpn-cli.sh
sudo chmod +x protonvpn-cli.sh
sudo ./protonvpn-cli.sh --install
sudo rm protonvpn-cli.sh
sudo pvpn -init

# connect
# sudo pvpn -c

# disconnect
# sudo pvpn -d
