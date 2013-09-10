# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'
require 'twitter'


# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')


Twitter.configure do |config|
  config.consumer_key = '9HazW5yTBbKDJLc5MDfvQ'
  config.consumer_secret = 'ZQcgFPExo9NjhkTWjEbPIdvtM9ODCnRXeRuHA2hJE'
  config.oauth_token = '177608199-vzZo83KV8MXk5nKehHIbhJh4NiBV014FjFxCXx0Q'
  config.oauth_token_secret = 'tVGSggM6mrFQHmV1GTi96B01kEeALjzk6l9RI3yiyA'
end
