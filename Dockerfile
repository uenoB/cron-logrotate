FROM alpine:latest
RUN apk --no-cache add logrotate
COPY --chmod=600 crontab /var/spool/cron/crontabs/root
CMD ["sh", "-c", "exec crond -f -l ${CRON_LOGLEVEL:-2}"]
