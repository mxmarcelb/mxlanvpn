## About
Secure LAN channel for our BMS application via OpenVPN
### Installation
Run the script and follow the assistant:

`wget https://pimatico.s3.eu-central-1.amazonaws.com/bindistro/mxlanvpn-install_v0.1.sh && sudo bash mxlanvpn-install_v0.1.sh`

Once it ends, you can run it again to add more users, remove some of them or even completely uninstall OpenVPN.

### Options

Add user or revoke: 
```
sudo mxlanvpn
```
Toggle state of BMS:
```
sudo mxlanvpn-bmstoggle
```
Toggle state of Apache2:
```
sudo mxlanvpn-apachetoggle
```