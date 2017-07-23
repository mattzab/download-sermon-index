#!/bin/bash
echo Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo install gnu-sed
brew install gnu-sed
echo install wget
brew install wget
brew link --overwrite wget
echo Make Sermon Index Directory
mkdir 'Sermon Index'
cd 'Sermon Index'
echo Download updated Speaker Listing
wget http://img.sermonindex.net/Cache_Update.zip
echo Extract Speaker Listing File
unzip *.zip
echo Delete Speaker Listing Zip
rm *.zip
echo  
echo Cleaning up XML files to be used with Wget...
echo  
echo replace trailing title tag with mp3 file extension
gsed -i -- 's,</Title>,.mp3,g' *.xml
echo  
echo remove exclamation points from titles
gsed -i -- 's,!,,g' *.xml
echo  
echo remove single quotes from titles
gsed -i "s,',,g" *.xml
echo  
echo remove ampersand from titles
gsed -i 's,&amp;,And,g' *.xml
echo  
echo replace colon with period in verses
gsed -i -- 's,:,.,g' *.xml
echo  
echo restore the colon in url addresses
gsed -i -- 's,p./,p:/,g' *.xml
echo  
echo remove spaces from titles
gsed -i -- 's, ,,g' *.xml
echo  
echo remove leading title tag
gsed -i -- 's,<Title>,,g' *.xml
echo  
echo remove leading url tag
gsed -i -- 's,<Url>,,g' *.xml
echo  
echo remove all remaining xml tags and everything inbetween
gsed -i 's,<.*>,,g' *.xml
echo  
echo cleanup white space
gsed -i '/^$/d' *.xml
echo  
echo make a directory for all xml files and copy xml files into corresponding directory
find . -name "*.xml" -exec sh -c 'mkdir "${1%.*}" ; mv "$1" "${1%.*}" ' _ {} \;
echo  
echo download everything by using wget
for d in ./*/ ; do (cd "$d" && while read filename; do read url; wget -O $filename $url; done < *.xml); done
echo  
echo delete xml files
for d in ./*/ ; do (cd "$d" && rm *.xml); done
echo  
#tell the user the process is finally over
echo  
echo  
echo *******THANK YOU*******
echo  
echo Thank you for your patience.
echo The download has finally finished.
