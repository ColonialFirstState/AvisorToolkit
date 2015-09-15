require "rack"
require './advisor'
require "middleman/rack"
require "rack/contrib/try_static"

###
# Build statics
####

`bundle exec middleman build`

# Enable proper HEAD responses
use Rack::Head
run Advisor.app
