
require 'smarter_csv'
namespace :import_zipcodes do
  task :create_zipcodes => :environment do
    filename = './tmp/zipcode.csv'
    options = {:chunks => 100, :key_mapping => {:zip => :zip,
                                        :city => :city,
                                        :state => :state,
                                        :latitude => :lat,
                                        :longitude => :long,
                                        :timezone => :timezone,
                                        :dst => :dst}}
    n = SmarterCSV.process(filename, options) do |chunk|
      Zipcode.create( chunk )
    end
  end
end 


