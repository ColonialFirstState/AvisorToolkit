require "rack"
require "middleman/rack"
require "rack/contrib/try_static"
require "warden"
require "digest"

require_relative 'advisor/login'

module Advisor
  def self.app
    Warden::Strategies.add(:password) do
      def valid?
        !params['password'].nil?
      end

      def authenticate!
        if Digest::SHA256.base64digest(params['password']) == ENV['PASS_DIGEST']
          success!({login: true})
        else
          fail!("Invalid password")
        end
      end
    end



    @@app ||= Rack::Builder.new do
      map '/' do
        # Enable proper HEAD responses
        use Rack::Head
        use Rack::Session::Cookie, :secret => 'test123'

        use Warden::Manager do |manager|
            manager.default_strategies :password
            manager.failure_app = Advisor.app
        end

        # Check if the user is logged in and handle login requests
        use Login

        # Attempt to serve static HTML files
        use Rack::TryStatic,
            :root => "build",
            :urls => %w[/],
            :try => ['.html', 'index.html', '/index.html']

        run lambda { |env|
          # Serve a 404 page if all else fails
          [
            404,
            {
              "Content-Type" => "text/html",
              "Cache-Control" => "public, max-age=60"
            },
            File.open("build/404/index.html", File::RDONLY)
          ]
        }
      end
    end
  end

  def self.login_app
    @@login_app ||= Rack::Builder.new do
      map '/login' do
        # Attempt to serve static HTML files
        use Rack::TryStatic,
            :root => "build",
            :urls => %w[/login],
            :try => ['.html', 'index.html', '/index.html']


        # Serve a 404 page if all else fails
        run lambda { |env|
          [
            404,
            {
              "Content-Type" => "text/html",
              "Cache-Control" => "public, max-age=60"
            },
            File.open("build/404/index.html", File::RDONLY)
          ]
        }
      end
    end
  end
end
