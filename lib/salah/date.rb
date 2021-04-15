class Salah::Date < Struct.new(:iso8601, :hijri, :timestamp)
  require "date"

  def monday?
    to_date.monday?
  end

  def tuesday?
    to_date.tuesday?
  end

  def wednesday?
    to_date.wednesday?
  end

  def thursday?
    to_date.thursday?
  end

  def friday?
    to_date.friday?
  end

  def saturday?
    to_date.saturday?
  end

  def sunday?
    to_date.sunday?
  end

  #
  # @return [Date]
  #   Returns a Date object for the string field {#iso8601}.
  #
  def to_date
    @to_date ||= Date.strptime iso8601, "%Y-%m-%d"
  end
end
