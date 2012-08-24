namespace :weather_rooster do
  desc "Pull the latest forecasts from the weather services"
  task :pull_latest_forecasts => :environment do
    services = WeatherService.where(:active => true)
    cities = City.all
    cities.each do |c|
      services.each {|s| s.pull_latest_forecast(c)} rescue nil
      sleep 1
    end
  end
end
