class Salah::HTTP
  require "uri"
  require "net/http"
  require "json"
  require_relative "http/bad_response_error"

  BASE_URI = URI.parse("https://api.pray.zone/")
  BadContentTypeError = Class.new(RuntimeError)
  NoLocationError = Class.new(RuntimeError)

  def initialize(key: nil)
    @key = key
  end

  #
  # @note
  #   This method provides an interface to the [times/today.json endpoint](https://prayertimes.date/api/docs/today).
  #
  # @return [Salah::Response]
  #
  def today(params)
    get "/v2/times/today.json", {key: @key}.merge!(params)
  end

  #
  # @note
  #   This method calls {#day} with tomorrow's date. Tomorrow's date is calculated relative to system time.
  #
  # @return [Salah::Response]
  #
  def tomorrow(params)
    day Date.today.next_day, params
  end

  #
  # @note
  #   This method provides an interface to the [times/this_week.json endpoint](https://prayertimes.date/api/docs/this_week).
  #
  # @return [Salah::Response]
  #
  def this_week(params)
    get "/v2/times/this_week.json", {key: @key}.merge!(params)
  end

  #
  # @param [Date, String] date
  #   The date to request prayers for, either as a Date object or a String in iso8601 format.
  #
  # @param [Hash] options
  #   A hash of options that map to PrayerTimes.date options.
  #
  # @note
  #  This method provides an interface to the [times/day.json endpoint](https://prayertimes.date/api/docs/day)
  #
  def day(date, params)
    date = date.iso8601 if date.respond_to?(:iso8601)
    get "/v2/times/day.json", {key: @key, date: date}.merge!(params)
  end

  private

  def get(path, params)
    params = parse_params!(params)
    response = http.request Net::HTTP::Get.new(join_path(path, params), default_headers)
    if Net::HTTPOK === response
      parse_response(response, response["content-type"])
    else
      raise BadResponseError.new("Bad response from API (#{response.class})", response)
    end
  end

  def parse_params!(params)
    params.delete_if { |_, v| v.nil? }
    params[:school] = Integer(params[:school] || Salah::School.find_by_name("Muslim World League"))
    params[:juristic] = Integer(params[:juristic]) if params[:juristic]
    params[:latitude] = params.delete(:lat) if params[:lat]
    params[:longitude] = params.delete(:lng) if params[:lng]
    return params if params[:city] || params[:ip]
    return params if params[:latitude] && params[:longitude]
    raise NoLocationError.new("Please provide a city, longitude and latitude coordinates or an IP address")
  end

  def join_path(path, params)
    [path, "?", URI.encode_www_form(params)].join
  end

  def http
    @http ||= Net::HTTP.start(BASE_URI.host, BASE_URI.port, use_ssl: true)
  end

  def parse_response(res, content_type)
    case content_type
    when "application/json", "application/json; charset=utf-8"
      Salah::Response.new res, OpenStruct.from_hash(JSON.parse(res.body))
    else
      raise BadContentTypeError.new("The content-type '#{content_type}' is not recognized")
    end
  end

  def default_headers
    {"User-Agent" => "salah.rb v#{Salah::VERSION}"}
  end
end
