# connection_check
Check for idle connections and reconnect when failed.
For use with "systemd" "units".
A timer unit checks every 5 minutes whether there is a connection via a specific port (ESTABLISHED). If the connection is missing, a system service is started to re-establish the connection.

## Possible use:

- Mail agent (fetchmail, getmail) loses connection to the IMAP IDLE account, e.g. because of a forced disconnection by the DSL provider.

- IMAP IDLE connection to a server is not stable and breaks off, e.g. due to a network change WiFi> Mobile data> WiFi (sailfish OS).

## Installation:
1. Copy `connection-check.sh` to the location of your choice.
2. Open the file `connection-check.sh`
Change PORT with the number of the port you want to check.
Change line 14 and add the command or systemd service you want to restart.
3. Copy `connection-check.timer` to `/etc/systemd/system/`
4. Copy `connection-check.service` to `/etc/systemd/system/`
5. Restart the systemd daemon with: 
```
systemctl daemon-reload
```
6. Start the timer: 
```
systemctl start connection-check.timer
```
7. To start the timer at boot do: 
```
systemctl enable connection-check.timer
```
