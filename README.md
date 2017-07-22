# Download All SermonIndex.net Audio Files
A Bash Script To Download All Sermons On SermonIndex.net

## Linux Users:
Download the Bash Script, Download speakers.zip, and execute the bash script from within the directory containing the XML files. (Make Download_all.sh executable, and put it in the folder with the XML files, then use terminal to run the script)

## Mac Users:
I wrote this script on Linux, but I suspect it should work exactly the same for you. Untested.

## Windows Users:
Use Cygwin and install wget, then navigate through the terminal to the directory with the XML files, and run the script from there.
Cygwin How-To: http://lifehacker.com/179514/geek-to-live--introduction-to-cygwin-part-i

# Usage Ideas:
### Multiple Instances
If your connection is fast enough, you can split the XML files into multiple directories, say A-M and N-Z, or any configuration you like, and run a separate instance in each directory. This will have them downloading in parallel, to speed things along.

### Use The Cloud
Use an Amazon AWS EC2 instance and use remote-desktop to log in and use the script to download everything with a faster connection than you can find anywhere else. (~40 GiB kind of speeds) I did this, and downloaded the files to my Google Drive directory so they could be uploading while being downloaded, simultaneously. I also broke this up into three instances of the script running at the same time, and I still wasn't able to max out the connection. I was able to download _and_ re-upload the entire archive to Google Drive in under a day. Then I can let Google Drive just sync the folder to my home PC over time, as my home connection is very slow.

## Known Issues:
#### XML Source
The XML files are currently coming from this GitHub project, but it would be much better to retreive the XML archive from SermonIndex to make sure it's always current and up-to-date. I plan to implement this in the future.
