#!/bin/bash
echo Starting Script...
echo  
echo Cleaning up XML files to be used with Wget...

echo replace </title> with .mp3
sed -i -- 's,</Title>,.mp3,g' *.xml

echo remove ! from titles
sed -i -- 's,!,,g' *.xml

#remove all ( from titles
#sed -i 's,(,,g' *.xml

#remove all ) from titles
#sed -i 's,),,g' *.xml

echo remove ' from titles
sed -i "s,',,g" *.xml

echo remove &amp; from titles
sed -i 's,&amp;,And,g' *.xml

echo replace : with . in verses
sed -i -- 's,:,.,g' *.xml

echo restore the : in http://
sed -i -- 's,p./,p:/,g' *.xml

echo remove spaces from titles
sed -i -- 's, ,,g' *.xml

echo remove leading title tag
sed -i -- 's,<Title>,,g' *.xml

echo remove leading url tag
sed -i -- 's,<Url>,,g' *.xml

echo remove all remaining < and > tags and everything in-between
sed -i 's,<.*>,,g' *.xml

echo cleanup white space
sed -i '/^$/d' *.xml

echo make a directory for all files
find . -name "*.xml" -exec sh -c 'mkdir "${1%.*}" ; mv "$1" "${1%.*}" ' _ {} \;



echo wget everything oneliner
for d in ./*/ ; do (cd "$d" && while read filename; do read url; wget -O $filename $url; done < *.xml); done

echo delete xml files
for d in ./*/ ; do (cd "$d" && rm *.xml); done

#tell the user the process is finally over
echo *******THANK YOU*******
echo  
echo Thank you for your patience.
echo The download has finally finished.
