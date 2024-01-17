# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    start = Time.now
    status, headers, body = @app.call(env)
    p (Time.now - start)*1000
    [status, headers, body]
    # END
  end
end
