require 'rack'
require_relative 'time_format'

class App
  def call(env)
    @request = Rack::Request.new(env)

    return response(404, 'Not Found 404') unless @request.path == '/time'

    format = TimeFormat.new(@request.params['format'])

    if format.valid?
      response(200, format.time_request)
    else
      response(400, "Unknown time format #{format.unknown_params}")
    end
  end

  private

  def response(status, body)
    [status, { 'Content-Type' => 'text/plain' }, [body]]
  end
end
