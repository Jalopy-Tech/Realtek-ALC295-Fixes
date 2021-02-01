Realtek ALC295 Fixes for Linux

INSTALLATION

To fix Realtek ALC295 problem on Linux:

1.	Install alsa-tools if not installed:

sudo apt install alsa-tools


2. Copy ALCHeadphoneStaticFix.sh and ALCRebootFromWinFix.sh files to /usr/local/bin

    Make sure to have chmod 755
    
3. Run the scripts as root in a terminal to immediately fix the problems.


4. To run the script on startup, use cron with the @reboot command:

sudo crontab -e

and then add lines in crontab:
@reboot /usr/local/bin/ALCRebootFromWinFix.sh
@reboot /usr/local/bin/ALCHeadphoneStaticFix.sh

5. To run /usr/local/bin/ALCHeadphoneStaticFix.sh script on resume from suspend, create a link to the file and put it in /lib/systemd/system-sleep
(ALCRebootFromWinFix.sh doesn't need this).

For discussion thread, see:
https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/1648183

For more technical details regarding this fix, see:
https://bugzilla.kernel.org/show_bug.cgi?id=195457


UNINSTALLATION

1. Delete the  scripts:
sudo rm /usr/local/bin/ALCRebootFromWinFix.sh
sudo rm /usr/local/bin/ALCHeadphoneStaticFix.sh

2. Remove from cron:

sudo crontab -e

and then remove lines in crontab:
@reboot /usr/local/bin/ALCRebootFromWinFix.sh
@reboot /usr/local/bin/ALCHeadphoneStaticFix.sh

3. Delete the ALCHeadphoneStaticFix.sh file link in  /lib/systemd/system-sleep


TECHNICAL Details for improvements:

GETTING proc values and comparing between Linux and Windows

Cold boot into Linux or boot into Windows and restart into Linux.

For each situation:

Run:
sudo su
echo 1 > /sys/module/snd_hda_codec/parameters/dump_coef

then run ./alsa-info.sh
This will dump a report into a temporary file which can be copied as desired.

To compare the two files use diff (direct into a compare text file).
diff file1.txt file2.txt > compare.txt


