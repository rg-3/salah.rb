class Salah::Response
  PRAYER_NAMES = %w[Fajr Dhuhr Asr Maghrib Isha]
  #
  # @return [Array<Salah::Prayer>]
  #  Returns an array of {Salah::Prayer} objects.
  #
  attr_reader :prayers

  #
  # @return [String]
  #  Returns the HTTP status code (eg "200")
  #
  attr_reader :code

  #
  # @return [String]
  #  Returns the status of the response (eg "OK")
  #  This attribute is found in the response body
  #  and shouldn't be confused with the HTTP status
  #  line.
  #
  attr_reader :status

  #
  # @return [Hash]
  #   Returns the response headers as a Hash.
  #
  attr_reader :headers

  def initialize(res, body)
    @prayers = populate_prayers!(body)
    @code = res.code
    @headers = res.each_header.to_h
    @status = body.status
  end

  private

  def populate_prayers!(body)
    prayer_times = body.results&.datetime || []
    school_name = body.results&.settings&.school
    location = body.results&.location
    juristic = body.results&.settings&.juristic
    prayer_times.map do |prayer_time|
      PRAYER_NAMES.map { |name|
        date = prayer_time.date
        Salah::Prayer.new(name,
          prayer_time.times[name],
          Salah::Date.new(date.gregorian, date.hijri, date.timestamp),
          Salah::School.find_by_name(school_name) || school_name,
          Salah::Location.new(
            location.city, location.country,
            location.country_code,
            location.latitude, location.longitude,
            location.elevation,
            location.time_zone, location.local_offset
          ),
          Salah::Juristic.find_by_name(juristic) || juristic)
      }
    end.flatten
  end
end
