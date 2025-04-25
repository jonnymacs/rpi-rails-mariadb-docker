# ddclient configuration for Dynu
#
# /etc/ddclient.conf
daemon=60                                                # Check every 60 seconds.
syslog=yes                                               # Log update msgs to syslog.
mail=root                                                # Mail all msgs to root.
mail-failure=root                                        # Mail failed update msgs to root.
pid=/var/run/ddclient.pid                                # Record PID in file.
use=web, web=checkip.dynu.com/, web-skip='IP Address'    # Get ip from server.
server=api.dynu.com                                      # IP update server.
protocol=dyndns2
login=<DYNU_USER>
password=<DYNU_PASSWORD>                                       # Password or MD5/SHA256 hash of password.
<DOMAIN>                                            # List one or more hostnames one on each line.
