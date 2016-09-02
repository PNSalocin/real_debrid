require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'real_debrid'
require 'webmock/rspec'
require 'helpers/url'

RSpec.configure do |c|
  c.include Helpers::Url
end
