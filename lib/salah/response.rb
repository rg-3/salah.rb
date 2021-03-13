class Salah::Response
  PRAYER_NAMES = %w(Fajr Dhuhr Asr Maghrib Isha)
  attr_reader :prayers

  def initialize(body)
    @prayers = []
    populate_prayers_field! @prayers, body
  end

  private

  def populate_prayers_field!(prayers, body)
    prayer_times = body.results.datetime
    prayer_times.each do |prayer|
      prayers.concat PRAYER_NAMES.map {|name|
        date = prayer.date
        school_name = body.results.settings.school
        Salah::Prayer.new(name,
          prayer.times[name],
          Salah::Date.new(date.gregorian, date.hijri, date.timestamp),
          Salah::School.find_by_name(school_name) || school_name
        )
      }
    end
  end
end
