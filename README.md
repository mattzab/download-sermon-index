# Download All SermonIndex.net Audio Files
A Bash Script To Download All Sermons On SermonIndex.net

## Linux Users:
Download the Bash Script, make it executable, and run it in terminal.

## Mac Users:
Be sure to use the OSX version of the script. Make it executable, and run it with terminal. It will ask for your password since it has to install homebrew, gnu-sed, and wget to run the script.

## Windows Users:
Use Cygwin and install wget, then navigate through the terminal to the script, and run from there.
Cygwin How-To: http://lifehacker.com/179514/geek-to-live--introduction-to-cygwin-part-i

# Usage Ideas:
### Multiple Instances
If your connection is fast enough, you can split the XML files into multiple directories, say A-M and N-Z, or any configuration you like, and run a separate instance in each directory. This will have them downloading in parallel, to speed things along.

### Use The Cloud
Use an Amazon AWS EC2 instance and use remote-desktop to log in and use the script to download everything with a faster connection than you can find anywhere else. (~40 GiB kind of speeds) I did this, and downloaded the files to my Google Drive directory so they could be uploading while being downloaded, simultaneously. I also broke this up into three instances of the script running at the same time, and I still wasn't able to max out the connection. I was able to download _and_ re-upload the entire archive to Google Drive in under a day. Then I can let Google Drive just sync the folder to my home PC over time, as my home connection is very slow.

## Support:
#### Contact: mattzab+support@gmail.com
