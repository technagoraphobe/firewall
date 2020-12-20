################################### Unix Firewall##############################################
# Author: Krishna Shrestha (krishna.shrestha2@mail.dcu.ie)
# Description: Unix shell script to set up a basic firewall that allows emails and HTTPS while constantly logging all activities.
# References: 
# 1. "Building a Professional Firewall with Linux and Iptables" - Daniel Messlier ()
# 2. StackExchange forum
##############################################################################################


# Define the system's IP address as a hostname
YOUR_HOSTNAME=123.123.123.123

# Flush any existing rules
iptables -F

# Allow all traffic from the local interface
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Allow traffic from established connections
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT


## Management Rule
# Allow SSH.

# Allow SSH on port 2222
iptables -A INPUT -d $YOUR_HOSTNAME -p tcp --dport 2222 -j ACCEPT


## Access Rules
# Allow emails and HTTPS connections and block Facebook and Twitter.

# Allow and log HTTPS on port 443
iptables -A INPUT -d $YOUR_HOSTNAME -p tcp --dport 443 -j LOG --log-level 7 --log-prefix "HTTPS: Permitted" 
iptables -A INPUT -d $YOUR_HOSTNAME -p tcp --dport 443 -j ACCEPT

# Allow and log SMTP on port 25
iptables -A INPUT -d $YOUR_HOSTNAME -p tcp --dport 25 -j LOG --log-level 7 --log-prefix "SMTP: TCP: Accepted" 
iptables -A INPUT -d $YOUR_HOSTNAME -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -d $YOUR_HOSTNAME -p udp --dport 25 -j LOG --log-level 7 --log-prefix "SMTP: UDP: Accepted" 
iptables -A INPUT -d $YOUR_HOSTNAME -p udp --dport 25 -j ACCEPT

# Allow POP3 on port 110
iptables -A INPUT -d $YOUR_HOSTNAME -p tcp --dport 110 -j LOG --log-level 7 --log-prefix "POP3: Accepted" 
iptables -A INPUT -d $YOUR_HOSTNAME -p tcp --dport 110 -j ACCEPT

# Allow IMAP on port 143
iptables -A INPUT -d $YOUR_HOSTNAME -p tcp --dport 143 -j LOG --log-level 7 --log-prefix "IMAP: Accepted" 
iptables -A INPUT -d $YOUR_HOSTNAME -p tcp --dport 143 -j ACCEPT


## Default Deny Rule
# Disallow anything that isn't explicitly allowed elsewhere.

iptables -A INPUT -j LOG --log-level 7 --log-prefix "Input: Dropped"
iptables -A INPUT -j DROP
iptables -A FORWARD -j LOG --log-level 7 --log-prefix "Forward: Rejected"
iptables -A FORWARD -j REJECT
