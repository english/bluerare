require 'sinatra/base'
require 'mail'
require 'active_model'
require 'padrino-helpers'

require_relative '../../app'

require 'capybara/cucumber'
require 'minitest/unit'

Capybara.app = App
App.set :environment, :test

Mail.defaults do
  delivery_method :test
end

Before do
  Mail::TestMailer.deliveries.clear
end

World(MiniTest::Assertions)
