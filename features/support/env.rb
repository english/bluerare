require 'sinatra/base'
require 'mail'
require 'active_model'
require 'padrino-helpers'

require_relative '../../app'

require 'capybara/cucumber'
require 'minitest/unit'

Capybara.app = App
Sinatra::Application.set :environment, :test

Mail.defaults do
  delivery_method :test
end

World(MiniTest::Assertions)
