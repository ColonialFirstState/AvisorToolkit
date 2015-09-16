require "rack"
require "middleman/rack"
require "warden"

module Advisor
  class Login
    def initialize(app)
      @app = app
    end

    def call(env)
      request_path = env['PATH_INFO']
      is_login_page = !/\/login/.match(request_path).nil?
      is_css_or_js = !/.*\.(css|js)/.match(request_path).nil?
      if is_css_or_js or is_login_page or env['warden'].authenticated?
        if is_login_page and env['REQUEST_METHOD'] == "POST"
          env['warden'].authenticate!
          res = Rack::Response.new
          res.redirect("/")
          res.finish
        else
          @app.call(env)
        end
      else
        res = Rack::Response.new
        res.redirect("/login")
        res.finish
      end
    end
  end
end
