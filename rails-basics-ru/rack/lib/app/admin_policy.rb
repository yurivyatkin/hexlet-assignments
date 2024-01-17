# frozen_string_literal: true

require 'rack'

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    request = Rack::Request.new(env)
    path = request.path
    if path.start_with?('/admin')
      [403, headers, []]
    else
      [status, headers, body]
    end
    # END
  end
end
