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
		#initialise la classe gossip avec comme argument (les infos du formulaire) parametres 
		#du fichier new_gossip.erb rentrés par l'utilisateur
		#.save Il enregistre ces informations dans un fichier csv grâce à notre classe gossip
		Gossip.new(params[:gossip_author], params[:gossip_content]).save
		#redirige l'utilisateur vers la page d'acceuil
		redirect '/'
	end

	get '/' do 
		#permet d'insérer dans notre fichier ERB des variables que l'on utilisera dans la vue.
		erb :index, locals: {gossips: Gossip.all}
	end

end


