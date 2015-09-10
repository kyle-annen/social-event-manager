filename = '/tmp/zipcode.csv'
options = {:chunk_size => 1, :key_mapping => {:zip => :zip,
                            :city => :city,
                            :state => :state,
                            :latitude => :lat,
                            :longitude => :long,
                            :timezone => :timezone,
                            :dst => :dst}}
n = SmarterCSV.process(filename, options) do |chunk|
  Zipcode.save( chunk )
end

