## Archive_files.sh

In real life, we have a server running on a limited disk space (1tb, 2tb,…).So we can archive the older files or large files to a specific folder so that the disk space becomes free and if we need those files we can access them as well.

It is a shell script file which check a particular directory.If there are files sized larger than 10 mb, it will compress them and store them in **archive** folder.

#### STEPS OF SCRIPT:
* Provide the path of the directory.

* Check if the directory is present or not.

* Create “archive” folder if not already present.

* Find all the files with size more than 10mb.

* Compress all files.

* Move the compressed files in the “archive” folder.

* Make a cron job to run the script every day at a given time.

#### commands

**To create or edit the file**
```bash
nano Archive_files.sh
```
after writing save using "ctrl + x" and then "y"

**To run**
```bash
sh Archive_files.sh
```

## Use Crontab

We are going to use cron, which is a linux daemon that allows us to run scripts in certain scheduled moments. Crontab files automate backups, system maintenance and other useful tasks.

In order to edit the crontab file with the editor you prefer(nano is the easiest), run in a terminal the command
```bash
crontab -e
```
Let’s understand the contrab line format:

minute(0–59) hour(0–23) day(1–31) month(1–12) weekday(0–6) command

Let’s say that we want to run the script everyday at 8:30 AM. we would type
```bash
30 08 * * * /home/mohan/Archive_files.sh
```

The first * stands for everyday, the second * stands for every month, the third * stands for every week day.

close it by pressing ctrl + X and Y .

## Backup.sh

It is a script file which can backup the files you need. This backup process will be automatic and it is something that every linux user or admin needs.

#### STEPS OF SCRIPT:

* Provide the path of the source directory and the destination[where backup file will be stored] directory.
* Archive the source directory
* Make a cron job to run the script every day at a given time.

The important command here is the following:
```bash
tar -czf "$BACKUP_DST/$BACKUP_DATE/$BACKUP_FILENAME" "$BACKUP_SRC"
```
**c**: create
**z**: compress the files in order to reduce the size
**f**: use archive file or device ARCHIVE


