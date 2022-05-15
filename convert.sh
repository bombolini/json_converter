#!/bin/sh
for file in *.html
do
while read -r line
do
grep -m1 $line $file
done<data > output
sed -i "s|\":{\"|\n|g" output
sed -i "s|},\"|\n|g" output
sed -i "s|{\"||g" output
name=`grep -A0 "postTitle" output | sed "s|^.*= ||g" | sed "s|\",||g" | sed "s|\"||g"`
id=`grep -B1 "beta.*1080p" output | head -1 | sed "s|.*= ||g"`
merge=`echo "$id $name"`
merged=`echo "$merge" | sed "s| |\t|"`
echo "$merged"
done > out2
rm output
exit
