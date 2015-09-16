require "rack"
require "warden"
require "middleman/rack"
require "rack/contrib/try_static"

require_relative 'apps/advisor'

###
# Build statics
####

`bundle exec middleman build`

run Advisor.app
