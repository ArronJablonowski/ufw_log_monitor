# ufw_log_monitor
Uncomplicated Firewall log monitor parses UFW event logs for the Source MAC, Source IP, and Destination Port.    

## Usage
Parse the last 25 entries in UFW log:
```
./ufw_log_monitor.sh | tail -n 25
```

Watch a running feed of UFW logs: 
```
watch -n 2 "./ufw_log_monitor.sh | tail -n 25"
```

Example use cases:
* See when your system is being scanned and the local ☕ coffee shop.
* Watch your Chrome cast, etc. constantly scan your system. Pictured below. 
* Hours of entertainment at IT/Security conferences. 
* Anytime you want to watch UFW logs.

![alt text](https://github.com/ArronJablonowski/ufw_log_monitor/blob/main/LogMon.png?raw=true)
