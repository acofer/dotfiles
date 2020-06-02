#!/bin/bash
# Did you "export as original" from Photos.App? Put this in that folder and run it to sort them by month.

for i in IMG_*.jpeg; do
	EXIF=`convert "$i" -format "%[EXIF:DateTime]" info:`
	FP=`echo $EXIF | cut -c 1-7`
	if [[ ! $FP =~ ^[0-9]{4}:[0-9]{2}$ ]]; then
		echo "$i date not valid: $FP"
		continue
	fi
	DATE=`echo $FP | sed s/:/-/g`
	if [ ! -d "$DATE" ]; then
		mkdir "$DATE"
	fi
	NAME=`basename "$i" .jpeg`
	mv "$NAME".* "$DATE"
done

for j in IMG_*.mov; do
	DATE=`ffprobe -v quiet -print_format json -show_format "$j" | jq '.format.tags["com.apple.quicktime.creationdate"]' | cut -c 2-8`
	if [ ! -d "$DATE" ]; then
		mkdir "$DATE"
	fi
	NAME=`basename "$j" .mov`
	mv "$NAME".* "$DATE"
done

for k in IMG_*.mp4; do
	DATE=`ffprobe -v quiet -print_format json -show_format "$k" | jq '.format.tags.creation_time' | cut -c 2-8`
	if [ ! -d "$DATE" ]; then
		mkdir "$DATE"
	fi
	NAME=`basename "$k" .mp4`
	mv "$NAME".* "$DATE"
done
	
