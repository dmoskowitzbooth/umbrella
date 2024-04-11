require "http"
require "json"
print "Hello, there! Where are you located (or where do you want to check the need for an umbrella)?"
locationi=gets.chomp
pirate_key=ENV["PIRATE"]
gmaps_key=ENV["GMAPS_KEY"]
gmaps_url="https://maps.googleapis.com/maps/api/geocode/json?address=#{locationi}&key=#{gmaps_key}"
pp gmaps_url
gmaps_response=HTTP.get(gmaps_url)
gmaps_parsed=JSON.parse(gmaps_response)
gmaps_results=gmaps_parsed["results"]
lat=gmaps_results.at(0).fetch("geometry").fetch("location").fetch("lat")
lng=gmaps_results.at(0).fetch("geometry").fetch("location").fetch("lng")
coords=lat.to_s + "," + lng.to_s
pp coords
pirate_url="https://api.pirateweather.net/forecast/#{pirate_key}/#{coords}"
pirate_response=HTTP.get(pirate_url)
pirate_parsed=JSON.parse(pirate_response)
pirate_currently=pirate_parsed.fetch("currently").fetch("precipProbability")
if
  pirate_currently>0.5
  pp "Better bring an umbrella! The chance of precipitation right now is #{pirate_currently}"
else
  pp "You're likely fine without an umbrella. The chance of precipitation right now is #{pirate_currently}"
end
