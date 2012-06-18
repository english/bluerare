require 'sinatra/base'
require_relative '../../app.rb'
require 'mail'
require 'capybara/cucumber'

Sinatra::Application.set :environment, :test
Capybara.app = Sinatra::Application

Mail.defaults do
  delivery_method :test
end
