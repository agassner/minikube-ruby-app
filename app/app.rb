require 'sinatra'
require 'sinatra/base'
require 'json'
require_relative 'covid19api'

class App < Sinatra::Base
  configure do
    enable :logging
  end

  covid19Api = Covid19Api.new

  get '/' do
    'Hello, World!'
  end

  get '/countries' do
    content_type :json
    covid19Api.countries.parsed_response.to_json
  end

  get '/summary' do
    content_type :json
    covid19Api.summary.parsed_response.to_json
  end

  get '/stats' do
    content_type :json
    covid19Api.stats.parsed_response.to_json
  end

end