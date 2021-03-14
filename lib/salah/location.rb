class Salah::Location < Struct.new(:city, :country, :country_code,
                                   :latitude, :longitude, :elevation,
                                   :time_zone, :local_offset)
end
