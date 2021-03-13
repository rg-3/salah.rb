class Salah::HTTP
  require 'uri'
  require 'net/http'
  require 'json'

  BASE_URI      = URI.parse('https://api.pray.zone/')
  BadReplyError = Class.new(RuntimeError)
  ServerError   = Class.new(BadReplyError)

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
    response = http.request Net::HTTP::Get.new(path + '?' + URI.encode_www_form(params))
    case response
    when Net::HTTPOK then parse_response(response.body, response['content-type'])
    when Net::HTTPServerError then ServerError.new("The API responded with a 500 error")
    else raise BadReplyError.new("The API responded with an unexpected response code: #{response.code}")
    end
  end

  def parse_params!(params)
    params.delete_if{|_, v| v.nil?}
    params[:school] = params[:school].id if params[:school].respond_to?(:id)
    params
  end

  def http
    @http ||= Net::HTTP.start(BASE_URI.host, BASE_URI.port, use_ssl: true)
  end

  def parse_response(body, content_type)
    if content_type.start_with?('application/json')
      Salah::Response.new OpenStruct.from_hash(JSON.parse(body))
    else
      body
    end
  end
end
