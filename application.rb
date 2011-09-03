require 'rubygems'
require 'bundler'
Bundler.require
require 'models/connection'

# DataMapper.auto_upgrade!

class Application < Sinatra::Base
  
  register Jammit 
  #::RAILS_ENV = "development"
  Jammit.load_configuration("assets.yml")
  register Padrino::Helpers
  
  get '/' do
    erb :front
  end

  #   404
  #---------------------------------------

  not_found do
    erb :notfound
  end
  
end



