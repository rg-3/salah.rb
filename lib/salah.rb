class Salah
  require 'openstruct-from_hash'
  require_relative 'salah/prayer'
  require_relative 'salah/date'
  require_relative 'salah/school'
  require_relative 'salah/location'
  require_relative 'salah/juristic'
  require_relative 'salah/http'
  require_relative 'salah/response'
  require_relative 'salah/version'

  #
  # @return [Array<Salah::Juristic>]
  #   Returns an array of {Salah::Juristic} objects.
  #
  def self.juristics
    @juristics ||= [[0, 'Shafii'], [1, 'Hanafi']].map{|params| Salah::Juristic.new(*params)}
  end

  #
  # @return [Array<Salah::School>]
  #   Returns an array of {Salah::School} objects.
  #
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

  #
  # @return (see Salah::HTTP#today)
  #
  def self.today(**options)
    new(key: options.delete(:key)).today(**options)
  end

  #
  # @return (see Salah::HTTP#tomorrow)
  #
  def self.tomorrow(**options)
    new(key: options.delete(:key)).tomorrow(**options)
  end

  #
  # @return (see Salah::HTTP#this_week)
  #
  def self.this_week(**options)
    new(key: options.delete(:key)).this_week(**options)
  end

  def initialize(key: nil)
    @client = Salah::HTTP.new(key: key)
  end

  #
  # @return (see Salah::HTTP#today)
  #
  def today(**options)
    @client.today(options)
  end

  #
  # @return (see Salah::HTTP#tomorrow)
  #
  def tomorrow(**options)
    @client.tomorrow(options)
  end

  #
  # @return (see Salah::HTTP#this_week)
  #
  def this_week(**options)
    @client.this_week(options)
  end
end
