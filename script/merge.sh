MERGED=merged
MARTA=gtfs-atlanta
REGIONAL=gtfs-regional

mkdir ../$MERGED

# agency.txt - use regional
cp ../$REGIONAL/agency.txt ../$MERGED/

# calendar.txt - append, skipping first row of second one
cp ../$REGIONAL/calendar.txt ../$MERGED/
tail -n +2 ../$MARTA/calendar.txt >> ../$MERGED/calendar.txt

# calendar_dates.txt - just copy from MARTA
cp ../$MARTA/calendar_dates.txt ../$MERGED/

# routes.txt - use the regional one, then add data from MARTA, adding agency ID in first column
cp ../$REGIONAL/routes.txt ../$MERGED/
tail -n +2 ../gtfs-atlanta/routes.txt | awk '{ print "MARTA," $0 }' >> ../$MERGED/routes.txt

# shapes.txt - concatenate but need columns reordered

# stop_times.txt - use MARTA headers, need to reorder regional to match
# and filter out the bad stop times

# stops.txt - ditto

# trips.txt - ditto

cp ../google_transit_manhattan/{agency.txt,calendar.txt,calendar_dates.txt,routes.txt,shapes.txt} .

for file in ../google_transit_{manhattan,bronx,brooklyn,queens,staten_island}/stops.txt; do
	tail -n +2 $file >> stops_unmerged.txt
done;

head -n 1 ../google_transit_manhattan/stops.txt > stops.txt
cat stops_unmerged.txt | sort | uniq >> stops.txt
rm stops_unmerged.txt


head -n 1 ../google_transit_manhattan/trips.txt > trips.txt
for file in ../google_transit_{manhattan,bronx,brooklyn,queens,staten_island}/trips.txt; do
	tail -n +2 $file >> trips.txt
done;

head -n 1 ../google_transit_manhattan/stop_times.txt > stop_times.txt
for file in ../google_transit_{manhattan,bronx,brooklyn,queens,staten_island}/stop_times.txt; do
	tail -n +2 $file >> stop_times.txt
done;
#then zip the feed and apply the GTFS transformer
