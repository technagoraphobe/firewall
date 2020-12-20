# Basic UNIX Firewall

Unix shell script to set up a basic firewall that allows emails and HTTPS while constantly logging all activities.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine. 

### Prerequisites

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

1) Download the repo by clicking "Download ZIP" button near the top right corner or by running the following shell command:

```
git clone https://github.com/technagoraphobe/firewall.git
```

2) Unzip the downloaded folder either from the graphical interface or by running the following shell command from the directory containing the zip folder:

```
unzip <zip_folder_name>.zip -d <destination_for_extracted_files>
```

End with an example of getting some data out of the system or using it for a little demo

## Setting up the firewall

Explain how to run the automated tests for this system

### Make the script executable

Explain what these tests test and why

```
chmod +x firewall.sh
```

### 

For Ubuntu users, run the following command and restart your system:

```
ufw disable
```

Users using other versions of UNIX can run the following command:

```
service iptables start
```

### Run the script

Run the executable shell script using command

```
sudo ./firewall.sh
```

## Save the firewall settings
Some additional steps are required to save the firewall configuration so they persist even after a reboot or shutdown. These steps differ for Ubuntu as compared to other UNIX distros.

### Ubuntu users
Ubuntu users need to export the new configuration to an external file only once. 
Save the firewall configuration to an external file using the following command:

```
iptables-save < 
```

Restore the firewall configuration manually after each startup

```
iptables-restore > 
```

### Other UNIX users
Run the following command to permanently save the iptables configuration, so that it persists even after a reboot or shutdown:

```
service iptables save
```


## Author

* **Krishna Shrestha** - *krishna.shrestha2@mail.dcu.ie* 

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* "Building a Professional Firewall with Linux and Iptables" - Daniel Messlier ()

