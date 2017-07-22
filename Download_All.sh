#!/bin/bash

#replace </title> with .mp3
sed -i -- 's,</Title>,.mp3,g' *.xml

#remove ! from titles
sed -i -- 's,!,,g' *.xml

#remove all ( from titles
#sed -i 's,(,,g' *.xml

#remove all ) from titles
#sed -i 's,),,g' *.xml

#remove ' from titles
sed -i "s,',,g" *.xml

#remove &amp; from titles
sed -i 's,&amp;,And,g' *.xml

#replace : with . in verses
sed -i -- 's,:,.,g' *.xml

#restore the : in http://
sed -i -- 's,p./,p:/,g' *.xml

#remove spaces from titles
sed -i -- 's, ,,g' *.xml

#remove leading title tag
sed -i -- 's,<Title>,,g' *.xml

#remove leading url tag
sed -i -- 's,<Url>,,g' *.xml

#remove all remaining < and > tags and everything in-between
sed -i 's,<.*>,,g' *.xml

#cleanup white space
sed -i '/^$/d' *.xml

#make a directory for all files
find . -name "*.xml" -exec sh -c 'mkdir "${1%.*}" ; mv "$1" "${1%.*}" ' _ {} \;



#wget everything oneliner?
for d in ./*/ ; do (cd "$d" && while read filename; do read url; wget -O $filename $url; done < *.xml); done

#delete xml files
for d in ./*/ ; do (cd "$d" && rm *.xml); done

#tell the user the process is finally over
echo *******THANK YOU*******
echo  
echo Thank you for your patience.
echo The download has finally finished.
