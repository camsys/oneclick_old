require 'csv'

def process_trip output, current_trips
  current_trips = current_trips.drop_while do |a|
    a[3].nil? or a[4].nil?
  end
  current_trips = current_trips.reverse.drop_while do |a|
    a[3].nil? or a[4].nil?
  end.reverse
  current_trips.each do |trip|
    output << trip
  end
end

CSV.open("stop_times2.txt", "w") do |output|

  current_trip_id = nil
  current_trips = []

# trip_id,stop_sequence,stop_id,arrival_time,departure_time,stop_headsign,route_short_name,pickup_type,drop_off_type,shape_dist_traveled
  CSV.foreach(ARGV[0]) do |line|
    if line[0]=='trip_id'
      output << line
      next
    end
    if !current_trip_id or line[0]==current_trip_id
      current_trips << line
      current_trip_id = line[0]
      next
    end
    # new trip
    process_trip output, current_trips
    current_trips = [line]
    current_trip_id = line[0]
  end

end

