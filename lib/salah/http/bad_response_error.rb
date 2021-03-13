class Salah::HTTP::BadResponseError < RuntimeError
  attr_reader :response
  def initialize(*args, response)
    super(*args)
    @response = response
  end
end
