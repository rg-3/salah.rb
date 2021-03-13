class Salah::Response
  PRAYER_NAMES = %w(Fajr Dhuhr Asr Maghrib Isha)
  attr_reader :prayers

  def initialize(body)
    @prayers = populate_prayers!(body)
  end

  private

  def populate_prayers!(body)
    prayer_times = body.results.datetime
    school_name  = body.results.settings.school
    prayer_times.map do |prayer_time|
      PRAYER_NAMES.map {|name|
        date = prayer_time.date
        Salah::Prayer.new(name,
          prayer_time.times[name],
          Salah::Date.new(date.gregorian, date.hijri, date.timestamp),
          Salah::School.find_by_name(school_name) || school_name
        )
      }
    end.flatten
  end
end
