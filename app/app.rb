require 'sinatra'
require 'sinatra/base'

class App < Sinatra::Base
  configure do
    enable :logging
  end

  get '/' do
    'Hello, World!'
  end
end