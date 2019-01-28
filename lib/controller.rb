require 'bundler'
Bundler.require
require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
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

	get '/gossips/:id' do
		#@profil = all_gossips.select do |gossip|
		#gossip.id == params[:id]
		#end.first
		id_value = params[:id]
		puts id_value
		id_value_int = id_value.to_i-1
		puts id_value_int
		tab_gossip = []
		tab_gossip = Gossip.all
		"potin numero #{id_value} auteur #{tab_gossip[id_value_int].author} : #{tab_gossip[id_value_int].content}"
		
		#erb :gossips/gossi
	end  

end


