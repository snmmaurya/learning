class HeadersMiddleware
  def initialize app
    @app = app
  end

  def call env
    @status, @headers, @response = @app.call(env)
    @headers["X-Snm-Config-Message"] = "Valid Request"
    [@status, @headers, @response]
  end

  # # Override method
  # # call on each object on array returned from call method
  # def each(&block)
  #   @response.each(&block)
  # end
end