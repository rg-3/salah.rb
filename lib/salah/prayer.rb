class Salah::Prayer < Struct.new(:name, :time, :date, :school, :location, :juristic)
  def fajr?()     name == 'Fajr'     end
  def dhuhr?()    name == 'Dhuhr'    end
  def asr?()      name == 'Asr'      end
  def maghrib?()  name == 'Maghrib'  end
  def isha?()     name == 'Isha'     end

  def monday?()    date.monday?    end
  def tuesday?()   date.tuesday?   end
  def wednesday?() date.wednesday? end
  def thursday?()  date.thursday?  end
  def friday?()    date.friday?    end
  def saturday?()  date.saturday?  end
  def sunday?()    date.sunday?    end
end
