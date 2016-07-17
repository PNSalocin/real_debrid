require 'coveralls'
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'real_debrid'
Dir["./spec/support/**/*.rb"].sort.each { |f| require f}