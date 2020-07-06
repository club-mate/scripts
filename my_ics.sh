#!/bin/bash
#
# description : make .ics calender file
# author : kh-2030
# created : 26.02.2020
# last change : 10.03.2020
#
#############################

echo "BEGIN:VCALENDAR
"
while IFS="" read -r i || [ -n "$i" ]
do
date1=`echo ${i} | awk -F " - " '{printf $1}'`
date2=`echo ${i} | awk -F " - " '{printf $2}'`
echo "BEGIN:VEVENT
DTSTART;VALUE=DATE:${date1}
DTEND;VALUE=DATE:${date2}
SUMMARY:Unterrichtsfreie Zeit
UID:$(uuidgen)@example.com
END:VEVENT
"
done <dates.txt
echo "PRODID:my_ics.sh - https://github.com/clubmate/scripts/my_ics.sh
VERSION:2.0
END:VCALENDAR"

exit 0
