#!/bin/bash

echo Make Directory Sermon Index
mkdir 'Sermon Index'
cd 'Sermon Index'
echo Download updated Speaker Listing
wget http://img.sermonindex.net/Cache_Update.zip
echo  
echo Extract Speaker Listing File
unzip *.zip
echo  
echo Delete Speaker Listing Zip
rm *.zip
echo  
echo Cleaning up XML files to be used with Wget...
echo  
echo replace trailing title tag with mp3 file extension
sed -i -- 's,</Title>,.mp3,g' *.xml
echo  
echo remove exclamation points from titles
sed -i -- 's,!,,g' *.xml
echo  
echo remove single quotes from titles
sed -i "s,',,g" *.xml
echo  
echo remove ampersand from titles
sed -i 's,&amp;,And,g' *.xml
echo  
echo replace colon with period in verses
sed -i -- 's,:,.,g' *.xml
echo  
echo restore the colon in url addresses
sed -i -- 's,p./,p:/,g' *.xml
echo  
echo remove spaces from titles
sed -i -- 's, ,,g' *.xml
echo  
echo remove leading title tag
sed -i -- 's,<Title>,,g' *.xml
echo  
echo remove leading url tag
sed -i -- 's,<Url>,,g' *.xml
echo  
echo remove all remaining xml tags and everything inbetween
sed -i 's,<.*>,,g' *.xml
echo  
echo cleanup white space
sed -i '/^$/d' *.xml
echo  
echo make a directory for all xml files and copy xml files into corresponding directory
find . -name "*.xml" -exec sh -c 'mkdir "${1%.*}" ; mv "$1" "${1%.*}" ' _ {} \;
echo  
echo download everything by using wget
for d in ./*/ ; do (cd "$d" && while read filename; do read url; wget -O $filename $url; done < *.xml); done
echo  
echo delete xml files
for d in ./*/ ; do (cd "$d" && rm *.xml); done
#tell the user the process is finally over
echo  
echo  
echo *******THANK YOU*******
echo  
echo Thank you for your patience.
echo The download has finally finished.
