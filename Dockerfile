FROM alpine:3.18

# Install msmtp and cron (busybox-suid for crond)
RUN echo "https://mirrors.ustc.edu.cn/alpine/v3.19/main" > /etc/apk/repositories && \
    echo "https://mirrors.ustc.edu.cn/alpine/v3.19/community" >> /etc/apk/repositories && \
    apk update && \
    apk add --no-cache \
        bash \
        busybox-suid \
        msmtp

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
COPY temp_monitor.sh /temp_monitor.sh
RUN mkdir -p /etc/periodic/1min
RUN cp /temp_monitor.sh /etc/periodic/1min/temp_monitor.sh && chmod +x /etc/periodic/1min/temp_monitor.sh
RUN chmod +x entrypoint.sh

CMD [ "/entrypoint.sh"]
