class Salah::Response
  PRAYER_NAMES = %w(Fajr Dhuhr Asr Maghrib Isha)
  attr_reader :prayers
  attr_reader :code
  attr_reader :status

  def initialize(res, body)
    @code    = res.code
    @status  = body.status
    @prayers = populate_prayers!(body)
  end

  private

  def populate_prayers!(body)
    prayer_times = body.results&.datetime || []
    school_name  = body.results&.settings&.school
    location     = body.results&.location
    prayer_times.map do |prayer_time|
      PRAYER_NAMES.map {|name|
        date = prayer_time.date
        Salah::Prayer.new(name,
          prayer_time.times[name],
          Salah::Date.new(date.gregorian, date.hijri, date.timestamp),
          Salah::School.find_by_name(school_name) || school_name,
          Salah::Location.new(location.city, location.country, location.country_code,
                              location.latitude, location.longitude, location.elevation,
                              location.time_zone, location.local_offset)
        )
      }
    end.flatten
  end
end
