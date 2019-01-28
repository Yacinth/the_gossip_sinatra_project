require 'bundler'
Bundler.require
require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index
	end

	get '/gossips/new/' do
		erb :new_gossip
	end
	
	post '/gossips/new/' do
		Gossip.new(params[:gossip_autor], params[:gossip_content]).save
		
		redirect '/'
	end

end


