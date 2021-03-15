class Salah::Prayer < Struct.new(:name, :time, :date, :school, :location, :juristic)
  def fajr?() name == 'Fajr' end
  def dhuhr?() name == 'Dhuhr' end
  def asr?() name == 'Asr' end
  def maghrib?() name == 'Maghrib' end
  def isha?() name == 'Isha' end
end
