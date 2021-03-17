class Salah::Juristic < Struct.new(:id, :name)
  def self.find_by_name(name)
    Salah.juristics.find{|juristic| juristic.name == name}
  end

  def self.find_by_id(id)
    Salah.juristics.find{|juristic| juristic.id == id}
  end

  def to_int
    id
  end
end
