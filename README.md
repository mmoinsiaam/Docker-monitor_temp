# Docker-monitor_temp
Container that monitors temperature and sends alerts if temps pass threshold.

## Requirements
Email service must be Gmail.

Must have 2FA enabled.

Must have an app password on their gmail account. For more info: https://support.google.com/mail/answer/185833?hl=en
 
## Docker-compose config
There are only 4 environment variables.

TO <- the recipient of the email

FROM <- your email

PASSWORD <- 16 digit app password

TEMP_THRESHOLD <- (celsius) if temp rises above this threshold, email will be sent

## Build and Run
Build using
```
docker compose build --no-cache
```
Run using
```
docker compose up -d
```
