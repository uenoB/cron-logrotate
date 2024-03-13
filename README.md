# docker-cron-logrotate

This is an Alpine Linux image consisting only of cron and logrotate,
which is used for periodic log file rotation in a container cluster.

## Usage

1. Mount a volume containing log files to `/var/log`.
2. Set `LOGROTATE_CONF` environment variable to the path of `logrotate.conf`.
   (default: /etc/logrorate.conf)
3. Set `LOGROTATE_STATE` environment variable to the path of `logrotate.state`.
   (default: /var/lib/logrotate.state)
4. Set `CRON_LOGLEVEL` environment variable to a number between 0 and 8.
   (default: 2)
5. (Optional) Replace `/var/spool/cron/crontabs/root` with your favorite timing.

For example:
```sh
docker run \
  -e LOGROTATE_STATE=/var/log/logrotate.state \
  -e LOGROTATE_CONF=/etc/logrotate/logrotate.conf \
  -e CRON_LOGLEVEL=1 \
  -v conf:/etc/logrotate:ro \
  -v logs:/var/log:rw \
  ghcr.io/uenob/cron-logrotate
```
