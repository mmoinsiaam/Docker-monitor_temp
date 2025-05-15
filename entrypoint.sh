#!/bin/sh

# Generate msmtprc file from env vars
cat <<EOF > /root/.msmtprc
defaults
auth on
tls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile /root/.msmtp-log

account gmail
host smtp.gmail.com
port 587
from ${FROM}
user ${FROM}
password ${PASSWORD}

account default : gmail
EOF

chmod 600 /root/.msmtprc
touch /root/.msmtp-log
echo "*     *     *     *     * run-parts /etc/periodic/1min" >> /etc/crontabs/root

crond -f -l 2
