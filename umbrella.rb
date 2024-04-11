require "http"
require "json"
print "Hello, there! Where are you located (or where do you want to check the need for an umbrella)?"
locationi=gets.chomp
pirate_key=ENV["PIRATE"]
gmaps_key=ENV["GMAPS_KEY"]
gmaps_url="https://maps.googleapis.com/maps/api/geocode/json?address=#{locationi}&key=#{gmaps_key}"
gmaps_response=HTTP.get(gmaps_url)
gmaps_parsed=JSON.parse(gmaps_response)
gmaps_results=gmaps_parsed[:results]
pp gmaps_results.class
pp gmaps_url
geo=gmaps_results.fetch(:geometry).fetch(:location)
pp geo
