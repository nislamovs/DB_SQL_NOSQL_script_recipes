# Cronjobs

Display variable value - to enable cron jobs this should be `on`, not `off`;

`select @@global.event_scheduler;`

To enable `event_scheduler` you should login as root.

For demonstration clean `email` field from table `pupils`:

`UPDATE pupils SET email=''` 

View table contents:

`SELECT * FROM pupils`

Additional info:

https://dev.mysql.com/doc/refman/8.0/en/create-event.html
https://dev.mysql.com/doc/refman/8.0/en/events-overview.html