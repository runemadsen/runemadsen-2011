require 'rubygems'
require 'bundler'
Bundler.require
require 'models/connection'

# DataMapper.auto_upgrade!

class Application < Sinatra::Base
  
  #   Setup assetpack
  #---------------------------------------
  
  set :root, File.dirname(__FILE__)
  register Sinatra::AssetPack
  register Padrino::Helpers

  assets {
    serve '/javascripts', :from => 'assets/javascripts'
    serve '/stylesheets', :from => 'assets/stylesheets'
    serve '/images', :from => 'assets/images'

    js :front, ['/javascripts/vendor/**/*.js', '/js/app/**/*.js']

    css :application, ['/stylesheets/reset.css', '/stylesheets/runemadsen.css']

    js_compression  :jsmin      # Optional
    css_compression :sass       # Optional
  }
    
  #   Home
  #---------------------------------------
  
  get '/' do
    erb :front
  end

  #   404
  #---------------------------------------

  not_found do
    erb :notfound
  end
  
end



