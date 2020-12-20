# Basic UNIX Firewall

Unix shell script to set up a basic firewall that allows emails and HTTPS connections while constantly logging all activities.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine. 

### Prerequisites

This project runs on Linux/UNIX Operating System.

The iptables command is used in this project. Normally iptables is pre-installed in most UNIX distributions. It can be confirmed by running the following shell command:

```
iptables -h
```

If not already installed, iptables can be installed from apt repository using the following shell command:

```
sudo apt-get install iptables
```

### Installing

The project contains UNIX shell script [firewall.sh](firewall.sh) that can be directly run to set up the firewall without any additional installation. 

1) Download the repo by clicking the download button or by running the following shell command:

```
git clone https://github.com/technagoraphobe/firewall.git
```

2) Unzip the downloaded zip folder if necessary either from the graphical interface or by running the following shell command from the directory containing the zip folder:

```
unzip <zip_folder_name>.zip -d <destination_for_extracted_files>
```


## Setting up the firewall

You can set up the firewall on your local device by following the below steps:

### Update the device IP address

The script requires the device's IP address to function satisfactorily. In order to avoid issues, replace the current placeholder on the first line of the script with your device's IP address. 

```
YOUR_HOSTNAME=<device_IP_address>
```

### Make the script executable

Run the following command from the script's directory before executing the script allow executing the script:

```
chmod +x firewall.sh
```

### Activate iptables

Ubuntu users may run the following command and restart your system:

```
ufw disable
```

Users using other versions of UNIX may run the following command:

```
service iptables start
```

### Run the script

Run the executable shell script using command:

```
sudo ./firewall.sh
```

## Save the firewall settings
Some additional steps are required to save the firewall rules so they persist even after a reboot or shutdown. 

### Debian/Ubuntu users
Ubuntu users need to export the new configuration to an external file only once. This export may be used to restore the rules at the start of every session.

To save the firewall rules to an external file, use the following command:

```
For IPv4
iptables-save > /etc/iptables/rules.v4

For IPv6
iptables-save > /etc/iptables/rules.v6
```

To restore the firewall rules manually after each startup, use the following command:

```
For IPv4
iptables-restore < /etc/iptables/rules.v4
For IPv6
iptables-restore < /etc/iptables/rules.v6
```

### RHEL/CentOS users
Run the following command to permanently save the iptables configuration, so that it persists even after a reboot or shutdown:

```
service iptables save
```


## Author

* **Krishna Shrestha** - *krishna.shrestha2@mail.dcu.ie* 

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

* ["Building a Professional Firewall with Linux and Iptables" - Daniel Messlier](https://danielmiessler.com/blog/professional-firewall-iptables/)
* ["Saving Iptables Firewall Rules Permanently" - Thomas Krenn](https://www.thomas-krenn.com/en/wiki/Saving_Iptables_Firewall_Rules_Permanently)
