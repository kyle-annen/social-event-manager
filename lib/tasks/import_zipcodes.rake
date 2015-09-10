
require 'smarter_csv'
namespace :import_zipcodes do
  task :create_zipcodes => :environment do
    filename = './tmp/zipcode.csv'
    options = {:key_mapping => {:zip => :zip,
                                        :city => :city,
                                        :state => :state,
                                        :latitude => :lat,
                                        :longitude => :long,
                                        :timezone => :timezone,
                                        :dst => :dst}}
    n = SmarterCSV.process(filename, options) do |array|
      Zipcode.create( array.first )
    end
  end
end 
