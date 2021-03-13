class Salah
  require 'openstruct-from_hash'
  require_relative 'salah/prayer'
  require_relative 'salah/school'
  require_relative 'salah/http'
  require_relative 'salah/response'
  require_relative 'salah/version'

  Date = Struct.new(:iso8601, :hijri, :timestamp)

  def self.schools
    @schools ||= [
      [0, 'Ithna Ashari', 16, 14],
      [1, 'University of Islamic Sciences, Karachi', 18, 18],
      [2, 'Islamic Society of North America', 15, 15],
      [3, 'Muslim World League', 18, 17],
      [4, 'Umm Al-Qura University, Mecca', 18.5, 90],
      [5, 'Egyptian General Authority of Survey', 18, 18],
      [7, 'Institute of Geophysics, University of Tehran', 17.7, 14],
      [8, 'Morocco', 19, 18],
      [9, 'Department of Islamic Advancement, Malaysia (JAKIM)', 20, 18],
      [10, 'Majlis Ugama Islam Singapura', 20, 18],
      [11, 'Union des Organisations Islamiques de France', 12, 12],
      [12, 'Turkey', 12, 12]
    ].map {|params| Salah::School.new(*params)}
  end

  def self.today(**options)
    new(key: options.delete(:key)).today(**options)
  end

  def self.tomorrow(**options)
    new(key: options.delete(:key)).tomorrow(**options)
  end

  def self.this_week(**options)
    new(key: options.delete(:key)).this_week(**options)
  end

  def initialize(key: nil)
    @client = Salah::HTTP.new(key: key)
  end

  def today(**options)
    @client.today(options)
  end

  def tomorrow(**options)
    @client.tomorrow(options)
  end

  def this_week(**options)
    @client.this_week(**options)
  end
end
