class Salah::School < Struct.new(:id, :name, :fajr_angle, :isha_angle)
  def self.find_by_id(id)
    Salah.schools.find{|school| school.id == id}
  end

  def self.find_by_name(name)
    Salah.schools.find{|school| school.name == name}
  end

  def to_int
    id
  end
end
