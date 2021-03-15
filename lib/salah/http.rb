class Salah::HTTP
  require 'uri'
  require 'net/http'
  require 'json'
  require_relative 'http/bad_response_error'

  BASE_URI = URI.parse('https://api.pray.zone/')
  BadContentTypeError = Class.new(RuntimeError)
  NoLocationError = Class.new(RuntimeError)

  def initialize(key: nil)
    @key = key
  end

  def today(params)
    get "/v2/times/today.json", {key: @key}.merge!(params)
  end

  def tomorrow(params)
    get "/v2/times/tomorrow.json", {key: @key}.merge!(params)
  end

  def this_week(params)
    get "/v2/times/this_week.json", {key: @key}.merge!(params)
  end

  private

  def get(path, params)
    params   = parse_params!(params)
    response = http.request Net::HTTP::Get.new(join_path(path, params), default_headers)
    if Net::HTTPOK === response
      parse_response(response, response['content-type'])
    else
      raise BadResponseError.new("Bad response from API (#{response.class})", response)
    end
  end

  def parse_params!(params)
    params.delete_if{|_, v| v.nil?}
    params[:school] = params[:school].id if params[:school].respond_to?(:id)
    params[:juristic] = params[:juristic].id if params[:juristic].respond_to?(:id)
    return params if params[:city] || params[:ip]
    return params if params[:latitude] && params[:longitude]
    raise NoLocationError.new("Please provide a city, longitude and latitude coordinates or an IP address")
  end

  def join_path(path, params)
    [path, '?', URI.encode_www_form(params)].join
  end

  def http
    @http ||= Net::HTTP.start(BASE_URI.host, BASE_URI.port, use_ssl: true)
  end

  def parse_response(res, content_type)
    case content_type
    when 'application/json', 'application/json; charset=utf-8'
      Salah::Response.new res, OpenStruct.from_hash(JSON.parse(res.body))
    else
      raise BadContentTypeError.new("The content-type '#{content_type}' is not recognized")
    end
  end

  def default_headers
    {'User-Agent' => "salah.rb v#{Salah::VERSION}"}
  end
end
